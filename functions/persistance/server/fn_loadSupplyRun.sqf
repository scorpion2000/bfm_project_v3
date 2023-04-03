_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;
_keysArray = ["getKeys", "SupplyRuns"] call _inidbi;

{
	_result = (["read", ["SupplyRuns", _x]] call _inidbi);
	if (_x == "supplyRunCount") then { 
		missionNamespace setVariable ["supplyRunCount", _result]
	} else {
		_fromArea = _result#0;
		_toArea = _result#1;
		_type = _result#2;
		_amount = _result#3;
		_truckPosition = _result#4;
		_movingTo = _result#5;
		_supplyRunID = _result#6;
		_direction = _result#7;

		[_fromArea, _toArea, _type, _amount, _truckPosition, _movingTo, _supplyRunID, _direction] remoteExec ["bfm_fnc_createSupplyRun", 2, false];
	};
} forEach _keysArray;