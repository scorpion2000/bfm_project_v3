params ["_category", "_constructionID"];

if (_constructionID == -1) then {
	_constructionID = missionNamespace getVariable ["bfm_opf_constructionCount", 0];
};

_origin = [] call bfm_fnc_findSafePositionOnMap;
_origionObject = createVehicle ["VR_3DSelector_01_default_F", _origin, [], 0, "CAN_COLLIDE"];

_terrainObjects = nearestTerrainObjects [_origin, [], 55, false];
_spawnObjects = [];
_validCategory = true;

switch (_category) do {
	case "small": { _spawnObjects = opf_smallOutpost; };
	case "lookout": { _spawnObjects = opf_lookoupPost; };
	default { _validCategory = false; };
};
if (!_validCategory) exitWith {};

{
	_type = _x select 0;
	_relPosition = _x select 1;
	_direction = _x select 2;
	_position = _origionObject modelToWorld _relPosition;
	_position = [_position select 0, _position select 1, 0];

	_object = createVehicle [_type, [0,0,10], [], 0, "CAN_COLLIDE"];
	if (_object buildingPos -1 isEqualTo []) then {
		[_object] call BIS_fnc_replaceWithSimpleObject;
	} else {
		_object enableDynamicSimulation true;
	};
	//_object enableSimulation false;
	//_object = [_type, [0,0,10], 0, false, false, false] call BIS_fnc_createSimpleObject;
	_object setPosATL _position;
	_object setDir (_direction + 180);

	sleep 0.05;
} forEach _spawnObjects;
{hideObjectGlobal _x; sleep 0.05; systemChat str _x} forEach _terrainObjects;

deleteVehicle _origionObject;
missionNamespace setVariable ["bfm_opf_constructionCount", _constructionID];
[_category, _constructionID] remoteExec ["bfm_fnc_saveOpfConstruction", 2, false];