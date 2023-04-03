_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;

_allKeys = ["getKeys", "vehicles"] call _inidbi;
_vehicleArray = [];
VEH_IND_COUNT = 0;

{
	sleep 0.1;
	if (_x != "index") then {
		_keyIndex = _x;
		_key = ["read", ["vehicles", _keyIndex]] call _inidbi;
		_vehicle = createVehicle [_key#0, _key#1, [], 0, "CAN_COLLIDE"];
		//systemChat format ["%1, %2, %3", _key#0, _key#1, _vehicle];
		_vehicle setDir _key#2;
		_vehicle setFuelCargo _key#3;
		_vehicle setDamage _key#4;
		 _hasCrewSpot = fullCrew [_vehicle, "", true];
		if (count _hasCrewSpot != 0) then {
			{
				_vehicle setHitIndex [_forEachIndex, _x, false];
			} forEach _key#5#2;
		};
		clearMagazineCargoGlobal _vehicle;
		clearWeaponCargoGlobal _vehicle;
		clearBackpackCargoGlobal _vehicle;
		clearItemCargoGlobal _vehicle;
		_inventory = _key#6;
		{
			_vehicle addMagazineCargoGlobal [_x, 1];
		} forEach (_inventory select 0);
		sleep 0.1;
		{
			_vehicle addItemCargoGlobal [_x, (((_inventory select 1) select 1) select _forEachIndex)];
		} forEach ((_inventory select 1) select 0);
		sleep 0.1;
		{
			_vehicle addWeaponCargoGlobal [_x, 1];
		} forEach (_inventory select 2);
		sleep 0.1;
		{
			_vehicle addBackpackCargoGlobal [_x, (((_inventory select 1) select 1) select _forEachIndex)];
		} forEach ((_inventory select 3) select 0);
		sleep 0.1;
		_vehicle setVehicleAmmo 0;
		{_vehicle addMagazine [(_x select 0), (_x select 1)]} forEach _key#7;
		clearItemCargoGlobal _vehicle;
		_vehicle setVariable ["vehicleIndex", _keyIndex];
		missionNamespace setVariable [format ["vehicle_%1", _keyIndex], _vehicle];
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
	} else {
		_keyIndex = _x;
		_key = ["read", ["vehicles", _keyIndex]] call _inidbi;
		VEH_IND_COUNT = _key;
	}
} forEach _allKeys;

missionNamespace setVariable ["vehicleList", _vehicleArray];
missionNamespace setVariable ["loadingVehicles", false];