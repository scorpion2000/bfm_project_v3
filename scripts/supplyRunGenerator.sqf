[] remoteExec ["bfm_fnc_loadSupplyRun", 2, false];

while {true} do {
	[] remoteExec ["bfm_fnc_supplySystem", 2, false];
	sleep 300;
};