/* NOTE: this function should only recieve vehicles that are saved in the database */

params ["_vehicle"];
_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;

_vehicleArray = missionNamespace getVariable ["vehicleList", []];
_vehicleArray deleteAt (_vehicleArray find _vehicle);
missionNamespace setVariable ["vehicleList", _vehicleArray];

_index = _vehicle getVariable "vehicleIndex";
["deleteKey", ["vehicles", _index]] call _inidbi;