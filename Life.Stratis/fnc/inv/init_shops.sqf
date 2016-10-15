// A_inv_fnc_init_shops
// sets up the shop array
// can't be run until the bases are setup

#include "header.h"


if !(isServer) then {
	["INV_Fabrikowner", []] call A_stats_fnc_init_variable;
};

_emptyshop = [];

_fs = [
	["Fuelline", 40, 80],
	["kanister", 20, 40],
	["kleinesreparaturkit", 20, 40],
	["reparaturkit", 15, 30]
];

_is = [
	["kleinesreparaturkit", 10, 50],
	["kanister", 10, 50],
	["handy", 10, 10],
	["lighter", -1, -1],
	["fishingpole", -1, -1],
	["knife", -1, -1],
	["woodaxe", -1, -1],
	["pickaxe", -1, -1]
];

_pub = [
	["beer", 10, 100],
	["fanta", 10, 100],
	["vodka", 10, 100],
	["smirnoff", 10, 100],
	["wiskey", 10, 100],
	["redgull", 10, 100],
	["water", 10, 100]
];

_gs = [
	["hgun_Rook40_F", 50, 50],
	["16Rnd_9x21_Mag", -1, -1],
	["arifle_Mk20_F", 50, 50],
	["arifle_Mk20C_F", 50, 50],
	["30Rnd_556x45_Stanag_Tracer_Yellow", -1, -1],
	["optic_Holosight", -1, -1],
	["Chemlight_blue", -1, -1]
];

_es = [
	["GPS", 50, 50],
	["Binocular", 50, 50],
	["NVGoggles", 30, 30],
	["handy", 30, 30],
	["Medikit", 50, 30],
	["Firstaidkit", 50, 30],
	["lockpick", 30, 30],
	["Fuelline", -1, -1],
	["Chemlight_green", -1, -1],
	["Chemlight_red", -1, -1],
	["Chemlight_yellow", -1, -1],
	["Chemlight_blue", -1, -1],
	["HandGrenade_Stone", -1, -1]
];

_cu = [
	["nitro", 25, 25],
	["supgrade1", 25, 25],
	["supgrade2", 25, 25], 
	["supgrade3", 25, 25], 
	["supgrade4", 25, 25], 
	["supgrade5", 25, 25] 
];

_cs = [
	["O_Quadbike_01_F", 50, 100],
	["C_Offroad_01_F_white", 50, 100],
	["C_Offroad_01_F_tan", 50, 100],
	["C_Offroad_01_F_rider", 50, 100],
	["C_Offroad_01_F_sky_blue", 50, 100],
	["C_Offroad_01_F_hot_pink", 50, 100],
	["C_Hatchback_01_F_light_tan", 50, 100],
	["C_Hatchback_01_F_dark_tan", 50, 100],
	["C_Hatchback_01_F_light_gray", 50, 100],
	["C_Hatchback_01_F_light_blue", 50, 100],
	["C_Hatchback_01_F_dark_blue", 50, 100],
	["C_Hatchback_01_F_light_green", 50, 100],
	["C_Hatchback_01_F_light_yellow", 50, 100],
	["C_Hatchback_01_F_white", 50, 100],
	["C_Hatchback_01_sport_F_red", 50, 100],
	["C_Hatchback_01_sport_F_blue", 50, 100],
	["C_Hatchback_01_sport_F_orange", 50, 100],
	["C_Hatchback_01_sport_F_white", 50, 100],
	["C_Hatchback_01_sport_F_light_gray", 50, 100],
	["C_Hatchback_01_sport_F_dark_green", 50, 100],
	["C_SUV_01_F_red", 50, 100],
	["C_SUV_01_F_gray", 50, 100],
	["C_SUV_01_F_orange", 50, 100]
];

_ts = [
	["I_Truck_02_covered_F", 25, 100],
	["I_Truck_02_transport_F", 25, 100],
	["C_Van_01_transport_F_fwhite_bwhite", 25, 100],
	["C_Van_01_transport_F_fred_bred", 25, 100],
	["C_Van_01_fuel_F_fwhite_bwhite", 25, 100],
	["C_Van_01_fuel_F_fred_bred", 25, 100],
	["C_Van_01_box_F_fwhite", 25, 100],
	["C_Van_01_box_F_fred", 25, 100]
];

_as = [
	["B_Heli_Light_01_F_nobenches_adddoors", 3, 10],
	["B_Heli_Light_01_F_nobenches_adddoors_blueline", 3, 10],
	["B_Heli_Light_01_F_nobenches_adddoors_elliptical", 3, 10],
	["B_Heli_Light_01_F_nobenches_adddoors_sheriff", 3, 10],
	["B_Heli_Light_01_F_nobenches_adddoors_jeans", 3, 10],
	["B_Heli_Light_01_F_nobenches_adddoors_speedy", 3, 10],
	["I_Heli_Transport_02_F_dahoman", 3, 10],
	["O_Heli_Light_02_unarmed_F_civ", 3, 10]
];

_bs = [
	["O_Lifeboat", -1, -1],
	["C_Rubberboat", -1, -1],
	["C_Boat_Civil_01_F", -1, -1],
	["C_Boat_Civil_01_rescue_F", -1, -1]
];

_td = [];

_ms = [
	["Shovel", 50, 100],
	["pickaxe", 50, 100],
	["woodaxe", -1, -1],
	["bucket", -1, -1],
	["emptybarrel", -1, -1]
];

_rs = [
	["platinumore", -1, -1],
	["goldore", -1, -1],
	["silverore", -1, -1],
	["rubyore", -1, -1],
	["ironore", -1, -1],
	["copperore", -1, -1],
	["steel", -1, -1],
	["sand", -1, -1],
	["glass", -1, -1]
];

_gds = [
	["Diamondring", -1, -1],
	["EDiamondring", -1, -1],
	["Platinumring", -1, -1],
	["EPlatinumring", -1, -1]
];

_os = [
	["OilBarrel", -1, -1]
];

_gangshop_buy = [
	["kleinesreparaturkit", -1, -1],
	["reparaturkit", -1, -1],
	["lockpick", -1, -1],
	["lighter", -1, -1],
	["Fuelline", -1, -1],
	["kanister", -1, -1],
	["medikit", -1, -1],
	["Firstaidkit", -1, -1],
	["HandGrenade_Stone", -1, -1],
	["hgun_ACPC2_F_ill", -1, -1],
	["9Rnd_45ACP_Mag", -1, -1],
	["hgun_Rook40_F_ill", -1, -1],
	["16Rnd_9x21_Mag", -1, -1],
	["SMG_02_F", -1, -1],
	["30Rnd_9x21_Mag", -1, -1],
	["muzzle_snds_L_ill", -1, -1],
	["optic_Aco", -1, -1],
	["HandGrenade", -1, -1],
	["coca_seedling", -1, -1],
	["poppy_seedling", -1, -1],
	["marijuana_seedling", -1, -1]
];

_db1 = [
	["marijuana", -1, -1],
	["cocaine", -1, -1],
	["lsd", -1, -1]
];

_db2 = [
	["cocaine", -1, -1],
	["lsd", -1, -1]
];

_db3 = [
	["heroin", -1, -1],
	["marijuana", -1, -1]
];

_dsc = [
	["cocaine", -1, -1]
];

_dsm = [
	["marijuana", -1, -1]
];

_dsl = [
	["lsd", -1, -1]
];

_dsh = [
	["heroin", -1, -1]
];

_cv = [
	["B_Quadbike_01_F", -1, -1],
	["C_Offroad_01_F_black_police_bumper2_construction", -1, -1],
	["C_Offroad_01_F_white_police_bumper2_construction", -1, -1],
	["C_Offroad_01_F_dark_blue_police_bumper2_construction", -1, -1],
	["C_Hatchback_01_F_black", 50, 100],
	["C_SUV_01_F_black", 50, 100]
];

_ca = [
	["B_Heli_Light_01_F", -1, -1],
	["B_Heli_Transport_01_F", -1, -1],
	["B_UAV_01_F", -1, -1]
];

_cbs = [
	["B_Lifeboat", -1, -1],
	["B_Boat_Transport_01_F", -1, -1],
	["B_Boat_Armed_01_minigun_F", -1, -1],
	["B_SDV_01_F", -1, -1],
	["C_Boat_Civil_01_police_F", -1, -1]
];

_sv = [
	["B_Truck_01_transport_F", -1, -1],
	["B_Truck_01_covered_F", -1, -1],
	["B_MRAP_01_F", -1, -1],
	["B_MRAP_01_hmg_F", -1, -1],
	["B_MRAP_01_gmg_F", -1, -1],
	["B_APC_Wheeled_01_cannon_F", -1, -1],
	["B_APC_Tracked_01_rcws_F", -1, -1]
];

_sa = [
	["B_Heli_Light_01_armed_F", -1, -1],
	["B_Heli_Transport_01_camo_F", -1, -1],
	["B_Heli_Attack_01_F_nodagr_noasraam", -1, -1]
];

_bas = [
	["B_UAV_02_F", -1, -1],
	["I_Plane_Fighter_03_AA_F_noasraam_nozephyr", -1, -1]
];

_pmcveh = [
	["B_Quadbike_01_F", -1, -1],
	["C_Offroad_01_F_black", -1, -1],
	["I_MRAP_03_F", -1, -1],
	["I_MRAP_03_hmg_F", -1, -1],
	["I_MRAP_03_gmg_F", -1, -1],
	["C_Hatchback_01_F_dark_gray", 50, 100]
];

_pmcair = [
	["I_Heli_Transport_02_F_ion", -1, -1],
	["B_Heli_Light_01_F_furious", -1, -1],
	["B_Heli_Light_01_F_graywatcher", -1, -1],
	["B_Heli_Light_01_F_shadow", -1, -1],
	["B_Heli_Light_01_F_sunset", -1, -1],
	["B_Heli_Light_01_armed_F_wasp", -1, -1]
];

_copshop = [
	["GPS", 50, 50],
	["Binocular", 50, 50],
	["NVGoggles", 30, 30],
	["hgun_P07_F", -1, -1],
	["hgun_P07_snds_F", -1, -1],
	["16Rnd_9x21_Mag", -1, -1],
	["SMG_01_F", -1, -1],
	["30Rnd_9x21_Mag", -1, -1],
	["kleinesreparaturkit", -1, -1],
	["reparaturkit", -1, -1],
	["kanister", -1, -1],
	["medikit", -1, -1],
	["Firstaidkit", -1, -1],
	["weaponbag", -1, -1],
	["itembag", -1, -1],
	["defuser", -1, -1],
	["vclammo", -1, -1],
	["lockpick", -1, -1],
	["nitro", -1, -1],
	["supgrade1", -1, -1],
	["supgrade2", -1, -1],
	["supgrade3", -1, -1],
	["supgrade4", -1, -1],
	["supgrade5", -1, -1],
	["speedgun", -1, -1],
	["gasmask", -1, -1],
	["Chemlight_green", -1, -1],
	["Chemlight_red", -1, -1],
	["Chemlight_yellow", -1, -1],
	["Chemlight_blue", -1, -1],
	["SmokeShellRed", -1, -1],
	["SmokeShellGreen", -1, -1],
	["SmokeShellYellow", -1, -1],
	["SmokeShellPurple", -1, -1],
	["SmokeShellBlue", -1, -1],
	["SmokeShellOrange", -1, -1]
];

_copshop_patrol = [
	["hgun_Rook40_F", 50, 50],
	["16Rnd_9x21_Mag", -1, -1],
	["SmokeShell", -1, -1],
	["arifle_MX_F", -1, -1],
	["arifle_MXC_F", -1, -1],
	["arifle_MX_GL_F", -1, -1],
	["arifle_MX_SW_F", -1, -1],
	["arifle_MXM_F", -1, -1],
	["30Rnd_65x39_caseless_mag_Tracer", -1, -1],
	["Rnd_HE", -1, -1],
	["Rnd_Smoke", -1, -1],
	["Rnd_RedSmoke", -1, -1],
	["Rnd_GreenSmoke", -1, -1],
	["Rnd_YellowSmoke", -1, -1],
	["Rnd_PurpleSmoke", -1, -1],
	["Rnd_BlueSmoke", -1, -1],
	["Rnd_OrangeSmoke", -1, -1],
	["Rnd_FlareWhite", -1, -1],
	["Rnd_FlareGreen", -1, -1],
	["Rnd_3HE", -1, -1],
	["Rnd_3Smoke", -1, -1],
	["Rnd_3RedSmoke", -1, -1],
	["Rnd_3GreenSmoke", -1, -1],
	["Rnd_3YellowSmoke", -1, -1],
	["Rnd_3PurpleSmoke", -1, -1],
	["Rnd_3SmokeBlue", -1, -1],
	["Rnd_3OrangeSmoke", -1, -1],
	["Rnd_3FlareWhite", -1, -1],
	["Rnd_3FlareGreen", -1, -1]
];

_copshop_response = [
	["srifle_EBR_F", -1, -1],
	["20Rnd_762x51_Mag", -1, -1],
	["LMG_Mk200_F", -1, -1],
	["200Rnd_65x39_cased_Box", -1, -1],
	["200Rnd_65x39_cased_Box_Tracer", -1, -1],
	["HandGrenade", -1, -1],
	["MiniGrenade", -1, -1],
	["acc_flashlight", -1, -1],
	["acc_pointer_IR", -1, -1],
	["optic_Arco", -1, -1],
	["optic_Hamr", -1, -1],
	["optic_Aco", -1, -1],
	["optic_ACO_grn", -1, -1],
	["optic_Holosight", -1, -1],
	["optic_SOS", -1, -1],
	["optic_MRCO", -1, -1]		
];

_copshop_sobr = [
	["srifle_LRR_SOS_F", -1, -1],
	["7Rnd_408_Mag", -1, -1],
	["arifle_SDAR_F", -1, -1],
	["20Rnd_556x45_UW_mag", -1, -1],
	["launch_NLAW_F", -1, -1],
	["NLAW_F", -1, -1],
	["launch_B_Titan_F", -1, -1],
	["launch_B_Titan_short_F", -1, -1],
	["Titan_AA", -1, -1],
	["Titan_AP", -1, -1],
	["Titan_AT", -1, -1],
	["ATMine", -1, -1],
	["APERSMine", -1, -1],
	["APERSBoundingMine", -1, -1],
	["SLAMDirectionalMine", -1, -1],
	["APERSTripMine", -1, -1],
	["Claymore", -1, -1],
	["SatchelCharge", -1, -1],
	["DemoCharge", -1, -1],
	["muzzle_snds_H", -1, -1],
	["muzzle_snds_L", -1, -1],
	["muzzle_snds_M", -1, -1],
	["muzzle_snds_B", -1, -1],
	["muzzle_snds_H_MG", -1, -1]
];

_pmcs =[
	["hgun_ACPC2_F", -1, -1],
	["9Rnd_45ACP_Mag", -1, -1],
	["16Rnd_9x21_Mag", -1, -1],
	["SMG_01_F", -1, -1],
	["30Rnd_9x21_Mag", -1, -1],
	["arifle_TRG21_F", -1, -1],
	["arifle_TRG20_F", -1, -1],
	["arifle_TRG21_GL_F", -1, -1],
	["30Rnd_556x45_Stanag", -1, -1],
	["30Rnd_556x45_Stanag_Tracer_Yellow", -1, -1],
	["LMG_Mk200_F", -1, -1],
	["200Rnd_65x39_cased_Box", -1, -1],
	["200Rnd_65x39_cased_Box_Tracer", -1, -1],
	["srifle_EBR_F", -1, -1],
	["20Rnd_762x51_Mag", -1, -1],
	["launch_NLAW_F", -1, -1],
	["NLAW_F", -1, -1],
	["launch_I_Titan_F", -1, -1],
	["launch_I_Titan_short_F", -1, -1],
	["Titan_AA", -1, -1],
	["Titan_AP", -1, -1],
	["Titan_AT", -1, -1],
	["Rnd_HE", -1, -1],
	["Rnd_Smoke", -1, -1],
	["Rnd_RedSmoke", -1, -1],
	["Rnd_GreenSmoke", -1, -1],
	["Rnd_YellowSmoke", -1, -1],
	["Rnd_PurpleSmoke", -1, -1],
	["Rnd_BlueSmoke", -1, -1],
	["Rnd_OrangeSmoke", -1, -1],
	["Rnd_FlareWhite", -1, -1],
	["Rnd_FlareGreen", -1, -1],
	["ATMine", -1, -1],
	["APERSMine", -1, -1],
	["Claymore", -1, -1],
	["SatchelCharge", -1, -1],
	["acc_flashlight", -1, -1],
	["acc_pointer_IR", -1, -1],
	["optic_Arco", -1, -1],
	["optic_Hamr", -1, -1],
	["optic_Aco", -1, -1],
	["optic_ACO_grn", -1, -1],
	["optic_Holosight", -1, -1],
	["muzzle_snds_L", -1, -1],
	["muzzle_snds_M", -1, -1],
	["muzzle_snds_B", -1, -1],
	["muzzle_snds_H_MG", -1, -1],
	["lockpick", -1, -1],
	["medikit", -1, -1],
	["Firstaidkit", -1, -1],
	["Toolkit", -1, -1],
	["kleinesreparaturkit", -1, -1],
	["reparaturkit", -1, -1],
	["kanister", -1, -1],
	["supgrade1", -1, -1],
	["supgrade2", -1, -1],
	["supgrade3", -1, -1],
	["supgrade4", -1, -1],
	["supgrade5", -1, -1],
	["nitro", -1, -1],
	["vclammo", -1, -1],
	["gasmask", -1, -1]
];

_terrorshop_buy = [
	["lockpick", -1, -1],
	["medikit", -1, -1],
	["Firstaidkit", -1, -1],
	["Toolkit", -1, -1],
	["kleinesreparaturkit", -1, -1],
	["reparaturkit", -1, -1],
	["kanister", -1, -1],
	["vclammo", -1, -1],
	["gasmask", -1, -1],
	["HandGrenade_Stone", -1, -1],
	["HandGrenade", -1, -1],
	["MiniGrenade", -1, -1],
	["hgun_Rook40_F_ill", -1, -1],
	["16Rnd_9x21_Mag", -1, -1],
	["SMG_02_F", -1, -1],
	["30Rnd_9x21_Mag", -1, -1],
	["arifle_Katiba_F", -1, -1],
	["arifle_Katiba_C_F", -1, -1],
	["arifle_Katiba_GL_F", -1, -1],
	["30Rnd_65x39_caseless_green", -1, -1],
	["Rnd_HE", -1, -1],
	["Rnd_Smoke", -1, -1],
	["Rnd_RedSmoke", -1, -1],
	["Rnd_GreenSmoke", -1, -1],
	["Rnd_YellowSmoke", -1, -1],
	["Rnd_PurpleSmoke", -1, -1],
	["Rnd_BlueSmoke", -1, -1],
	["Rnd_OrangeSmoke", -1, -1],
	["Rnd_FlareWhite", -1, -1],
	["Rnd_FlareGreen", -1, -1],
	["LMG_Zafir_F", -1, -1],
	["150Rnd_762x51_Box_Tracer", -1, -1],
	["srifle_EBR_F", -1, -1],
	["20Rnd_762x51_Mag", -1, -1],
	["srifle_GM6_SOS_F", -1, -1],
	["5Rnd_127x108_Mag", -1, -1],
	["acc_flashlight", -1, -1],
	["acc_pointer_IR_ill", -1, -1],
	["optic_Arco_ill", -1, -1],
	["optic_Aco_ill", -1, -1],
	["optic_ACO_grn_ill", -1, -1],
	["optic_Holosight_ill", -1, -1],
	["muzzle_snds_L_ill", -1, -1],
	["muzzle_snds_H_ill", -1, -1],
	["muzzle_snds_B_ill", -1, -1],
	["muzzle_snds_H_MG_ill", -1, -1],
	["launch_RPG32_F", -1, -1],
	["RPG32_F", -1, -1],
	["launch_O_Titan_F", -1, -1],
	["launch_O_Titan_short_F", -1, -1],
	["Titan_AA", -1, -1],
	["Titan_AP", -1, -1],
	["Titan_AT", -1, -1],
	["ATMine", -1, -1],
	["APERSMine", -1, -1],
	["APERSBoundingMine", -1, -1],
	["SLAMDirectionalMine", -1, -1],
	["APERSTripMine", -1, -1],
	["Claymore", -1, -1],
	["SatchelCharge", -1, -1],
	["DemoCharge", -1, -1],
	["selbstmordbombe", -1, -1],
	["fernzuenderbombe", -1, -1],
	["zeitzuenderbombe", -1, -1],
	["aktivierungsbombe", -1, -1],
	["geschwindigkeitsbombe", -1, -1],
	["fernzuender", -1, -1]
];

_tbs = [
	["O_Lifeboat", -1, -1],
	["O_Boat_Transport_01_F", -1, -1],
	["O_Boat_Armed_01_hmg_F", -1, -1],
	["O_SDV_01_F", -1, -1]
];

_smgrw =[];

_smgrveh =[];

_fm = [
	["Salema_F", -1, -1],
	//["Ornate_random_F",  -1, -1],
	["Mackerel_F",  -1, -1],
	["Tuna_F", -1, -1],
	["Mullet_F", -1, -1],
	["CatShark_F", -1, -1]
];

_bm = [
	["Rabbit_F", -1, -1],
	["Snake_random_F", -1, -1],
	["Turtle_F", -1, -1]
];

_fs1 =[];

_fs2 =[];

_fs3 =[];

_fs4 =[];

_fs5 =[];

_fs6 =[];

_civgear = [
	["U_C_Poloshirt_blue", -1, -1],
	["U_C_Poloshirt_burgundy",  -1, -1],
	["U_C_Poloshirt_stripped",  -1, -1],
	["U_C_Poloshirt_tricolour",  -1, -1],
	["U_C_Poloshirt_salmon",  -1, -1],
	["U_C_Poloshirt_redwhite",  -1, -1],
	["U_C_Commoner1_1",  -1, -1],
	["U_C_Commoner1_2",  -1, -1],
	["U_C_Commoner1_3", -1, -1],
	["U_Rangemaster",  -1, -1],
	["V_Rangemaster_belt",  -1, -1],
	["H_Cap_red",  -1, -1],
	["H_Cap_blu", -1, -1],
	["H_Cap_tan", -1, -1],
	["H_Cap_blk", -1, -1],
	["H_Cap_grn", -1, -1],
	["H_Cap_grn_BI", -1, -1],
	["H_Cap_headphones",  -1, -1],
	["H_Watchcap_blk", -1, -1],
	["H_Watchcap_khk", -1, -1],
	["H_Watchcap_sgg", -1, -1],
	["G_Shades_Black", -1, -1],
	["G_Shades_Blue", -1, -1],
	["G_Sport_Blackred", -1, -1],
	["G_Tactical_Clear", -1, -1],
	["G_Spectacles", -1, -1],
	["G_Spectacles_Tinted", -1, -1],
	["G_Shades_Green", -1, -1],
	["G_Shades_Red", -1, -1],
	["G_Squares", -1, -1],
	["G_Squares_Tinted", -1, -1],
	["G_Sport_BlackWhite", -1, -1],
	["G_Sport_Blackyellow", -1, -1],
	["G_Sport_Greenblack", -1, -1],
	["G_Sport_Checkered", -1, -1],
	["G_Sport_Red", -1, -1],
	["G_Tactical_Black", -1, -1],
	["B_OutdoorPack_blk", -1, -1],
	["B_OutdoorPack_tan", -1, -1],
	["B_OutdoorPack_blu", -1, -1],
	["B_HuntingBackpack", -1, -1],
	["B_Kitbag_sgg", -1, -1],
	["B_Carryall_oli", -1, -1],
	["B_Parachute", -1, -1]
];

_copgear = [
	["U_B_CombatUniform_mcam", -1, -1],
	["U_B_CombatUniform_mcam_tshirt", -1, -1],
	["U_B_CombatUniform_mcam_vest",  -1, -1],
	["U_B_GhillieSuit",  -1, -1],
	["U_B_HeliPilotCoveralls",  -1, -1],
	["U_B_Wetsuit",  -1, -1],
	["V_TacVest_blk_POLICE",  -1, -1],
	["V_BandollierB_khk",  -1, -1],
	["V_BandollierB_rgr", -1, -1],
	["V_BandollierB_cbr", -1, -1],
	["V_BandollierB_oli", -1, -1],
	["V_PlateCarrier1_rgr",  -1, -1],
	["V_PlateCarrier1_cbr",  -1, -1],
	["V_PlateCarrier1_blk",  -1, -1],
	["V_PlateCarrier2_rgr", -1, -1],
	["V_PlateCarrier2_cbr", -1, -1],
	["V_PlateCarrier2_blk", -1, -1],
	["V_PlateCarrierGL_rgr", -1, -1],
	["V_PlateCarrierGL_cbr", -1, -1],
	["V_PlateCarrierGL_blk", -1, -1],
	["V_PlateCarrierSpec_rgr", -1, -1],
	["V_PlateCarrierSpec_cbr", -1, -1],
	["V_Chestrig_khk",  -1, -1],
	["V_TacVest_khk", -1, -1],
	["V_TacVest_brn", -1, -1],
	["V_TacVest_oli",  -1, -1],
	["V_RebreatherB",  -1, -1],
	["H_Beret_blk_POLICE", -1, -1],
	["H_Cap_brn_SPECOPS", -1, -1],
	["H_Cap_blk_CMMG", -1, -1],
	["H_MilCap_mcamo", -1, -1],
	["H_HelmetB", -1, -1],
	["H_HelmetB_paint", -1, -1],
	["H_HelmetB_light",  -1, -1],
	["H_HelmetCrew_B",  -1, -1],
	["H_PilotHelmetHeli_B",  -1, -1],
	["H_CrewHelmetHeli_B",  -1, -1],
	["H_PilotHelmetFighter_B",  -1, -1],
	["H_HelmetSpecB",  -1, -1],
	["H_HelmetSpecB_paint1",  -1, -1],
	["H_HelmetSpecB_paint2",  -1, -1],
	["H_HelmetSpecB_blk",  -1, -1],
	["G_Tactical_Clear", -1, -1],
	["G_Combat", -1, -1],
	["G_Lowprofile", -1, -1],
	["G_Diving", -1, -1],
	["B_Bergen_mcamo", -1, -1],
	["B_Carryall_mcamo", -1, -1],
	["B_Carryall_mcamo_AAA", -1, -1],
	["B_Carryall_mcamo_AAT", -1, -1],
	["B_Carryall_oli", -1, -1],
	["B_Carryall_khk", -1, -1],
	["B_Carryall_cbr", -1, -1],
	["B_Carryall_cbr_AAT", -1, -1],
	["B_AssaultPack_rgr", -1, -1],
	["B_AssaultPack_rgr_LAT", -1, -1],
	["B_AssaultPack_rgr_Medic", -1, -1],
	["B_AssaultPack_rgr_Repair", -1, -1],
	["B_AssaultPack_rgr_ReconMedic", -1, -1],
	["B_AssaultPack_sgg", -1, -1],
	["B_AssaultPack_blk", -1, -1],
	["B_AssaultPack_DiverExp", -1, -1],
	["B_AssaultPack_cbr", -1, -1],
	["B_AssaultPack_khk", -1, -1],
	["B_Mortar_01_weapon_F", -1, -1],
	["B_Mortar_01_support_F", -1, -1]
];

_pmcgear = [
	["U_Competitor", -1, -1],
	["U_I_CombatUniform",  -1, -1],
	["U_I_CombatUniform_tshirt",  -1, -1],
	["U_I_CombatUniform_shortsleeve",  -1, -1],
	["U_I_pilotCoveralls",  -1, -1],
	["U_I_HeliPilotCoveralls",  -1, -1],
	["U_I_GhillieSuit",  -1, -1],
	["U_I_OfficerUniform",  -1, -1],
	["U_I_Wetsuit",  -1, -1],
	["V_BandollierB_khk",  -1, -1],
	["V_BandollierB_rgr", -1, -1],
	["V_BandollierB_cbr", -1, -1],
	["V_PlateCarrierIA1_dgtl",  -1, -1],
	["V_PlateCarrierIA2_dgtl",  -1, -1],
	["V_PlateCarrierIAGL_dgtl",  -1, -1],
	["V_Chestrig_khk",  -1, -1],
	["V_TacVest_khk", -1, -1],
	["V_TacVest_brn", -1, -1],
	["V_TacVest_oli",  -1, -1],
	["V_TacVestIR_blk",  -1, -1],
	["V_TacVestCamo_khk",  -1, -1],
	["V_RebreatherIA",  -1, -1],
	["H_MilCap_dgtl", -1, -1],
	["H_HelmetIA", -1, -1],
	["H_HelmetIA_net", -1, -1],
	["H_HelmetIA_camo", -1, -1],
	["H_HelmetCrew_I", -1, -1],
	["H_PilotHelmetFighter_I", -1, -1],
	["H_CrewHelmetHeli_I", -1, -1],
	["H_PilotHelmetHeli_I", -1, -1],
	["H_Booniehat_dgtl", -1, -1],
	["G_Combat", -1, -1],
	["G_Lowprofile", -1, -1],
	["G_Diving", -1, -1],
	["B_FieldPack_blk", -1, -1],
	["B_FieldPack_blk_DiverExp", -1, -1],
	["B_FieldPack_cbr", -1, -1],
	["B_FieldPack_cbr_LAT", -1, -1],
	["B_FieldPack_cbr_Repair", -1, -1],
	["B_FieldPack_cbr_AAT", -1, -1],
	["B_FieldPack_cbr_Ammo", -1, -1],
	["B_FieldPack_cbr_AT", -1, -1],
	["B_FieldPack_khk", -1, -1],
	["B_FieldPack_oli", -1, -1]
];

_opgear = [
	["U_O_CombatUniform_ocamo", -1, -1],
	["U_O_PilotCoveralls",  -1, -1],
	["U_O_SpecopsUniform_ocamo", -1, -1],
	["U_O_SpecopsUniform_blk", -1, -1],
	["U_O_GhillieSuit",  -1, -1],
	["U_O_Wetsuit",  -1, -1],
	["U_O_OfficerUniform_ocamo",  -1, -1],
	["V_HarnessO_brn", -1, -1],
	["V_HarnessO_gry", -1, -1],
	["V_HarnessOGL_gry",  -1, -1],
	["V_HarnessOSpec_gry",  -1, -1],
	["V_HarnessOGL_brn",  -1, -1],
	["H_MilCap_ocamo",  -1, -1],
	["H_Booniehat_ocamo",  -1, -1],
	["H_Beret_ocamo",  -1, -1],
	["H_Beret_red",  -1, -1],
	["H_BandMask_khk",  -1, -1],
	["H_BandMask_blk",  -1, -1],
	["H_PilotHelmetHeli_O",  -1, -1],
	["H_HelmetO_ocamo",  -1, -1],
	["H_HelmetO_oucamo",  -1, -1],
	["H_HelmetCrew_O",  -1, -1],
	["H_PilotHelmetHeli_O",  -1, -1],
	["H_CrewHelmetHeli_O",  -1, -1],
	["H_PilotHelmetFighter_O",  -1, -1],
	["H_HelmetSpecO_ocamo",  -1, -1],
	["H_HelmetSpecO_blk",  -1, -1],
	["V_RebreatherIR",  -1, -1],
	["G_Combat",  -1, -1],
	["G_Lowprofile",  -1, -1],
	["B_Carryall_ocamo",  -1, -1],
	["B_Carryall_ocamo_Exp",  -1, -1],
	["B_Carryall_ocamo_AAA",  -1, -1],
	["B_Carryall_ocamo_Eng",  -1, -1],
	["B_Carryall_oucamo",  -1, -1],
	["B_FieldPack_ocamo",  -1, -1],
	["B_FieldPack_ocamo_Medic",  -1, -1],
	["B_FieldPack_blk",  -1, -1],
	["B_FieldPack_blk_DiverExp",  -1, -1],
	["B_FieldPack_oucamo",  -1, -1],
	["B_AssaultPack_ocamo",  -1, -1],
	["B_AssaultPack_blk",  -1, -1],
	["B_Mortar_01_weapon_F", -1, -1],
	["B_Mortar_01_support_F", -1, -1]
];

_inswep = [
	["HandGrenade_Stone", -1, -1],
	["HandGrenade", -1, -1],
	["MiniGrenade", -1, -1],
	["hgun_Rook40_F_ill", -1, -1],
	["16Rnd_9x21_Mag", -1, -1],
	["SMG_02_F", -1, -1],
	["30Rnd_9x21_Mag", -1, -1],
	["arifle_Katiba_F", -1, -1],
	["arifle_Katiba_C_F", -1, -1],
	["arifle_Katiba_GL_F", -1, -1],
	["30Rnd_65x39_caseless_green", -1, -1],
	["Rnd_HE", -1, -1],
	["Rnd_Smoke", -1, -1],
	["Rnd_RedSmoke", -1, -1],
	["Rnd_GreenSmoke", -1, -1],
	["Rnd_YellowSmoke", -1, -1],
	["Rnd_PurpleSmoke", -1, -1],
	["Rnd_BlueSmoke", -1, -1],
	["Rnd_OrangeSmoke", -1, -1],
	["Rnd_FlareWhite", -1, -1],
	["Rnd_FlareGreen", -1, -1],
	["LMG_Zafir_F", -1, -1],
	["150Rnd_762x51_Box_Tracer", -1, -1],
	["srifle_EBR_F", -1, -1],
	["20Rnd_762x51_Mag", -1, -1],
	["srifle_GM6_SOS_F", -1, -1],
	["5Rnd_127x108_Mag", -1, -1],
	["acc_flashlight", -1, -1],
	["acc_pointer_IR_ill", -1, -1],
	["optic_Arco_ill", -1, -1],
	["optic_Aco_ill", -1, -1],
	["optic_ACO_grn_ill", -1, -1],
	["optic_Holosight_ill", -1, -1],
	["muzzle_snds_L_ill", -1, -1],
	["muzzle_snds_H_ill", -1, -1],
	["muzzle_snds_B_ill", -1, -1],
	["muzzle_snds_H_MG_ill", -1, -1],
	["launch_RPG32_F", -1, -1],
	["RPG32_F", -1, -1],
	["launch_O_Titan_F", -1, -1],
	["launch_O_Titan_short_F", -1, -1],
	["Titan_AA", -1, -1],
	["Titan_AP", -1, -1],
	["Titan_AT", -1, -1],
	["ATMine", -1, -1],
	["APERSMine", -1, -1],
	["APERSBoundingMine", -1, -1],
	["SLAMDirectionalMine", -1, -1],
	["APERSTripMine", -1, -1],
	["Claymore", -1, -1],
	["SatchelCharge", -1, -1],
	["DemoCharge", -1, -1]
];

_insair = [
	["I_Heli_Transport_02_F", -1, -1],
	["I_UAV_01_F", -1, -1],
	["O_Heli_Light_02_F_nodagr_ind", -1, -1],
	["B_Heli_Light_01_armed_F_digital", -1, -1]
];

_insequip = [
	["I_UavTerminal", -1, -1],
	["lockpick", -1, -1],
	["medikit", -1, -1],
	["Firstaidkit", -1, -1],
	["Toolkit", -1, -1],
	["kleinesreparaturkit", -1, -1],
	["reparaturkit", -1, -1],
	["kanister", -1, -1],
	["vclammo", -1, -1],
	["gasmask", -1, -1],
	["selbstmordbombe", -1, -1],
	["fernzuenderbombe", -1, -1],
	["zeitzuenderbombe", -1, -1],
	["aktivierungsbombe", -1, -1],
	["geschwindigkeitsbombe", -1, -1],
	["fernzuender", -1, -1]
];

_insgear =[
	["U_I_CombatUniform", -1, -1],
	["U_I_CombatUniform_tshirt",  -1, -1],
	["U_I_CombatUniform_shortsleeve", -1, -1],
	["U_I_pilotCoveralls", -1, -1],
	["U_I_HeliPilotCoveralls",  -1, -1],
	["U_I_GhillieSuit",  -1, -1],
	["U_I_OfficerUniform",  -1, -1],
	["U_I_Wetsuit", -1, -1],
	["H_PilotHelmetHeli_I", -1, -1],
	["H_HelmetCrew_I",  -1, -1],
	["H_PilotHelmetFighter_I",  -1, -1],
	["H_CrewHelmetHeli_I",  -1, -1],
	["V_RebreatherIR",  -1, -1],
	["G_Combat",  -1, -1],
	["G_Lowprofile",  -1, -1],
	["B_Carryall_ocamo",  -1, -1],
	["B_Carryall_ocamo_Exp",  -1, -1],
	["B_Carryall_ocamo_AAA",  -1, -1],
	["B_Carryall_ocamo_Eng",  -1, -1],
	["B_Carryall_oucamo",  -1, -1],
	["B_FieldPack_ocamo",  -1, -1],
	["B_FieldPack_ocamo_Medic",  -1, -1],
	["B_FieldPack_blk",  -1, -1],
	["B_FieldPack_blk_DiverExp",  -1, -1],
	["B_FieldPack_oucamo",  -1, -1],
	["B_AssaultPack_ocamo",  -1, -1],
	["B_AssaultPack_blk",  -1, -1],
	["B_Mortar_01_weapon_F", -1, -1],
	["B_Mortar_01_support_F", -1, -1]
];

_insboat = [
	["O_Lifeboat_icamo", -1, -1],
	["I_Boat_Transport_01_F", -1, -1],
	["I_Boat_Armed_01_minigun_F", -1, -1],
	["C_Boat_Civil_01_F_icamo", -1, -1],
	["I_SDV_01_F", -1, -1]
];

_opfweps = [
	["HandGrenade_Stone", -1, -1],
	["HandGrenade", -1, -1],
	["MiniGrenade", -1, -1],
	["hgun_Rook40_F_ill", -1, -1],
	["16Rnd_9x21_Mag", -1, -1],
	["SMG_02_F", -1, -1],
	["30Rnd_9x21_Mag", -1, -1],
	["arifle_Katiba_F", -1, -1],
	["arifle_Katiba_C_F", -1, -1],
	["arifle_Katiba_GL_F", -1, -1],
	["30Rnd_65x39_caseless_green", -1, -1],
	["Rnd_HE", -1, -1],
	["Rnd_Smoke", -1, -1],
	["Rnd_RedSmoke", -1, -1],
	["Rnd_GreenSmoke", -1, -1],
	["Rnd_YellowSmoke", -1, -1],
	["Rnd_PurpleSmoke", -1, -1],
	["Rnd_BlueSmoke", -1, -1],
	["Rnd_OrangeSmoke", -1, -1],
	["Rnd_FlareWhite", -1, -1],
	["Rnd_FlareGreen", -1, -1],
	["LMG_Zafir_F", -1, -1],
	["150Rnd_762x51_Box_Tracer", -1, -1],
	["srifle_EBR_F", -1, -1],
	["20Rnd_762x51_Mag", -1, -1],
	["srifle_GM6_SOS_F", -1, -1],
	["5Rnd_127x108_Mag", -1, -1],
	["acc_flashlight", -1, -1],
	["acc_pointer_IR_ill", -1, -1],
	["optic_Arco_ill", -1, -1],
	["optic_Aco_ill", -1, -1],
	["optic_ACO_grn_ill", -1, -1],
	["optic_Holosight_ill", -1, -1],
	["muzzle_snds_L_ill", -1, -1],
	["muzzle_snds_H_ill", -1, -1],
	["muzzle_snds_B_ill", -1, -1],
	["muzzle_snds_H_MG_ill", -1, -1],
	["launch_RPG32_F", -1, -1],
	["RPG32_F", -1, -1],
	["launch_O_Titan_F", -1, -1],
	["launch_O_Titan_short_F", -1, -1],
	["Titan_AA", -1, -1],
	["Titan_AP", -1, -1],
	["Titan_AT", -1, -1],
	["ATMine", -1, -1],
	["APERSMine", -1, -1],
	["APERSBoundingMine", -1, -1],
	["SLAMDirectionalMine", -1, -1],
	["APERSTripMine", -1, -1],
	["Claymore", -1, -1],
	["SatchelCharge", -1, -1],
	["DemoCharge", -1, -1]
];

_opfequip = [
	["I_UavTerminal", -1, -1],
	["lockpick", -1, -1],
	["medikit", -1, -1],
	["Firstaidkit", -1, -1],
	["kleinesreparaturkit", -1, -1],
	["reparaturkit", -1, -1],
	["kanister", -1, -1],
	["vclammo", -1, -1],
	["gasmask", -1, -1],
	["selbstmordbombe", -1, -1],
	["fernzuenderbombe", -1, -1],
	["zeitzuenderbombe", -1, -1],
	["aktivierungsbombe", -1, -1],
	["geschwindigkeitsbombe", -1, -1],
	["fernzuender", -1, -1]
];

_opfgear = [
	["U_O_SpecopsUniform_blk", -1, -1],
	["U_O_SpecopsUniform_ocamo", -1, -1],
	["U_O_CombatUniform_oucamo", -1, -1],
	["U_O_PilotCoveralls",  -1, -1],
	["U_O_GhillieSuit",  -1, -1],
	["U_O_OfficerUniform_ocamo",  -1, -1],
	["U_O_Wetsuit", -1, -1],
	["V_RebreatherIR",  -1, -1],
	["G_Combat",  -1, -1],
	["G_Lowprofile",  -1, -1],
	["G_Diving", -1, -1],
	["B_Carryall_ocamo",  -1, -1],
	["B_Carryall_ocamo_Exp",  -1, -1],
	["B_Carryall_ocamo_AAA",  -1, -1],
	["B_Carryall_ocamo_Eng",  -1, -1],
	["B_Carryall_oucamo",  -1, -1],
	["B_FieldPack_ocamo",  -1, -1],
	["B_FieldPack_ocamo_Medic",  -1, -1],
	["B_FieldPack_blk",  -1, -1],
	["B_FieldPack_blk_DiverExp",  -1, -1],
	["B_FieldPack_oucamo",  -1, -1],
	["B_AssaultPack_ocamo",  -1, -1],
	["B_AssaultPack_blk",  -1, -1]
];

_opfsubshop = [
	["I_SDV_01_F", -1, -1]
];

_cp1weps = _opfweps;

_cp1equip = _opfequip;

_cp1gear = _opfgear;

_cp1boat = [
	["O_Lifeboat", -1, -1],
	["O_Boat_Transport_01_F", -1, -1],
	["O_Boat_Armed_01_hmg_F", -1, -1]
];

_cp1air = [
	["B_Heli_Light_01_F_vrana", -1, -1],
	["O_Heli_Light_02_F_nodagr", -1, -1],
	["O_Heli_Attack_02_F_noscalpel_noskyfire", -1, -1]
];

A_inv_var_itemshops = [
	[fuelshop1,"Fuel-station Shop",dummyobj,dummyobj,_fs,_fs,true],

	[shop1,"Item Shop",dummyobj,dummyobj,_is,_is,true],
	[shop2,"Item Shop",dummyobj,dummyobj,_is,_is,true],
	[shop3,"Item Shop",dummyobj,dummyobj,_is,_is,true],
	[shop4,"Item Shop",dummyobj,dummyobj,_is,_is,true],

	[pub1,"Bar",dummyobj,dummyobj,_pub,_pub,true],

	[gunshop1,"Gun Shop",gunbox1,dummyobj,_gs,_gs,true],

	[equipshop,"Equipment Shop",equipbox,dummyobj,_es,_es,true],

	[tuning1,"Vehicle Upgrades",dummyobj,dummyobj,_cu,_cu,true],
	[tuning2,"Vehicle Upgrades",dummyobj,dummyobj,_cu,_cu,true],

	[carshop1,"Car Shop",dummyobj,carspawn1,_cs,_cs,true],
	[carshop2,"Car Shop",dummyobj,carspawn2,_cs,_cs,true],
	[carshop3,"Car Shop",dummyobj,carspawn3,_cs,_cs,true],

	[truckshop,"Truck Shop",dummyobj,truckspawn,_ts,_ts,true],

	[airshop,"Air Shop",dummyobj,asairspawn,_as,_as,true],
	
	[boatshop,"Boat Shop",dummyobj,boatspawn,_bs,_bs,true],
	
	[tdoc,"Doctor",dummyobj,dummyobj,_td,_td,false],

	[mineshop,"Mining equipment",dummyobj,dummyobj,_ms,_ms,true],

	[resourcesell,"Sell Resources",dummyobj,dummyobj,_rs,_rs,true],

	[RingShop,"Ring Sell", dummyobj,dummyobj,_gds,_gds,true],

	[OilSell1,"Oil Dealer", dummyobj,dummyobj, _emptyshop,_os,true],

	[gangarea1, "Gang Shop", gangbox1, dummyobj, _gangshop_buy, _gangshop_buy, true],
	[gangarea2, "Gang Shop", gangbox2, dummyobj, _gangshop_buy, _gangshop_buy, true],
	[gangarea3, "Gang Shop", gangbox3, dummyobj, _gangshop_buy, _gangshop_buy, true],

	//Cannot use the same object for multiple shops
//	[gangarea1, "Drug Trafficking", dummyobj, dummyobj, _db1,_emptyshop, true],
//	[gangarea2, "Drug Trafficking", dummyobj, dummyobj, _db2,_emptyshop, true],
//	[gangarea3, "Drug Trafficking", dummyobj, dummyobj, _db3,_emptyshop, true],

	[cdrugsell,"Sell Cocaine",dummyobj,dummyobj,_emptyshop,_dsc,true],
	[mdrugsell,"Sell Marijuana",dummyobj,dummyobj,_emptyshop,_dsm,true],
	[ldrugsell,"Sell LSD",dummyobj,dummyobj,_emptyshop,_dsl,true],
	[hdrugsell,"Sell Heroin",dummyobj,dummyobj,_emptyshop,_dsh,true],

	[pmccar,"PMC Land Vehicles",dummyobj, pmccarspawn,_pmcveh,_pmcveh,true],
	[pmcair,"PMC Air Vehicles",dummyobj, pmcairspawn,_pmcair,_pmcair,true],
	[pmcbox,"PMC Equipment",pmcbox,dummyobj,_pmcs,_pmcs,true],

	[terrorshop,"Terrorist Shop",tgunbox,dummyobj,_terrorshop_buy,_terrorshop_buy,true],
	[tboatshop,"Armed Boats",dummyobj,tboatspawn,_tbs,_tbs,true],
	
//	[insboat,"Boat Shop",dummyobj,insboatspawn,_tbs,_tbs,true],
//	[insair,"Air Shop",dummyobj,insairspawn,_as,_as,true],

//	[vipbox,"Illegal Weapon Shop",vipbox,dummyobj,_smgrw,_smgrw,true],
//	[vipcar,"Stolen Vehicles",dummyobj,vipcarspawn,_smgrveh,_smgrveh,true],

	[fishmonger,"Sell to Fishmonger",dummyobj,dummyobj,_fm,_fm,true],
	[butcher,"Sell to Butcher",dummyobj,dummyobj,_bm,_bm,true],
//	[butcher_1,"Sell to Crazy Butcher",dummyobj,dummyobj,_bm1,_bm1,true],

	[civclothes,"Clothing Store",civclothesbox,dummyobj,_civgear,_civgear,true],
	[pmcclothes,"Uniforms and Gear",pmcclothes,dummyobj,_pmcgear,_pmcgear,true],
	[opclothes,"Uniforms and Gear",opclothesbox,dummyobj,_opgear,_opgear,true],
	
	//Insurgent shops
	[inswepshop,"Weapons Shop",inswepshopbox, dummyobj,_inswep,_inswep,true],
	[insclothesbox,"Uniforms and Gear",insclothesbox, dummyobj,_insgear,_insgear,true],
	[inshelishop,"Air Shop",dummyobj, inshelishopspawn,_insair,_insair,true],
	[insequipshop,"Equipment Shop",insequipshopbox, dummyobj,_insequip,_insequip,true],
	[insboatshop, "Boat Shop", dummyobj, insboatshopspawn, _insboat, _insboat, true],
	
	//Opfor shops
	[opfwepsbox_floating,"Weapons Shop",opfwepsbox_floating, dummyobj,_opfweps,_opfweps,true],
	[opfclothesbox_floating,"Uniforms and Gear",opfclothesbox_floating, dummyobj,_opfgear,_opfgear,true],
	[opfequipbox_floating,"Equipment Shop",opfequipbox_floating, dummyobj,_opfequip,_opfequip,true],
	[opfsubshop_floating, "Submersible Shop", dummyobj, opfsubshopspawn_floating, _opfsubshop, _opfsubshop, true],
	
	//Cp1 shops (Opfor)
	[cp1wepsbox,"Weapons Shop",cp1wepsbox, dummyobj,_cp1weps,_cp1weps,true],
	[cp1clothesbox,"Uniforms and Gear",cp1clothesbox, dummyobj,_cp1gear,_cp1gear,true],
	[cp1helishop,"Air Shop",dummyobj, cp1helishopspawn,_cp1air,_cp1air,true],
	[cp1equipbox,"Equipment Shop",cp1equipbox, dummyobj,_cp1equip,_cp1equip,true],
	[cp1boatshop, "Submersible Shop", dummyobj, cp1boatshopspawn,_cp1boat,_cp1boat, true],
	
	//Cp2 shops (Blue4 Airfield)
	[cp2basicshopbox,"Police Shop",cp2basicshopbox, dummyobj, _copshop,_copshop,true],
	[cp2patrolshopbox,"Patrol-Officer",cp2patrolshopbox, dummyobj,_copshop_patrol,_copshop_patrol,true],
	[cp2criminalshopbox,"Criminal Response-Officer", cp2criminalshopbox, dummyobj,_copshop_response,_copshop_response,true],
	[cp2swatshopbox,"SOBR", cp2swatshopbox, dummyobj,_copshop_sobr,_copshop_sobr,true],
	[cp2vehshop,"Police Vehicles", dummyobj, cp2vehshopspawn,_cv,_cv,true],
	[cp2helishop,"Police Helicopters", dummyobj, cp2helishopspawn,_ca,_ca,true],
	[cp2boatshop,"Police Boats", dummyobj, cp2boatshopspawn,_cbs,_cbs,true],
	[cp2swatvehshop,"SOBR Vehicles", dummyobj, cp2swatvehshopspawn,_sv,_sv,true],
	[cp2swathelishop,"SOBR Helicopters", dummyobj, cp2swathelishopspawn,_sa,_sa,true],
	[cp2airshop,"Police Aircraft", dummyobj, cp2airshopspawn,_bas,_bas,true],
	[cp2clothesbox,"Uniforms and Gear",cp2clothesbox,dummyobj,_copgear,_copgear,true],
	
	//blue4 bunker shops 
	[blue4basicshopbox,"Police Shop",blue4basicshopbox, dummyobj, _copshop,_copshop,true],
	[blue4patrolshopbox,"Patrol-Officer",blue4patrolshopbox, dummyobj,_copshop_patrol,_copshop_patrol,true],
	[blue4criminalshopbox,"Criminal Response-Officer", blue4criminalshopbox, dummyobj,_copshop_response,_copshop_response,true],
	[blue4swatshopbox,"SOBR", blue4swatshopbox, dummyobj,_copshop_sobr,_copshop_sobr,true],
	[blue4vehshop,"Police Vehicles", dummyobj, blue4vehshopspawn,_cv,_cv,true],
	[blue4swatvehshop,"SOBR Vehicles", dummyobj, blue4swatvehshopspawn,_sv,_sv,true],
	[blue4clothesbox,"Uniforms and Gear",blue4clothesbox,dummyobj,_copgear,_copgear,true]

//	[fortshop1,"Blufor Fortifications Shop",dummyobj,fortshop1s,_fs1,_fs1,true],
//	[fortshop2,"PMC Fortifications Shop",dummyobj,fortshop2s,_fs2,_fs2,true],
//	[fortshop3,"Factory Fortifications Shop",dummyobj,fortshop3s,_fs3,_fs3,true],
//	[fortshop4,"Terror Fortifications Shop",dummyobj,fortshop4s,_fs4,_fs4,true],
//	[fortshop5,"Opfor Fortifications Shop",dummyobj,fortshop5s,_fs5,_fs5,true],
//	[fortshop6,"Insurgent Fortifications Shop",dummyobj,fortshop6s,_fs6,_fs6,true],
];

// setup use array
A_inv_var_shopusearray = [];
{
	A_inv_var_shopusearray pushBack (_x select INV_INDEX_SHOP_OBJECT);
} forEach A_inv_var_itemshops;

carpark1 setTriggerActivation ["VEHICLE","PRESENT",true];
carpark2 setTriggerActivation ["VEHICLE","PRESENT",true];
carpark3 setTriggerActivation ["VEHICLE","PRESENT",true];
carpark4 setTriggerActivation ["VEHICLE","PRESENT",true];

diag_log format['init_shops, looping A_inv_var_vendors_array'];
{
	diag_log format['loop(%1)-%2',_forEachIndex,_x];
	private _vendor_data = _x;		
	private _vendor = _vendor_data select INV_INDEX_VENDOR_OBJECT;
	
	A_inv_var_vendors_list pushBack _vendor;
} forEach A_inv_var_vendors_array;

if (isServer) then {
	A_inv_var_ItemMaxStocks = [];
	A_inv_var_ItemStocks = [];
	
	{
		private _newArray = _x;
		private _object = _newArray select INV_INDEX_SHOP_OBJECT;
		private _crate = _newArray select INV_INDEX_SHOP_CRATE;
		private _buyList = _newArray select INV_INDEX_SHOP_BUYLIST;
		
		
		// setup for the shops
		if UNDEFINED(_object) then {
			diag_log format["inv_init2: %1, _object undefined", _newArray];
		};
		if UNDEFINED(_crate) then {
			diag_log format["inv_init2: %1, _object _crate", _newArray];
		};
		
		if (_object isKindOf "Man") then {
			//shop is an AI
			removeAllWeapons _object;
			_object switchMove "amovpercmstpsnonwnondnon";
			_object playMoveNow "amovpercmstpsnonwnondnon";
			_object disableAI "move"; 
			_object disableAI "anim";
		}else{
			//shop is a box
			clearMagazineCargoGlobal _object; 
			clearWeaponCargoGlobal _object;
			clearItemCargoGlobal _object;
		};
		
		if (_object != _crate) then {
			clearMagazineCargoGlobal _crate; 
			clearWeaponCargoGlobal _crate;
			clearItemCargoGlobal _crate;
		};
		
		
		// creating the stocks
		private _newStock = [];
		private _newMax	= [];

		{
			private _array = _x;
			private _stock = _array select INV_INDEX_SHOP_LIST_STOCK;
			private _max = _array select INV_INDEX_SHOP_LIST_STOCK_MAX;
			
			_newStock pushBack _stock;
			_newMax pushBack _max;
		} forEach _buyList;

		A_inv_var_ItemStocks pushBack _newStock;
		A_inv_var_ItemMaxStocks pushBack _newMax;
	} forEach A_inv_var_itemshops;
	
	publicVariable "A_inv_var_ItemStocks";
	publicVariable "A_inv_var_ItemMaxStocks";
};

// replaces old array with a new item
// replaces ["itemname",stock1,stock2] with the "itemname"
{
	private _newArray = _x;
	private _buyList = _newArray select INV_INDEX_SHOP_BUYLIST;
	private _sellList = _newArray select INV_INDEX_SHOP_SELLLIST;
	
	private _newBuy	= [];
	private _newSell = [];
	
	{
		private _item = _x select INV_INDEX_SHOP_LIST_ITEM;
		_newBuy pushBack _item;
	} forEach _buyList;
	
	{
		private _item = _x select INV_INDEX_SHOP_LIST_ITEM;
		_newSell pushBack _item;
	} forEach _sellList;
	
	_newArray set[INV_INDEX_SHOP_BUYLIST, _newBuy];
	_newArray set[INV_INDEX_SHOP_SELLLIST, _newSell];
	
	A_inv_var_itemshops set[_forEachIndex,_newArray];
} forEach A_inv_var_itemshops;