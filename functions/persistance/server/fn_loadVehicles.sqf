_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;

//_allKeys = ["getKeys", "vehicles"] call _inidbi;
_vehicleArray = [];
VEH_IND_COUNT = 0;

_index = ["read", ["vehicles", "index"]] call _inidbi;

if (str _index == "false") exitWith {
	missionNamespace setVariable ["vehicleList", _vehicleArray];
	missionNamespace setVariable ["loadingVehicles", false];
};

for "_i" from 0 to _index do {
	_vehicleDBid = ["BFM_Vehicles\vehicle",_i] joinString "_";
	_inidbVehicle = ["new", _vehicleDBid] call OO_INIDBI;
	if ("exists" call _inidbVehicle) then {
		_type = 			["read", ["vehicle", "type"]] call _inidbVehicle;
		_position = 		["read", ["vehicle", "position"]] call _inidbVehicle;
		_direction = 		["read", ["vehicle", "direction"]] call _inidbVehicle;
		_fuel = 			["read", ["vehicle", "fuel"]] call _inidbVehicle;
		_damage = 			["read", ["vehicle", "damage"]] call _inidbVehicle;
		_allHPdamage = 		["read", ["vehicle", "allHPdamage"]] call _inidbVehicle;
		_magazines = 		["read", ["vehicle", "magazines"]] call _inidbVehicle;
		_magazinesCargo = 	["read", ["vehicle", "magazinesCargo"]] call _inidbVehicle;
		_items = 			["read", ["vehicle", "items"]] call _inidbVehicle;
		_weapons = 			["read", ["vehicle", "weapons"]] call _inidbVehicle;
		_backpacks = 		["read", ["vehicle", "backpacks"]] call _inidbVehicle;

		_vehicle = createVehicle [_type, [0,0,10], [], 0, "CAN_COLLIDE"];
		_vehicle setDir _direction;
		_vehicle setPosATL _position;
		_vehicle setFuelCargo _fuel;
		_vehicle setDamage _damage;
		_hasCrewSpot = fullCrew [_vehicle, "", true];
		if (count _hasCrewSpot != 0) then {
			{
				_vehicle setHitIndex [_forEachIndex, _x, false];
			} forEach _allHPdamage#2;

			
			_vehicle setVehicleAmmo 0;
			{_vehicle addMagazine [(_x select 0), (_x select 1)]} forEach _magazines;
		} else {
			[_vehicle, true, [0, 3, 1], 10] call ace_dragging_fnc_setCarryable;
		};
		//Clear inventory
		clearMagazineCargoGlobal _vehicle; clearWeaponCargoGlobal _vehicle; clearBackpackCargoGlobal _vehicle; clearItemCargoGlobal _vehicle;
		
		{systemChat format ["[%1, %2]", _x, ((_magazines select 1) select _forEachIndex)];	} forEach (_magazines select 0);

		{_vehicle addMagazineCargoGlobal 	[_x, ((_magazines select 1) select _forEachIndex)];	} forEach (_magazines select 0);
		{_vehicle addItemCargoGlobal 		[_x, ((_items select 1) select _forEachIndex)];		} forEach (_items select 0);
		{_vehicle addWeaponCargoGlobal 		[_x, ((_weapons select 1) select _forEachIndex)];	} forEach (_weapons select 0);
		{_vehicle addBackpackCargoGlobal 	[_x, ((_backpacks select 1) select _forEachIndex)];	} forEach (_backpacks select 0);
		
		_vehicle setVariable ["vehicleIndex", str _i];
		missionNamespace setVariable [format ["vehicle_%1", _i], _vehicle];
		_vehicleArray pushback _vehicle;
		if (count _hasCrewSpot != 0) then {
			_vehicle addEventHandler ["GetIn", {
				[(_this select 0)] remoteExec ["bfm_fnc_saveVehicle", 2, false];
				[(_this select 2)] remoteExec ["bfm_fnc_savePlayerStats", 2, false];
			}];
			_vehicle addEventHandler ["GetOut", {
				[(_this select 0)] remoteExec ["bfm_fnc_saveVehicle", 2, false];
				[(_this select 2)] remoteExec ["bfm_fnc_savePlayerStats", 2, false];
			}];
		};
		_vehicle addEventHandler ["Killed", {
			[(_this select 0)] remoteExec ["bfm_fnc_deleteVehicle", 2, false];
		}];

		VEH_IND_COUNT = _i + 1;
	};
};

missionNamespace setVariable ["vehicleList", _vehicleArray];
missionNamespace setVariable ["loadingVehicles", false];