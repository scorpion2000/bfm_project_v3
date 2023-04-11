while {true} do {
	_overcastRandom = selectRandom [0, random 1];
	_fogRandom = selectRandom [0,0,0,0 random 0.45];
	_rainRadom = selectRandom [0,0 random 1];

	600 setFog _fogRandom;
	600 setOvercast _overcastRandom;
	if (_overcastRandom > 0) then { 600 setRain _rainRadom };
	sleep 600;

	
	1800 setRain 0;
	1800 setFog 0;
	1800 setOvercast 0;
	sleep 1800;
};