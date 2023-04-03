//Supply run ID is the same as the supply run count
//Also, if _supplyRunID is NOT -1, then we're loading in a supply run
params ["_fromArea", "_toArea", "_type", "_amount", "_spawnPos", "_endPos", "_supplyRunID", "_truckDir"];

_fromAreaPos = nil;
_toAreaPos = nil;
_fromAreaRandomRoad = nil;
_toAreaRoad = nil;
_roadDir = nil;
_fromAreaPos = getMarkerPos ((missionNamespace getVariable _fromArea) select 1);
_toAreaPos = getMarkerPos ((missionNamespace getVariable _toArea) select 1);

hint str _spawnPos;

if (_supplyRunID != -1) then {
	_fromAreaRandomRoad = _spawnPos;
	_toAreaRoad = _endPos;
	_roadDir = _truckDir;
} else {
	_key = missionNamespace getVariable _fromArea;
	if (_type == "mat") then {
		_key set [12, (_key#12 - _amount)];
		_key = missionNamespace setVariable [_fromArea, _key];
	} else {
		_key set [13, (_key#13 - _amount)];
		_key = missionNamespace setVariable [_fromArea, _key];
	};
	[] remoteExec ["bfm_fnc_saveAreas", 2, false];

	_fromAreaRoad = objNull;
	_toAreaRoad = objNull;

	while {isNull _fromAreaRoad} do {
		_fromAreaRandom = [[[], [((missionNamespace getVariable _fromArea) select 1)]], []] call BIS_fnc_randomPos;
		_fromAreaRoad = [_fromAreaRandom, 250] call BIS_fnc_nearestRoad;
	};

	while {isNull _toAreaRoad} do {
		_toAreaRandom = [[[], [((missionNamespace getVariable _toArea) select 1)]], []] call BIS_fnc_randomPos;
		_toAreaRoad = [_toAreaRandom, 250] call BIS_fnc_nearestRoad;
	};
	_toAreaRoad = getPos _toAreaRoad;

	_fromAreaRandomRoad = getPos _fromAreaRoad;
	_roadDir = getDir _fromAreaRoad;

	_supplyRunCount = missionNamespace getVariable ["supplyRunCount", 0];
	_supplyRunCount = _supplyRunCount + 1;
	missionNamespace setVariable ["supplyRunCount", _supplyRunCount];

	_supplyRunID = _supplyRunCount;
};

_truck = (selectRandom opf_suppyTruck) createVehicle _fromAreaRandomRoad;
_truck setDir _roadDir;
_group = createGroup east;
_sold = _group createUnit [(selectRandom opf_logistic), [0, 0, 0], [], 0, "CAN_COLLIDE"];
_sold moveInDriver _truck;
_group setBehaviour "CARELESS";

_wp = _group addWaypoint [_toAreaRoad, 5];

//waitUntil {sleep 1; (_truck distance _wp < 20 || !(alive _truck || alive _sold))};
_waiting = true;
while {_waiting} do {
	sleep 10;
	if ((getPos _truck) distance _toAreaRoad < 20) then {
		_waiting = false;
	};
	if (!alive _truck || !alive _sold) then {
		_waiting = false;
	};

	[_fromArea, _toArea, _type, _amount, (getPos _truck), _toAreaRoad, _supplyRunID, (getDir _truck)] remoteExec ["bfm_fnc_saveSupplyRun", 2, false];
};

if (alive _truck && alive _sold) then {
	deleteVehicle _truck;
	deleteVehicle _sold;

	_key = missionNamespace getVariable _toArea;
	if (_type == "mat") then {
		_key set [12, (_key#12 + _amount)];
		_key = missionNamespace setVariable [_toArea, _key];
	} else {
		_key set [13, (_key#13 + _amount)];
		_key = missionNamespace setVariable [_toArea, _key];
	};
	[] remoteExec ["bfm_fnc_saveAreas", 2, false];
} else {
	systemChat "ded, not big suprise";
};
