params ["_areaObject"];

systemChat format ["Deactivating %1", _areaObject getVariable "sectionName"];

_areaObject setVariable ["isActive", false];
[_areaObject] remoteExec ["bfm_fnc_despawnResourcesInArea", 2, false];

[] remoteExec ["bfm_fnc_saveAreas", 2, false];