params ["_vehicle"];

if (_vehicle getVariable ["vehicleIndex", "-1"] != "-1") then {
	_vehicleID = _vehicle getVariable ["vehicleIndex", "-1"];
	_vehicleDBid = ["BFM_VehicleInventories\vehicle",_vehicleID] joinString "_";
	systemChat str _vehicleDBid;
	_inidbi = ["new", _vehicleDBid] call OO_INIDBI;

	getMagazineCargo _vehicle;
	getItemCargo _vehicle;
	getWeaponCargo _vehicle;
	getBackpackCargo _vehicle;

	["write",["vehicle","magazines",getMagazineCargo _vehicle]] call _inidbi;
	["write",["vehicle","items",getItemCargo _vehicle]] call _inidbi;
	["write",["vehicle","weapons",getWeaponCargo _vehicle]] call _inidbi;
	["write",["vehicle","backpacks",getBackpackCargo _vehicle]] call _inidbi;
};
