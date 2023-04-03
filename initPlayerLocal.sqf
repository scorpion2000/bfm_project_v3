enableEnvironment [false, true];

titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You are being deployed to the battlefield!</t>"], "BLACK FADED", -1, false, true];

disableUserInput true;
sleep 3;
_missionIsLoading = missionNamespace getVariable ["missionLoading", false];
if (_missionIsLoading) then {
	sleep 2;
	_missionIsLoading = missionNamespace getVariable ["missionLoading", false];
};

player addEventHandler ["Killed", {
	[str (getPlayerUID (_this select 0))] remoteExec ["bfm_fnc_deletePlayer", 2, false];
}];

sleep 1;

[player] remoteExec ["bfm_fnc_loadPlayerStats", 2, false];
disableUserInput false;
[] execVM "scripts\restrictVehicleByWeight.sqf";
[] execVM "scripts\quickLoadout.sqf";
[] execVM "scripts\addAceActions.sqf";