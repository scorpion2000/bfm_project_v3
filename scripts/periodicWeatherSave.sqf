while {true} do {
	sleep 600;

	[] remoteExec ["bfm_fnc_saveWeather", 2, false];
};