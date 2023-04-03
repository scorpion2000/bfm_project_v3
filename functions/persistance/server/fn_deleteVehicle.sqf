params ["_vehicle"];
_inidbi = ["new", "BFM_WorldDetails"] call OO_INIDBI;

_keyIndex = _vehicle getVariable "vehicleIndex";
["deleteKey", ["vehicles", _keyIndex]] call _inidbi;
missionNamespace setVariable [format ["vehicle_%1", _keyIndex], nil];
_vehicleArray = missionNamespace getVariable "vehicleList";
_vehicleArray deleteAt (_vehicleArray find _vehicle);
missionNamespace setVariable ["vehicleList", _vehicleArray];