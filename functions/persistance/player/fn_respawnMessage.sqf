params ["_name"];
titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You are being respawned!</t>"], "BLACK FADED", -1, false, true];

_random = round (random 27);
switch (_random) do {
	case 0: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Make sure this doesn't happen again!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 1: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Better luck next time!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 2: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Next time, try not to get shot!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 3: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Report back to your higher up!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 4: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Go back and get them, soldier!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 5: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Don't forget to pick up your supplies!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 6: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Remember, hiding behind cover is better than death!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 7: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Oh hello soldier #%2!</t>", _name, round random ([10000, 100000, 1000000])], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 8: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Must've been a Natural 1!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 9: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Don't forget to suppress the AI, it really does work!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 10: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Make sure you're not using blank rounds!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 11: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Nice weather!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 12: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Don't forget, bullets *can* kill you!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 13: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>I hope this wasn't intentional!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 14: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Try not to carry over 25kg, that's what vehicles are for!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 15: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>HOLY FUCKING SHIT, IT'S %1, OH MY GOD, WHAT THE FUCK!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 16: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Not all of these texts are funny!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 17: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Better pick up the pace!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 18: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>It's a bird! It's a plane! No, it's your corpse glithing in the sky!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 19: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>You should really work on this whole staying alive thing!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 20: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>We're in this together! Especially you!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 20: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Whose a fresh soldier? YOU ARE!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 21: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>If things are looking really hard, try looking for the secret nuke launcher!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 22: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>You look familiar, I think I saw your twin die on the battlefield!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 23: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Every death is a step toward progress!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 24: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Your corpse makes a fine addition to the zombie army!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 25: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>Wow, that was.. unexpected!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 26: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>We both know you can do better than that!</t>", _name], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	case 27: {
		sleep 3;
		titleText [ format ["<t size='2.0' colorLink='#0000ff' font='PuristaBold'>You've been respawned!<br/>%2 hid some bananas on the frontlines, somewhere!</t>", _name, name (selectRandom allPlayers)], "BLACK FADED", 6, false, true];
		sleep 3;
		titleFadeOut 1;
	};
	default { };
};