params ["_fromArea", "_toArea", "_type", "_amount", "_truckPosition", "_movingTo", "_supplyRunID", "_direction"];

_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;
["write", ["SupplyRuns", "supplyRunCount", (missionNamespace getVariable "supplyRunCount")]] call _inidbi;

supplyRunArray = [
	_fromArea,
	_toArea,
	_type,
	_amount,
	_truckPosition,
	_movingTo,
	_supplyRunID,
	_direction
];

["write", ["SupplyRuns", _supplyRunID, supplyRunArray]] call _inidbi;