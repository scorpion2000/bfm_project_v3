params ["_areaObject"];

systemChat format ["Activating %1", _areaObject getVariable "sectionName"];

_areaObject setVariable ["isActive", true];
[_areaObject] remoteExec ["bfm_fnc_checkForAreaDeactivation", 2, false];
[_areaObject] remoteExec ["bfm_fnc_deployResourcesInArea", 2, false];

[] remoteExec ["bfm_fnc_saveAreas", 2, false];