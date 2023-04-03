_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;
_keysArray = ["getKeys", "destroyed_buildings"] call _inidbi;

DESTROYED_BUILDINGS = 0;
//Old method
/*_centerposition = [worldSize / 2, worldsize / 2, 0];

_asd = [];
_allMObjects = nearestTerrainObjects [_centerposition, [], (worldSize / 2)];
{
	if (_forEachIndex != 0) then {
		//_result = (["read", ["destroyed_buildings", _x]] call _inidbi);
		_key = _result splitString " ";
		if (["#", (_key select 0)] call BIS_fnc_inString) then {
			_key deleteAt 0;
			_key = _key joinString " ";
		};

		systemChat str _key;

		//This method takes forever
		{
			if (((str _x) find _key) != -1) then { _x setDamage [1, false] };
		} forEach _allMObjects;
	};
} forEach _keysArray;*/

//New method
{
	if (_forEachIndex != 0) then {
		_result = (["read", ["destroyed_buildings", _x]] call _inidbi);
		_found = nearestTerrainObjects [[_result#1#0, _result#1#1], [], 10];
		if (_result#0) then {
			(_found select 0) setDamage [1, false];
		} else {
			_pos = getPos (_found select 0);
			_dir = getDir (_found select 0);
			hideObjectGlobal (_found select 0);
			_h = (_result select 2) createVehicle _pos;
			_h setDir _dir;
			_h setDamage [(_result select 3), false];
		}
	};
} forEach _keysArray;
missionNamespace setVariable ["loadingBuildingDamage", false];