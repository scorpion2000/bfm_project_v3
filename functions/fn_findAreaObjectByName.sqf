params ["_name"];

_areaObjects = missionNamespace getVariable ["bfm_areas", []];
_areaObject = objNull;
{
	if (_x getVariable "sectionName" == _name) exitWith {
		_areaObject = _x;
	}
} forEach _areaObjects;

_areaObject