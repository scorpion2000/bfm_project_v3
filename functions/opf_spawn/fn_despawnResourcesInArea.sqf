params ["_areaObject"];

_isSpawning = _areaObject getVariable "BFM_Spawning";

while {_isSpawning} do {
	_isSpawning = _areaObject getVariable "BFM_Spawning";
	sleep 5;
};
_allGroups = _areaObject getVariable "BFM_allSpawnedObjects";

{
	_allUnits = units _x;
	_vehicle = vehicle (_allUnits select 0);
	if (_vehicle != (_allUnits select 0) && alive _vehicle) then {
		deleteVehicle _vehicle;
	};

	{
		deleteVehicle _x;
	} forEach _allUnits;
} forEach _allGroups;