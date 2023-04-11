params ["_areaObject"];

_areaObject setVariable ["BFM_Spawning", true];

_multiPurpuseSoldiers = _areaObject getVariable "multiPurpuseSoldier";
_tanks = _areaObject getVariable "tank";
_apcs = _areaObject getVariable "apc";
_armedVehicles = _areaObject getVariable "armedVehicle";
_aaGuns = _areaObject getVariable "aaGun";
_atGuns = _areaObject getVariable "atGun";
_staticGuns = _areaObject getVariable "staticGun";
_transportVehicle = _areaObject getVariable "transportVehicle";

_areaTrigger = missionNamespace getVariable (_areaObject getVariable "trigger");
_areaMarker = _areaObject getVariable "markerName";

_allSpawnedGroups = [];	//Keep in mind we need to delete them when the area becomes inactive
_staticObjects = _areaObject getVariable "staticObjects";

_areaPosition = markerPos _areaMarker;
_buildings = nearestObjects [_areaPosition, ["Building", "House"], 500];
_unitsToSpawn = floor (_multiPurpuseSoldiers*0.4);
_multiPurpuseSoldiers = _multiPurpuseSoldiers - _unitsToSpawn;
_previousBuildingPos = [0,0,0];
{
	if (_unitsToSpawn < 24) then { break; };
	_score = 0;
	_score = _score + ([_x] call BFM_fnc_scoreBuilding);
	_score = _score + (count (_x buildingPos -1));

	if (count(_x buildingPos -1) > 1 && _score >= 10 && _previousBuildingPos distance2D (getPosATL _x) > 50) then {
		_diceRoll = random 100;
		//10% spawn chance (0 inclusive)
		_group = createGroup EAST;
		_availablePositions = _x buildingPos -1;
		for "_i" from 0 to ((count _availablePositions) / 4) do {
			if (_unitsToSpawn <= 0) then { break; };
			_position = selectRandom _availablePositions;
			_availablePositions deleteAt (_availablePositions find _position);

			_unit = _group createUnit [selectRandom opf_basic, [0,0,0], [], 0, "CAN_COLLIDE"];
			_unit setPosATL _position;
			_unit setUnitPos "UP";
			_unit disableAI "PATH";

			_unit setVariable ["BFM_AreaKilledIn", _areaObject];
			_unit addEventHandler ["Killed", {
				params ["_unit", "_killer", "_instigator", "_useEffects"];
				_area = _unit getVariable "BFM_AreaKilledIn";
				[_area, "multiPurpuseSoldier", 1] remoteExec ["bfm_fnc_subtractFromAreaResource", 2, false];
			}];

			_unitsToSpawn = _unitsToSpawn - 1;
		};
		_allSpawnedGroups pushBack _group;
		_group setBehaviour "SAFE";

		_previousBuildingPos = getPosATL _x;
	};
	sleep 0.1;
} forEach _buildings;

//We first create a few patrols
if (_multiPurpuseSoldiers > 0) then {
	_randomPatrolAmount = (random 4) + 2;	//from 0 to 2, 0 is inclusive, 2 is not so + 1
	while {floor (_multiPurpuseSoldiers / 4) >= 1 && _randomPatrolAmount > 0} do {
		_group = createGroup EAST;
		_randomSpawnPoint = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;

		_groupLeader = _group createUnit [selectRandom opf_command, _randomSpawnPoint, [], 0, "NONE"];
		_groupLeader setVariable ["BFM_AreaKilledIn", _areaObject];
		_groupLeader setVariable ["BFM_ObjectCategory", "multiPurpuseSoldier"];
		for "_x" from 0 to 3 do {
			_diceRoll = random 100;
			_unit = objNull;
			if (_diceRoll > 40) then {
				_unit = _group createUnit [selectRandom opf_regular, [_randomSpawnPoint#0 + random 3, _randomSpawnPoint#1 + random 3, _randomSpawnPoint#2], [], 0, "NONE"];
			} else {
				_unit = _group createUnit [selectRandom opf_basic, [_randomSpawnPoint#0 + random 3, _randomSpawnPoint#1 + random 3, _randomSpawnPoint#2], [], 0, "NONE"];
			};
			_unit setVariable ["BFM_AreaKilledIn", _areaObject];
			_unit setVariable ["BFM_ObjectCategory", "multiPurpuseSoldier"];
		};
		for "_i" from 0 to (random 4) + 1 do {
			_waypointPos = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;
			_wp = _group addWaypoint [_waypointPos, 0];
			_wp setWaypointSpeed "LIMITED";
		};
		_wp = _group addWaypoint [GetPosATL _groupLeader, 0];
		_wp setWaypointType "CYCLE";

		_group setBehaviour "SAFE";
		_allSpawnedGroups pushBack _group;

		//_randomPatrolAmount = _randomPatrolAmount - 1;
		_multiPurpuseSoldiers = _multiPurpuseSoldiers - 4;
	};
};

while {_multiPurpuseSoldiers > 0} do {
	_group = createGroup EAST;
	_randomSpawnPoint = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;
	for "_x" from 0 to (random 2) + 2 do {
		if (_multiPurpuseSoldiers <= 0) then {break;};
		_unit = objNull;

		_diceRoll = random 100;
		if (_diceRoll > 40) then {
			_unit = _group createUnit [selectRandom opf_regular, _randomSpawnPoint, [], 0, "NONE"];
		} else {
			_unit = _group createUnit [selectRandom opf_basic, _randomSpawnPoint, [], 0, "NONE"];
		};

		_unit setVariable ["BFM_AreaKilledIn", _areaObject];
		_unit setVariable ["BFM_ObjectCategory", "multiPurpuseSoldier"];
		_multiPurpuseSoldiers = _multiPurpuseSoldiers - 1;
	};
	_group setBehaviour "SAFE";
	_allSpawnedGroups pushBack _group;
};

//WE FIRST LOAD STATICS
{
	_typeOf = (_x select 0);
	_position = (_x select 1);
	_rotation = (_x select 2);
	_category = (_x select 3);

	_vehicle = createVehicle [_typeOf, [0, 0, 20], [], 0, "NONE"];
	_vehicle setDir _rotation;
	_vehicle setPosATL _position;
	clearMagazineCargoGlobal _vehicle; clearWeaponCargoGlobal _vehicle; clearBackpackCargoGlobal _vehicle; clearItemCargoGlobal _vehicle;
	_group = createVehicleCrew _vehicle;
	_group setBehaviour "SAFE";
	_allSpawnedGroups pushBack _group;

	
	_vehicle setVariable ["BFM_AreaKilledIn", _areaObject];
	_vehicle setVariable ["BFM_ObjectCategory", _category];
	_vehicle setVariable ["BFM_IsStatic", _category];

	switch (_category) do {
		case "tank": { _tanks = _tanks - 1; };
		case "apc": { _apcs = _apcs - 1; };
		case "armedVehicle": { _armedVehicles = _armedVehicles - 1; };
		case "staticGun": { _staticGuns = _staticGuns - 1; };
		case "atGun": { _atGuns = _atGuns - 1; };
		case "aaGun": { _aaGuns = _aaGuns - 1; };
		default { systemChat "Unrecognized category"; };
	};
} forEach _staticObjects;

while {_tanks > 0} do {
	_randomSpawnPoint = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;
	_randomSpawnPoint = [_randomSpawnPoint, 0, 200, 2, 0, 0.25, 0] call BIS_fnc_findSafePos;
	_tank = createVehicle [selectRandom opf_Tank, _randomSpawnPoint, [], 0, "NONE"];
	clearMagazineCargoGlobal _tank; clearWeaponCargoGlobal _tank; clearBackpackCargoGlobal _tank; clearItemCargoGlobal _tank;
	_tank setDir random 359;
	_group = createVehicleCrew _tank;
	_group setBehaviour "SAFE";
	_allSpawnedGroups pushBack _group;

	_tank setVariable ["BFM_AreaKilledIn", _areaObject];
	_tank setVariable ["BFM_ObjectCategory", "tank"];
	_tank setVariable ["BFM_IsStatic", "tank"];

	_staticObjects pushBack [typeOf _tank, getPosATL _tank, getDir _tank, "tank"];

	_tanks = _tanks - 1;
};

while {_apcs > 0} do {
	_group = createGroup EAST;
	_randomSpawnPoint = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;
	_randomSpawnPoint = [_randomSpawnPoint, 0, 200, 2, 0, 0.25, 0] call BIS_fnc_findSafePos;
	_apc = createVehicle [selectRandom opf_APC, _randomSpawnPoint, [], 0, "NONE"];
	clearMagazineCargoGlobal _apc; clearWeaponCargoGlobal _apc; clearBackpackCargoGlobal _apc; clearItemCargoGlobal _apc;
	_apc setDir random 359;
	_group = createVehicleCrew _apc;
	_group setBehaviour "SAFE";
	_allSpawnedGroups pushBack _group;

	_apc setVariable ["BFM_AreaKilledIn", _areaObject];
	_apc setVariable ["BFM_ObjectCategory", "apc"];
	_apc setVariable ["BFM_IsStatic", "apc"];

	_staticObjects pushBack [typeOf _apc, getPosATL _apc, getDir _apc, "apc"];

	_apcs = _apcs - 1;
};

while {_armedVehicles > 0} do {
	_group = createGroup EAST;
	_randomSpawnPoint = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;
	_randomSpawnPoint = [_randomSpawnPoint, 0, 200, 2, 0, 0.25, 0] call BIS_fnc_findSafePos;
	_armedVehicle = createVehicle [selectRandom opf_motorized, _randomSpawnPoint, [], 0, "NONE"];
	clearMagazineCargoGlobal _armedVehicle; clearWeaponCargoGlobal _armedVehicle; clearBackpackCargoGlobal _armedVehicle; clearItemCargoGlobal _armedVehicle;
	_armedVehicle setDir random 359;
	_group = createVehicleCrew _armedVehicle;
	_group setBehaviour "SAFE";
	_allSpawnedGroups pushBack _group;

	_armedVehicle setVariable ["BFM_AreaKilledIn", _areaObject];
	_armedVehicle setVariable ["BFM_ObjectCategory", "armedVehicle"];
	_armedVehicle setVariable ["BFM_IsStatic", "armedVehicle"];

	_staticObjects pushBack [typeOf _armedVehicle, getPosATL _armedVehicle, getDir _armedVehicle, "armedVehicle"];

	_armedVehicles = _armedVehicles - 1;
};

while {_staticGuns > 0} do {
	_group = createGroup EAST;
	_randomSpawnPoint = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;
	_randomSpawnPoint = [_randomSpawnPoint, 0, 200, 2, 0, 0.1, 0] call BIS_fnc_findSafePos;
	_staticGun = createVehicle [selectRandom opf_staticGuns, _randomSpawnPoint, [], 0, "NONE"];
	clearMagazineCargoGlobal _staticGun; clearWeaponCargoGlobal _staticGun; clearBackpackCargoGlobal _staticGun; clearItemCargoGlobal _staticGun;
	_relativeRotation = [_staticGun, _areaPosition] call BIS_fnc_relativeDirTo;
	_staticGun setDir (getDir _staticGun) + _relativeRotation;
	_staticGun setDir (getDir _staticGun) + 180;
	_group = createVehicleCrew _staticGun;
	_group setBehaviour "SAFE";
	_allSpawnedGroups pushBack _group;

	_staticGun setVariable ["BFM_AreaKilledIn", _areaObject];
	_staticGun setVariable ["BFM_ObjectCategory", "staticGun"];
	_staticGun setVariable ["BFM_IsStatic", "staticGun"];

	_staticObjects pushBack [typeOf _staticGun, getPosATL _staticGun, getDir _staticGun, "staticGun"];

	_staticGuns = _staticGuns - 1;
};

while {_aaGuns > 0} do {
	_group = createGroup EAST;
	_randomSpawnPoint = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;
	_randomSpawnPoint = [_randomSpawnPoint, 0, 200, 2, 0, 0.1, 0] call BIS_fnc_findSafePos;
	_aaGun = createVehicle [selectRandom opf_staticAA, _randomSpawnPoint, [], 0, "NONE"];
	clearMagazineCargoGlobal _aaGun; clearWeaponCargoGlobal _aaGun; clearBackpackCargoGlobal _aaGun; clearItemCargoGlobal _aaGun;
	_relativeRotation = [_aaGun, _areaPosition] call BIS_fnc_relativeDirTo;
	_aaGun setDir (getDir _aaGun) + _relativeRotation;
	_aaGun setDir (getDir _aaGun) + 180;
	_group = createVehicleCrew _aaGun;
	_group setBehaviour "SAFE";
	_allSpawnedGroups pushBack _group;

	_aaGun setVariable ["BFM_AreaKilledIn", _areaObject];
	_aaGun setVariable ["BFM_ObjectCategory", "aaGun"];
	_aaGun setVariable ["BFM_IsStatic", "aaGun"];

	_staticObjects pushBack [typeOf _aaGun, getPosATL _aaGun, getDir _aaGun, "aaGun"];

	_aaGuns = _aaGuns - 1;
};

while {_atGuns > 0} do {
	_group = createGroup EAST;
	_randomSpawnPoint = [[_areaMarker], ["water"]] call BIS_fnc_randomPos;
	_randomSpawnPoint = [_randomSpawnPoint, 0, 200, 2, 0, 0.1, 0] call BIS_fnc_findSafePos;
	_atGun = createVehicle [selectRandom opf_staticAT, _randomSpawnPoint, [], 0, "NONE"];
	clearMagazineCargoGlobal _atGun; clearWeaponCargoGlobal _atGun; clearBackpackCargoGlobal _atGun; clearItemCargoGlobal _atGun;
	_relativeRotation = [_atGun, _areaPosition] call BIS_fnc_relativeDirTo;
	_atGun setDir (getDir _atGun) + _relativeRotation;
	_atGun setDir (getDir _atGun) + 180;
	_group = createVehicleCrew _atGun;
	_group setBehaviour "SAFE";
	_allSpawnedGroups pushBack _group;

	_atGun setVariable ["BFM_AreaKilledIn", _areaObject];
	_atGun setVariable ["BFM_ObjectCategory", "atGun"];
	_atGun setVariable ["BFM_staticCategory", "atGun"];

	_staticObjects pushBack [typeOf _atGun, getPosATL _atGun, getDir _atGun, "atGun"];

	_atGuns = _atGuns - 1;
};

_areaObject setVariable ["BFM_allSpawnedObjects", _allSpawnedGroups];
_areaObject setVariable ["staticObjects", _staticObjects];
_areaObject setVariable ["BFM_Spawning", false];