params ["_areaObject"];

systemChat format ["Deactivating %1", _areaObject getVariable "sectionName"];

_areaObject setVariable ["isActive", false];

[] remoteExec ["bfm_fnc_saveAreas", 2, false];