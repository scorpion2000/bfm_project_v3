params ["_exists", "_name"];

if (_exists) then {
	titleFadeOut 3;
	sleep 3;
	titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>Welcome back, %1!</t>", _name], "PLAIN DOWN", 1, false, true];
	sleep 3;
	titleFadeOut 1;
} else {
	titleFadeOut 1;
	titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>Welcome to the battlefield, %1!</t>", _name], "BLACK FADED", 6, false, true];
	sleep 3;
	titleFadeOut 1;
}
