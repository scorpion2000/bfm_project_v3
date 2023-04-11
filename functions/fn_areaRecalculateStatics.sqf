params ["_areaObject"];

_allAreaObjects = _areaObject getVariable "BFM_allSpawnedObjects";
_staticObjects = [];
systemChat "recalculating";
{
	_vehicle = vehicle ((units _x) select 0);
	_category = _vehicle getVariable ["BFM_IsStatic", "false"];
	if (_category != "false" && alive _vehicle) then {
		systemChat "bravo";
		_staticObjects pushBack [typeOf _vehicle, getPosATL _vehicle, getDir _vehicle, _category];
	};
} forEach _allAreaObjects;

_areaObject setVariable ["staticObjects", _staticObjects];