// A_player_fnc_init_pre
// run in pre-init (A_init_fnc_pre)

#include "header.h"


if (isServer) then {
	QVAR_PV_SIDE_GEAR_REQUEST addPublicVariableEventHandler A_player_fnc_side_gear_request_receive;
};

A_player_var_playerstringarray = [
	"civ1","civ2","civ3","civ4","civ5","civ6","civ7","civ8","civ9","civ10",
	"civ11","civ12","civ13","civ14","civ15","civ16","civ17","civ18","civ19","civ20",
	"civ21","civ22","civ23","civ24","civ25","civ26","civ27","civ28","civ29","civ30",
	"civ31","civ32","civ33","civ34","civ35","civ36","civ37","civ38","civ39","civ40",
	"civ41","civ42","civ43","civ44","civ45","civ46","civ47","civ48","civ49","civ50",
	"civ51","civ52","civ53","civ54","civ55","civ56","civ57","civ58","civ59","civ60",
	"civ61","civ62","civ63","civ64",
	"ins1","ins2","ins3","ins4","ins5","ins6","ins7","ins8","ins9","ins10",
	"opf1","opf2","opf3","opf4","opf5","opf6","opf7","opf8","opf9","opf10",
	"cop1","cop2","cop3","cop4","cop5","cop6","cop7","cop8","cop9","cop10",
	"cop11","cop12","cop13","cop14","cop15","cop16","cop17","cop18","cop19","cop20"
];

A_player_var_prone_states = [
	"amovppnemstpsnonwnondnon",
	"aidlppnemstpsnonwnondnon0s",
	"aidlppnemstpsnonwnondnon01",
	"aidlppnemstpsnonwnondnon02",
	"aidlppnemstpsnonwnondnon03",
	"amovppnemrunsnonwnondf",
	"amovppnemrunsnonwnondfl",
	"amovppnemrunsnonwnondl",
	"amovppnemrunsnonwnondbl",
	"amovppnemrunsnonwnondb",
	"amovppnemrunsnonwnondbr",
	"amovppnemrunsnonwnondr",
	"amovppnemrunsnonwnondfr",
	"amovppnemstpsnonwnondnon_turnl",
	"amovppnemstpsnonwnondnon_turnr",
	"awopppnemstpsgthwnondnon_end"
];

A_player_var_vulnerable_states = [
	"UnaErcPoslechVelitele4", 
	"TestSurrender",
	"adthppnemstpsraswpstdnon_2", 
	"AcinPercMstpSnonWpstDnon_agony",
	"unconscious"
];

A_player_var_vulnerable_states append A_player_var_prone_states;
 
A_player_var_CopStartGear_Mags = [
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag",
    "16Rnd_9x21_Mag"
];

A_player_var_CopStartGear_Weap = ["hgun_Rook40_F", "ItemGPS"];
A_player_var_CopStartGear_HandGun_items = ["muzzle_snds_l"];
A_player_var_cop_default_uniform = "U_B_CombatUniform_mcam";
A_player_var_civilian_default_uniform = "U_C_Poloshirt_burgundy";
A_player_var_opfor_default_uniform = "U_O_CombatUniform_ocamo";
A_player_var_insurgent_default_uniform = "U_I_CombatUniform_ocamo";

A_player_var_rejoin_choice_active = false;

A_player_var_restrained_animations = ["unaercposlechvelitele4", "amovpercmstpsnonwnondnon_ease"];