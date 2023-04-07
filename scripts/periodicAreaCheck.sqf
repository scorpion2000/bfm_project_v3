while {true} do {
	sleep 10;
	_areaObjects = [getPos player] call BFM_fnc_checkForArea;

	{
		[_x] remoteExec ["bfm_fnc_activateArea", 2, false];
	} forEach _areaObjects;
};