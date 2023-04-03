params ["_vehicle", "_vehicleID"];

_vehicleDBid = ["BFM_VehicleInventories\vehicle",_vehicleID] joinString "_";
_inidbi = ["new", _vehicleDBid] call OO_INIDBI;
_magazines = ["read", ["vehicle", "magazines"]] call _inidbi;
_items = ["read", ["vehicle", "items"]] call _inidbi;
_weapons = ["read", ["vehicle", "weapons"]] call _inidbi;
_backpacks = ["read", ["vehicle", "backpacks"]] call _inidbi;

{
	_vehicle addMagazineCargoGlobal [_x, ((_magazines select 1) select _forEachIndex)];
} forEach (_magazines select 0);
sleep 0.1;
{
	_vehicle addItemCargoGlobal [_x, ((_items select 1) select _forEachIndex)];
} forEach (_items select 0);
sleep 0.1;
{
	_vehicle addWeaponCargoGlobal [_x, ((_weapons select 1) select _forEachIndex)];
} forEach (_weapons select 0);
sleep 0.1;
{
	_vehicle addBackpackCargoGlobal [_x, ((_backpacks select 1) select _forEachIndex)];
} forEach (_backpacks select 0);