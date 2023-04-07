params ["_areaObject"];

_areaTrigger = missionNamespace getVariable (_areaObject getVariable "trigger");
_hasPlayersinIt = true;
while {_hasPlayersinIt} do {
	sleep 10;

	_hasPlayersinIt = false;
	{
		if (_x inArea _areaTrigger) then { _hasPlayersinIt = true; break; }; 
	} forEach allPlayers;
};

[_areaObject] remoteExec ["bfm_fnc_deactivateArea", 2, false];