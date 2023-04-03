while {true} do {
	//Making a save every 7.5 seconds
	//Note, we also make a save on disconnects. This is in case the server crashes
	sleep 20;
	
	{
		[_x] remoteExec ["bfm_fnc_savePlayerStats", 2, false];
		sleep 0.2;
	} forEach allPlayers;
};