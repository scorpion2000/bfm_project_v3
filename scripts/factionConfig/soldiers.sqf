/*
	Fill these arrays with units
	Easiest way to find a unit name is by hovering over one in the Eden editor under the Assets menu
	For example, Assets/F1/NATO/Men/Autorifleman should say "B_soldier_AR_F"
*/

//Fill this with regular infantry to be used in squad creations
//The script will pull random units from this
opf_regular = [
	"O_Soldier_A_F",
	"O_Soldier_AAR_F",
	"O_Soldier_AR_F",
	"O_medic_F",
	"O_engineer_F",
	"O_Soldier_GL_F",
	"O_HeaveGunner_F",
	"O_soldier_M_F",
	"O_Soldier_AA_F",
	"O_Soldier_AT_F"
];

//Same as opf_regular, but the creation process will favor this one
//Put unit types here you want to spawn frequently in squads, like a simple rifleman
opf_basic = [
	"O_Soldier_F"
];

//This array is specific to squad leader type units
//Every squad will have one of these as the default squad leader
opf_command = [
	"O_Soldier_SL_F",
	"O_Soldier_TL_F"
];

//For sniper teams
opf_sniper = [
	"O_sniper_F"
];

//For sniper teams
opf_spotter = [
	"O_spotter_F"
];

//Vehicle crew
opf_crewMan = [
	"O_crew_F"
];

//Jet crew
opf_jetPilot = [
	"O_Fighter_Pilot_F"
];

//Helicopter crew
opf_heliPilot = [
	"O_Pilot_F"
];

//Officers (for special objectives, won't spawn in regular squads)
opf_heliPilot = [
	"O_Officer_Parade_F",
	"O_Officer_Parade_Veteran_F"
];

//General purpuse soldier
//This will be used for transport trucks and such. I recommend using an undarmed man, but it's your choice
opf_heliPilot = [
	"O_Survivor_F"
];