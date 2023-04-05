_inidbi = ["new", "BFM_OpforDetails"] call OO_INIDBI;

_areaObjects = missionNamespace getVariable ["bfm_areas", []];

{
	_section = _x getVariable ["sectionName", ""];
	if (_section == "") then {systemChat "Something went wrong while saving areas!"; continue};
	["write", [_section, "sectionName", _x getVariable "sectionName"]] call _inidbi;
	["write", [_section, "score", _x getVariable "score"]] call _inidbi;
	["write", [_section, "markerName", _x getVariable "markerName"]] call _inidbi;
	["write", [_section, "trigger", _x getVariable "trigger"]] call _inidbi;
	["write", [_section, "isActive", _x getVariable "isActive"]] call _inidbi;
	["write", [_section, "isTaken", _x getVariable "isTaken"]] call _inidbi;
	["write", [_section, "underAttack", _x getVariable "underAttack"]] call _inidbi;
	["write", [_section, "multiPurpuseSoldier", _x getVariable "multiPurpuseSoldier"]] call _inidbi;
	["write", [_section, "tank", _x getVariable "tank"]] call _inidbi;
	["write", [_section, "apc", _x getVariable "apc"]] call _inidbi;
	["write", [_section, "armedVehicle", _x getVariable "armedVehicle"]] call _inidbi;
	["write", [_section, "aaGun", _x getVariable "aaGun"]] call _inidbi;
	["write", [_section, "atGun", _x getVariable "atGun"]] call _inidbi;
	["write", [_section, "staticGun", _x getVariable "staticGun"]] call _inidbi;
	["write", [_section, "transportVehicle", _x getVariable "transportVehicle"]] call _inidbi;
	["write", [_section, "productionFocus", _x getVariable "productionFocus"]] call _inidbi;
	["write", [_section, "productionLevel", _x getVariable "productionLevel"]] call _inidbi;
	["write", [_section, "minMat", _x getVariable "minMat"]] call _inidbi;
	["write", [_section, "minMan", _x getVariable "minMan"]] call _inidbi;
	["write", [_section, "storedMaterial", _x getVariable "storedMaterial"]] call _inidbi;
	["write", [_section, "storedManpower", _x getVariable "storedManpower"]] call _inidbi;
	["write", [_section, "isCapital", _x getVariable "isCapital"]] call _inidbi;
	["write", [_section, "requestingReinforcements", _x getVariable "requestingReinforcements"]] call _inidbi;
} forEach _areaObjects;