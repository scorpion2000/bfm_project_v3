params ["_vehicle"];
_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;

if (_vehicle getVariable ["vehicleIndex", "-1"] == "-1") then {
	_vehicle setVariable ["vehicleIndex", str VEH_IND_COUNT];
	missionNameSpace setVariable [format ["vehicle_%1", VEH_IND_COUNT], _vehicle];
	[
		"write",
		[
			"vehicles", 
			VEH_IND_COUNT, 
			[
				typeOf _vehicle, 
				getposATL _vehicle, 
				getDir _vehicle, 
				getFuelCargo _vehicle,
				damage _vehicle,
				getAllHitPointsDamage _vehicle,
				magazinesAmmo _vehicle
			]
		]
	] call _inidbi;
	[_vehicle] remoteExec ["bfm_fnc_saveVehicleInventory", 2, false];
	VEH_IND_COUNT = VEH_IND_COUNT + 1;
	["write", ["vehicles", "index", VEH_IND_COUNT]] call _inidbi;
	_vehicleArray = missionNamespace getVariable ["vehicleList", []];
	_vehicleArray pushBack _vehicle;
	missionNamespace setVariable ["vehicleList", _vehicleArray];
	_hasCrewSpot = fullCrew [_vehicle, "", true];
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
	[
		"write",
		[
			"vehicles", 
			parseNumber (_vehicle getVariable "vehicleIndex"), 
			[
				typeOf _vehicle, 
				getpos _vehicle, 
				getDir _vehicle, 
				getFuelCargo _vehicle,
				damage _vehicle,
				getAllHitPointsDamage _vehicle,
				magazinesAmmo _vehicle
			]
		]
	] call _inidbi;
}