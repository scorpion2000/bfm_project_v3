params ["_areaObject", "_category", "_subtractAmount"];

systemChat "subtracting";

_multiPurpuseSoldiers = _areaObject getVariable "multiPurpuseSoldier";
_tanks = _areaObject getVariable "tank";
_apcs = _areaObject getVariable "apc";
_armedVehicles = _areaObject getVariable "armedVehicle";
_aaGuns = _areaObject getVariable "aaGun";
_atGuns = _areaObject getVariable "atGun";
_staticGuns = _areaObject getVariable "staticGun";
_transportVehicle = _areaObject getVariable "transportVehicle";

switch (_category) do {
	case "tank": { _tanks = _tanks - _subtractAmount; };
	case "apc": { _apcs = _apcs - _subtractAmount; };
	case "armedVehicle": { _armedVehicles = _armedVehicles - _subtractAmount; };
	case "staticGun": { _staticGuns = _staticGuns - _subtractAmount; };
	case "atGun": { _atGuns = _atGuns - _subtractAmount; };
	case "aaGun": { _aaGuns = _aaGuns - _subtractAmount; };
	case "multiPurpuseSoldier": { _multiPurpuseSoldiers = _multiPurpuseSoldiers - _subtractAmount; };
	case "transportVehicle": { _transportVehicle = _transportVehicle - _subtractAmount; };
	default { systemChat "Unrecognized category"; };
};

_areaObject setVariable ["multiPurpuseSoldier",_multiPurpuseSoldiers];
_areaObject setVariable ["tank",_tanks];
_areaObject setVariable ["apc",_apcs];
_areaObject setVariable ["armedVehicle",_armedVehicles];
_areaObject setVariable ["aaGun",_aaGuns];
_areaObject setVariable ["atGun",_atGuns];
_areaObject setVariable ["staticGun",_staticGuns];
_areaObject setVariable ["transportVehicle",_transportVehicle];