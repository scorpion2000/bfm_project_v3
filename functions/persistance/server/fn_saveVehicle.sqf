params ["_vehicle"];

if (_vehicle getVariable ["vehicleIndex", "-1"] == "-1") then {
	_vehicle setVariable ["vehicleIndex", str VEH_IND_COUNT];
	missionNameSpace setVariable [format ["vehicle_%1", VEH_IND_COUNT], _vehicle];
	VEH_IND_COUNT = VEH_IND_COUNT + 1;
	_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;
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
};

_vehicleID = _vehicle getVariable ["vehicleIndex", "-1"];
_vehicleDBid = ["BFM_Vehicles\vehicle",_vehicleID] joinString "_";
_inidbi = ["new", _vehicleDBid] call OO_INIDBI;
["write",["vehicle","type",typeOf _vehicle]] call _inidbi;
["write",["vehicle","position",getposATL _vehicle]] call _inidbi;
["write",["vehicle","direction",getDir _vehicle]] call _inidbi;
["write",["vehicle","fuel",getFuelCargo _vehicle]] call _inidbi;
["write",["vehicle","damage",damage _vehicle]] call _inidbi;
["write",["vehicle","allHPdamage",getAllHitPointsDamage _vehicle]] call _inidbi;
["write",["vehicle","magazines",magazinesAmmo _vehicle]] call _inidbi;
["write",["vehicle","magazinesCargo",getMagazineCargo _vehicle]] call _inidbi;
["write",["vehicle","items",getItemCargo _vehicle]] call _inidbi;
["write",["vehicle","weapons",getWeaponCargo _vehicle]] call _inidbi;
["write",["vehicle","backpacks",getBackpackCargo _vehicle]] call _inidbi;
systemChat format ["Saved vehicle_%1", _vehicleID];