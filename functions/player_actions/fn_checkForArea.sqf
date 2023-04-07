//This function checks if we're in an area's trigger zone
params ["_playerPosition"];

_allAreas = missionNamespace getVariable ["bfm_areas", []];
_areaObjects = [];

{
	_areaTrigger = missionNamespace getVariable (_x getVariable "trigger");
	if (_playerPosition inArea _areaTrigger && !(_x getVariable "isActive")) then {
		_areaObjects pushback _x;
	}
} forEach _allAreas;

_areaObjects