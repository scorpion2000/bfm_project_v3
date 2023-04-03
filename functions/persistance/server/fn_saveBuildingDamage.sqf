params ["_building", "_newBuilding", "_isDestroyed"];

systemChat str format ["old: %1   |   new: %2", typeof _building, typeof _newBuilding];

_saveArray = [
	_isDestroyed,
	getPos _building,
	typeOf _newBuilding,
	damage _newBuilding
];

_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;
["write", ["destroyed_buildings", "destroyed_building_count", DESTROYED_BUILDINGS]] call _inidbi;
["write", ["destroyed_buildings", DESTROYED_BUILDINGS, _saveArray]] call _inidbi;
DESTROYED_BUILDINGS = DESTROYED_BUILDINGS +1;
