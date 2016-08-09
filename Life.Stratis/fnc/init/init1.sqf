// A_init_fnc_init1

#include "..\..\includes\macro.h"


A_main_var_inv_smscost = 25;

A_main_var_add_civmoney = 1250;
A_main_var_add_copmoney = 2500;
A_main_var_add_workplace = 1250;

A_main_var_copwaffenavailable = 0;

A_main_var_copinprisontime = 180;

A_main_var_shooting_self = 0;

A_main_var_srhinbewegen = 0;

A_main_var_hatganggebieterobert = false;

A_main_var_civtimeinprison = 0;

A_main_var_coplog = [];

A_main_var_mayortaxes = 0;

A_main_var_mayortaxpercent = 35;

A_main_var_chiefsteuern = 0;

A_main_var_chiefbekommtsteuern = 35;

A_main_var_eigene_zeit = time;

A_main_var_money_limit = 1000000000;

A_main_var_bank_limit = 1000000000;

A_main_var_wantedbonus = 25000;

A_main_var_monehstehlenmax = 200000;

A_main_var_demerits = 0;

A_main_var_gtbonus = 10;

A_main_var_gtactive = false;

A_main_var_keyblock = false;

A_main_var_maxmanitime = 2400;

A_main_var_powerrestorecost = 10000;

A_main_var_impoundpay = 1000;

A_main_var_noholster = false;

A_main_var_mgcost = 10000;

A_main_var_pkcost = 10000;

A_main_var_squadcost = 20000;

A_main_var_maxinfai = 16;

A_main_var_firestrikes = 3;

A_main_var_totalstrikes = 3;

A_main_var_facworkercost = 15000;

A_main_var_fvspam = false;

A_main_var_maxfacworkers = 50;

A_main_var_maxfacworkers2 = 41;

A_main_var_firingcaptive = false;

A_main_var_lockpickchance = 30;

A_main_var_planting = false;

A_main_var_drugstockinc = 900;

A_main_var_druguserate = 120;

A_main_var_currecciv = false;

A_main_var_curreccop = false;

A_main_var_currecins = false;

A_main_var_currecred = false;

A_main_var_buybi = false;

A_main_var_stunshots = 0;

A_main_var_stunshotsmax = 3;

A_main_var_stunloop = false;

A_main_var_maxstuntime = 15;

A_main_var_stunactivetime = 0;

A_main_var_stuntimeperhit = 15;

A_main_var_stuntimelight = 5;

A_main_var_m_punch = 1.5;

A_main_var_stunpistolfront = 10;

A_main_var_stunpistolback = 15;

A_main_var_stunriflefront = 15;

A_main_var_stunrifleback = 20;

A_main_var_stunpronecrit = 30;

A_main_var_stunpronehev = 25;

A_main_var_stunpronereg = 20;

A_main_var_stunfrontcrit = 25;

A_main_var_stunfronthev = 20;

A_main_var_stunfrontreg = 15;

A_main_var_stunbackcrit = 30;

A_main_var_stunbackhev = 25;

A_main_var_stunbackreg = 25;

A_main_var_m_prone_crit = 0.1;

A_main_var_m_prone_hev = 0.05;

A_main_var_m_prone_reg = 0.01;

A_main_var_m_front_crit = 0.05;

A_main_var_m_front_hev = 0.01;

A_main_var_m_front_reg = 0.005;

A_main_var_m_back_crit = 0.5;

A_main_var_m_back_hev = 0.1;

A_main_var_m_back_reg = 0.05;

A_main_var_pmcopmax = 3;

A_main_var_pmccoplimit = 0;

A_main_var_pmccoptimer = 60 * 30;

A_main_var_pmccoptimerz = false;

A_main_var_s_loaded = false;

// A_actions_fnc_actions, useless
//A_main_var_a_actions = compile preprocessfilelinenumbers "A_actions_fnc_actions.sqf";

// A_actions_fnc_actions_remove, useless
//A_main_var_a_actionsremove = compile preprocessfilelinenumbers "actionsRemove.sqf";

A_main_var_backup_cop_weapons = [
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "M9",
    "m16a4"
];

A_main_var_backup_cop_magazines = [
    "15Rnd_9x19_M9",
    "15Rnd_9x19_M9",
    "15Rnd_9x19_M9SD",
    "15Rnd_9x19_M9SD",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "30Rnd_556x45_Stanag",
    "SmokeShell",
    "SmokeShell",
    "HandGrenade",
    "HandGrenade"
];

A_main_var_backup_opf_weapons = [
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "Makarov",
    "AK_74_GL_kobra"
];

A_main_var_backup_opf_magazines = [
    "8Rnd_9x18_Makarov",
    "8Rnd_9x18_Makarov",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "30Rnd_545x39_AK",
    "HandGrenade_East",
    "HandGrenade_East"
];

A_main_var_backup_ins_weapons = [
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "AK_47_S"
];

A_main_var_backup_ins_magazines = [
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "HandGrenade_East",
    "HandGrenade_East"
];

A_main_var_motdwaittime = 120;

A_main_var_pmissionactive = false;

A_main_var_patrolwaittime = false;

A_main_var_patrolmoneyperkm = 5.0;

A_main_var_govconvoybonus = 20000;

A_main_var_convoyrespawntime = 30;

A_main_var_maxstationmoney = 35000;

A_main_var_wantedamountforrobbing = 25000;

A_main_var_fuel_max_reserve = 10000;

A_main_var_fuel_per_barrel = 100;

A_main_var_fuel_pump_rate = 3;

A_main_var_fuel_base_price = 1;

A_main_var_shoveldur = 20;

A_main_var_shovelmax = 2;

A_main_var_pickaxedur = 50;

A_main_var_pickaxemax = 3;

A_main_var_hammerdur = 100;

A_main_var_hammermax = 4;

A_main_var_working = false;

A_main_var_gangincome = 15000;

A_main_var_gangcreatecost = 75000;

A_main_var_gangdeltime = 300;

A_main_var_gangareas = [gangarea1,gangarea2,gangarea3];

A_main_var_coppatrolarray = [
    getmarkerpos "patrolpoint1",
    getmarkerpos "patrolpoint2",
    getmarkerpos "patrolpoint3",
    getmarkerpos "patrolpoint4",
    getmarkerpos "patrolpoint5",
    getmarkerpos "patrolpoint6",
    getmarkerpos "patrolpoint7",
    getmarkerpos "patrolpoint8",
    getmarkerpos "patrolpoint9",
    getmarkerpos "patrolpoint10",
    getmarkerpos "patrolpoint11",
    getmarkerpos "patrolpoint12",
    getmarkerpos "patrolpoint13",
    getmarkerpos "patrolpoint14",
    getmarkerpos "patrolpoint15",
    getmarkerpos "patrolpoint16"
];

A_main_var_radiotextart_1 = "direct";

A_main_var_radiotextart_2 = "direct";

A_main_var_radiotextart_3 = "direct";

A_main_var_radiotextart_4 = "direct";

A_main_var_publicarbeiterarctionarray = [];

A_main_var_robpoolsafe1 = 0;

A_main_var_robpoolsafe2 = 0;

A_main_var_robpoolsafe3 = 0;

A_main_var_deadtimebonus = 0.001;

A_main_var_selfkilled = 0;

A_main_var_killstrafe = 20000;

A_main_var_copteamkillstrafe = 20000;

A_main_var_gesetzanzahl = 10;

A_main_var_mayorextrapay = 5000;

A_main_var_chiefextrapay = 10000;

A_main_var_atmscriptrunning = 0;

A_main_var_shopactivescript = 0;

A_main_var_deadcam_wechsel_dauer = 5;

A_main_var_slave_cost = 50000;

A_main_var_slavemoneyprosekunde = 500;

A_main_var_maxslave = 6;

A_main_var_copslaveallowed = 1;

A_main_var_localslave = 0;

A_main_var_localslavecounter = 0;

A_main_var_huren_cost = 50000;

A_main_var_hoemoneyprosekunde = 500;

A_main_var_maxhuren = 5;

A_main_var_copworkerallowed = 0;

A_main_var_pimpactive = 0;

A_main_var_localhuren = 0;

A_main_var_localhurencounter = 0;

A_main_var_speedbomb_minspeed = 1;
A_main_var_speedbomb_maxspeed = 100;
A_main_var_speedbomb_mindur = 10;
A_main_var_speedbomb_maxdur = 300;
A_main_var_zeitbombe_mintime = 1;
A_main_var_zeitbombe_maxtime = 10;

A_main_var_publichideoutarray = [];

A_main_var_hideoutcost = 20000;

A_main_var_marker_ausserhalb = param1;
A_main_var_marker_innerhalb = 5;
A_main_var_marker_copdistance = 50;

A_main_var_civmarkerungenau = 20;

A_main_var_workplace_object = 0;
A_main_var_workplace_radius = 1;
A_main_var_workplacearray = [[workplace1, 80], [workplace2, 80], [workplace3, 60]];


A_main_var_nonlethalweapons = ["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];

A_main_var_slavearray = A_main_var_workplacearray;

A_main_var_timeinworkplace = 0;

A_main_var_wpcapacity = 10;

A_main_var_inventory_has_itemshop = 0;

A_main_var_inv_haswepshop = 0;

A_main_var_civclassarray = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
A_main_var_civslavearray = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
A_main_var_civworkerarray = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
A_main_var_terroristarray = ["TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_AAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_HAT_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_EP1"];


A_main_var_inv_droppableitems = [];
A_main_var_alllifemissionobjects = [];

A_main_var_inv_allweaponobjects = [
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// A3 Items
["GPS",                                    ["LinkedItem","Equipment"],["ItemGPS", "GPS"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["Map",                                    ["LinkedItem","Equipment"],["ItemMap","Map"],[1500,1200],[2, "", ""],[],"ItemMap" call A_isse_fnc_cfg_weapons_getname, "ItemMap" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["Radio",                                  ["LinkedItem","Equipment"],["ItemRadio","Radio"],[1500,1200],[2, "", ""],[],"ItemRadio" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["Compass",                                ["LinkedItem","Equipment"],["ItemCompass","Compass"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["Watch",                                  ["LinkedItem","Equipment"],["ItemWatch","Watch"],[500,400],[2, "", ""],[],"ItemCompass" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["Firstaidkit",                            ["BISItem","Equipment"],["FirstAidKit","First Aid Kit"],[1500,1200],[2, "", ""],[],"FirstAidKit" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["Medikit",                                ["BISItem","Equipment"],["Medikit","Medical Kit"],[500,400],[2, "", ""],[],"Medikit" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["Toolkit",                                ["BISItem","Equipment"],["ToolKit","Tool Kit"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Binocs
["Binocular",                              ["Weapon", "Equipment"],["Binocular", "Binoculars"], [1200, 960], [2,"", ""], [], "Binocular" call A_isse_fnc_cfg_weapons_getname, "Binocular" call A_isse_fnc_cfg_weapons_getdesc, [["plastik", 1],["glas", 1]]],
["Rangefinder",                            ["Weapon", "Equipment"],["Rangefinder", "Rangefinder"], [30000, 24000],[2, "", ""],[], "NVGoggles" call A_isse_fnc_cfg_weapons_getname,"NVGoggles" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],
["Laserdesignator",                        ["Weapon","Equipment"],["Laserdesignator", "Laser Designator"], [60000, 48000],[2, "", ""],[], "NVGoggles" call A_isse_fnc_cfg_weapons_getname,"NVGoggles" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],
["NVGoggles",                              ["LinkedItem", "Equipment"],["NVGoggles", "NV Goggles"], [20000, 16000],[2, "", ""],[], "NVGoggles" call A_isse_fnc_cfg_weapons_getname,"NVGoggles" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["glas", 1],["ebauteile", 1]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Pistols
["hgun_P07_F",                             ["Weapon", "pistol"],["hgun_P07_F", "P07"],[14500, 11600], [1, "pistollicense", "patrol"],[], "P70" call A_isse_fnc_cfg_weapons_getname,"P70" call A_isse_fnc_cfg_weapons_getdesc,[["stahl", 5], ["kupfer", 1],["plastik", 1]] ],
["hgun_Rook40_F",                          ["Weapon", "pistol"],["hgun_Rook40_F", "Rook 40"],[18000, 14400], [1, "pistollicense", "patrol"],[], "Rook40" call A_isse_fnc_cfg_weapons_getname,"Rook40" call A_isse_fnc_cfg_weapons_getdesc,[["stahl", 5], ["kupfer", 1],["plastik", 1]] ],
["hgun_Rook40_F_ill",                      ["Weapon", "pistol"],["hgun_Rook40_F", "Rook 40 (Unlicensed)"],[36000, 28800], [1, "", "patrol"],[], "Rook40" call A_isse_fnc_cfg_weapons_getname,"Rook40" call A_isse_fnc_cfg_weapons_getdesc,[["stahl", 5], ["kupfer", 1],["plastik", 1]] ],
["hgun_ACPC2_F",                           ["Weapon", "pistol"],["hgun_ACPC2_F", "ACP-C2"],[8000, 6400], [1, "pistollicense", "patrol"],[], "Rook40" call A_isse_fnc_cfg_weapons_getname,"Rook40" call A_isse_fnc_cfg_weapons_getdesc,[["stahl", 5], ["kupfer", 1],["plastik", 1]] ],
["hgun_ACPC2_F_ill",                       ["Weapon", "pistol"],["hgun_ACPC2_F", "ACP-C2 (Unlicensed)"],[16000, 12800], [1, "", "patrol"],[], "Rook40" call A_isse_fnc_cfg_weapons_getname,"Rook40" call A_isse_fnc_cfg_weapons_getdesc,[["stahl", 5], ["kupfer", 1],["plastik", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Submachineguns
["SMG_01_F",                               ["Weapon", "pistol"],["SMG_01_F", "Vermin SMG"],[35000, 28000], [2, "pmc_license_journeyman", "response"], [], "SMG_01_F" call A_isse_fnc_cfg_weapons_getname, "SMG_01_F" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["plastik", 10],["kupfer", 15]]],
["SMG_02_F",                               ["Weapon", "pistol"],["SMG_02_F", "Scorpion SMG"],[45000, 36000], [2, "", "response"], [], "SMG_02_F" call A_isse_fnc_cfg_weapons_getname, "SMG_02_F" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["plastik", 10],["kupfer", 15]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Assault Rifles
["arifle_MXC_F",                           ["Weapon", "rifle"], ["arifle_MXC_F", "MX Carbine"], [75000, 60000], [2, "bomb", "response"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["arifle_MX_F",                            ["Weapon", "rifle"], ["arifle_MX_F", "MX Rifle"], [90000, 72000], [2, "bomb", "response"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["arifle_MX_GL_F",                         ["Weapon", "rifle"], ["arifle_MX_GL_F", "MX 3GL"], [120000, 96000], [2, "bomb", "response"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["arifle_MX_SW_F",                         ["Weapon", "rifle"], ["arifle_MX_SW_F", "MX SW (LMG)"],[105000, 84000], [2, "bomb", "response"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["arifle_MXM_F",                           ["Weapon", "rifle"], ["arifle_MXM_F", "MX Marksman"], [125000, 100000], [2, "bomb", "response"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["arifle_TRG21_F",                         ["Weapon", "rifle"], ["arifle_TRG21_F", "TRG-21 Rifle"], [95000, 76000], [2, "riflelicense", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["arifle_TRG20_F",                         ["Weapon", "rifle"], ["arifle_TRG20_F", "TRG-20 Carbine"], [75000, 60000], [2, "riflelicense", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["arifle_TRG21_GL_F",                      ["Weapon", "rifle"], ["arifle_TRG21_GL_F",  "TRG-21 EGLM"], [115000, 92000], [2, "riflelicense", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["arifle_Katiba_F",                        ["Weapon", "rifle"], ["arifle_Katiba_F", "Katiba Rifle"], [105000, 84000], [2, "bomb", "response"], [], "Katiba" call A_isse_fnc_cfg_weapons_getname, "Katiba" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 15],["plastik", 5],["wood", 5]]],
["arifle_Katiba_C_F",                      ["Weapon", "rifle"], ["arifle_Katiba_C_F","Katiba Carbine"], [85000, 68000], [2, "bomb", "response"], [], "KatibaC" call A_isse_fnc_cfg_weapons_getname, "KatibaC" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 25],["plastik", 18],["wood", 10]]],
["arifle_Katiba_GL_F",                     ["Weapon", "rifle"], ["arifle_Katiba_GL_F","Katiba EGLM"], [135000, 108000], [2, "bomb", "response"], [], "KatibaGL" call A_isse_fnc_cfg_weapons_getname, "KatibaGL" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 25],["plastik", 18],["wood", 10]]],
["arifle_Mk20_F",                          ["Weapon", "rifle"], ["arifle_Mk20_F", "Mk20 Rifle"], [100000, 80000], [2, "bomb", "response"], [], "Katiba" call A_isse_fnc_cfg_weapons_getname, "Katiba" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 15],["plastik", 5],["wood", 5]]],
["arifle_Mk20C_F",                         ["Weapon", "rifle"], ["arifle_Mk20C_F","Mk20 Carbine"], [80000, 64000], [2, "bomb", "response"], [], "KatibaC" call A_isse_fnc_cfg_weapons_getname, "KatibaC" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 25],["plastik", 18],["wood", 10]]],
["arifle_Mk20_GL_F",                       ["Weapon", "rifle"], ["arifle_Mk20_GL_F","Mk20 EGLM"], [130000, 104000], [2, "bomb", "response"], [], "KatibaGL" call A_isse_fnc_cfg_weapons_getname, "KatibaGL" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 25],["plastik", 18],["wood", 10]]],
["arifle_SDAR_F",                          ["Weapon", "rifle"], ["arifle_SDAR_F", "SDAR Underwater Rifle"], [275000, 220000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Sniper Rifles
["srifle_EBR_F",                           ["Weapon", "rifle"],["srifle_EBR_F", "Mk14 EBR"],[180000, 144000], [2, "bomb", "sobr"], [], "EBR" call A_isse_fnc_cfg_weapons_getname, "EBR" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["plastik", 10],["kupfer", 15]]],
["srifle_GM6_SOS_F",                       ["Weapon", "rifle"], ["srifle_GM6_SOS_F", "GM6 Lynx"], [600000, 480000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["srifle_LRR_SOS_F",                       ["Weapon", "rifle"], ["srifle_LRR_SOS_F", "M320 LRR"], [700000, 560000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Machineguns
["LMG_Mk200_F",                            ["Weapon", "mg"], ["LMG_Mk200_F",   "Mk200 LMG"],[175000, 140000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["LMG_Zafir_F",                            ["Weapon", "mg"], ["LMG_Zafir_F", "Zafir LMG"],[155000, 124000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Launchers
["launch_RPG32_F",                         ["Weapon", "launcher"], ["launch_RPG32_F", "RPG-32"], [1375000, 1100000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_NLAW_F",                          ["Weapon", "launcher"], ["launch_NLAW_F", "NLAW"], [1375000, 1100000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_B_Titan_F",                       ["Weapon", "launcher"], ["launch_B_Titan_F", "Titan"], [2875000, 2300000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_I_Titan_F",                       ["Weapon", "launcher"], ["launch_I_Titan_F", "Titan"], [2875000, 2300000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_O_Titan_F",                       ["Weapon", "launcher"], ["launch_O_Titan_F", "Titan"], [2875000, 2300000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_Titan_F",                         ["Weapon", "launcher"], ["launch_Titan_F", "Titan"], [2875000, 2300000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_B_Titan_short_F",                 ["Weapon", "launcher"], ["launch_B_Titan_short_F", "Titan Compact"],[1850000, 1480000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_I_Titan_short_F",                 ["Weapon", "launcher"], ["launch_I_Titan_short_F", "Titan Compact"],[1850000, 1480000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_O_Titan_short_F",                 ["Weapon", "launcher"], ["launch_O_Titan_short_F", "Titan Compact"],[1850000, 1480000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
["launch_Titan_short_F",                   ["Weapon", "launcher"], ["launch_Titan_short_F", "Titan Compact"],[1850000, 1480000], [2, "bomb", "sobr"],[], "Mk200" call A_isse_fnc_cfg_weapons_getname, "Mk200" call A_isse_fnc_cfg_weapons_getdesc, [["stahl", 60],["wood", 30],["kupfer", 15]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Weapon Attachments
["acc_flashlight",                         ["Attachment","Equipment"],["acc_flashlight", "Flashlight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["acc_pointer_IR",                         ["Attachment","Equipment"],["acc_pointer_IR", "IR Pointer"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_H",                          ["Attachment","Equipment"],["muzzle_snds_H", "Suppressor (6.5mm)"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_L",                          ["Attachment","Equipment"],["muzzle_snds_L", "Suppressor (9mm)"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_M",                          ["Attachment","Equipment"],["muzzle_snds_M", "Suppressor (5.56mm)"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_B",                          ["Attachment","Equipment"],["muzzle_snds_B", "Suppressor (7.62mm)"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_H_MG",                       ["Attachment","Equipment"],["muzzle_snds_H_MG", "LMG Suppressor (6.5mm)"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_Arco",                             ["Attachment","Equipment"],["optic_Arco", "ARCO Scope"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_Hamr",                             ["Attachment","Equipment"],["optic_Hamr", "HAMR Scope"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_Aco",                              ["Attachment","Equipment"],["optic_Aco", "ACO Scope"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_ACO_grn",                          ["Attachment","Equipment"],["optic_ACO_grn", "ACOg Scope"],[2000, 1500], [2, "pmc_license_journeyman", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_Holosight",                        ["Attachment","Equipment"],["optic_Holosight", "Holo Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_SOS",                              ["Attachment","Equipment"],["optic_SOS", "SOS Scope"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_MRCO",                             ["Attachment","Equipment"],["optic_MRCO", "MRCO Scope"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["acc_pointer_IR_ill",                     ["Attachment","Equipment"],["acc_pointer_IR", "IR Pointer"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_H_ill",                      ["Attachment","Equipment"],["muzzle_snds_H", "Suppressor (6.5mm)"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_L_ill",                      ["Attachment","Equipment"],["muzzle_snds_L", "Suppressor (9mm)"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_M_ill",                      ["Attachment","Equipment"],["muzzle_snds_M", "Suppressor (5.56mm)"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_B_ill",                      ["Attachment","Equipment"],["muzzle_snds_B", "Suppressor (7.62mm)"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["muzzle_snds_H_MG_ill",                   ["Attachment","Equipment"],["muzzle_snds_H_MG", "LMG Suppressor (6.5mm)"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_Arco_ill",                         ["Attachment","Equipment"],["optic_Arco", "ARCO Scope"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_Aco_ill",                          ["Attachment","Equipment"],["optic_Aco", "ACO Scope"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_ACO_grn_ill",                      ["Attachment","Equipment"],["optic_ACO_grn", "ACOg Scope"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["optic_Holosight_ill",                    ["Attachment","Equipment"],["optic_Holosight", "Holo Sight"],[2000, 1500], [2, "bomb", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Basic Clothes
["U_B_CombatUniform_mcam",                 ["Uniform","Clothing"],["U_B_CombatUniform_mcam","Multicam Uniform"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_B_CombatUniform_mcam_tshirt",          ["Uniform","Clothing"],["U_B_CombatUniform_mcam_tshirt","Multicam T-Shirt"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_B_CombatUniform_mcam_vest",            ["Uniform","Clothing"],["U_B_CombatUniform_mcam_vest","Multicam T-Shirt"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_B_GhillieSuit",                        ["Uniform","Clothing"],["U_B_GhillieSuit","Ghillie Suit"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_B_HeliPilotCoveralls",                 ["Uniform","Clothing"],["U_B_HeliPilotCoveralls","Pilot Coveralls"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_B_Wetsuit",                            ["Uniform","Clothing"],["U_B_Wetsuit","Wetsuit"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_O_CombatUniform_ocamo",                ["Uniform","Clothing"],["U_O_CombatUniform_ocamo","Camouflage Uniform"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_O_GhillieSuit",                        ["Uniform","Clothing"],["U_O_GhillieSuit","Ghillie Suit"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_O_PilotCoveralls",                     ["Uniform","Clothing"],["U_O_PilotCoveralls","Pilot Coveralls"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_O_Wetsuit",                            ["Uniform","Clothing"],["U_O_Wetsuit","Wetsuit"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Poloshirt_blue",                     ["Uniform","Clothing"],["U_C_Poloshirt_blue", "Polo Shirt (Blue)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Poloshirt_burgundy",                 ["Uniform","Clothing"],["U_C_Poloshirt_burgundy","Polo Shirt (Burgundy)"],[1500,1200],[2, "", ""],[],"ItemMap" call A_isse_fnc_cfg_weapons_getname, "ItemMap" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Poloshirt_stripped",                 ["Uniform","Clothing"],["U_C_Poloshirt_stripped","Polo Shirt (Striped)"],[1500,1200],[2, "", ""],[],"ItemRadio" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Poloshirt_tricolour",                ["Uniform","Clothing"],["U_C_Poloshirt_tricolour","Polo Shirt Tricolor)"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Poloshirt_salmon",                   ["Uniform","Clothing"],["U_C_Poloshirt_salmon","Polo Shirt (Salmon)"],[500,400],[2, "", ""],[],"ItemCompass" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Poloshirt_redwhite",                 ["Uniform","Clothing"],["U_C_Poloshirt_redwhite","Polo Shirt (Red-White)"],[1500,1200],[2, "", ""],[],"FirstAidKit" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Commoner1_1",                        ["Uniform","Clothing"],["U_C_Commoner1_1","Commoner Clothes (1)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Commoner1_2",                        ["Uniform","Clothing"],["U_C_Commoner1_2","Commoner Clothes (2)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_C_Commoner1_3",                        ["Uniform","Clothing"],["U_C_Commoner1_3","Commoner Clothes (3)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_Rangemaster",                          ["Uniform","Clothing"],["U_Rangemaster","Rangemaster Uniform"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_B_CombatUniform_mcam_worn",            ["Uniform","Clothing"],["U_B_CombatUniform_mcam_worn","Worn Fatigues (Multicam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["U_B_CombatUniform_wdl",                ["Uniform","Clothing"],["U_B_CombatUniform_wdl","Combat Fatigues (Multicam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["U_B_CombatUniform_wdl_tshirt",         ["Uniform","Clothing"],["U_B_CombatUniform_wdl_tshirt","Fatigue T-Shirt (Multicam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["U_B_CombatUniform_wdl_vest",           ["Uniform","Clothing"],["U_B_CombatUniform_wdl_vest","Fatigue Vest (Multicam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["U_B_CombatUniform_sgg",                ["Uniform","Clothing"],["U_B_CombatUniform_sgg","Combat Fatigues (Sage)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["U_B_CombatUniform_sgg_tshirt",         ["Uniform","Clothing"],["U_B_CombatUniform_sgg_tshirt","Fatigue T-Shirt (Sage)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["U_B_CombatUniform_sgg_vest",           ["Uniform","Clothing"],["U_B_CombatUniform_sgg_vest","Fatigue Vest (Sage)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_B_SpecopsUniform_sgg",                 ["Uniform","Clothing"],["U_B_SpecopsUniform_sgg","Specop Fatigues (Sage)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["U_B_PilotCoveralls",                   ["Uniform","Clothing"],["U_B_PilotCoveralls","Pilot Coveralls"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_O_CombatUniform_oucamo",               ["Uniform","Clothing"],["U_O_CombatUniform_oucamo","Combat Fatigues (Urban)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_O_SpecopsUniform_ocamo",               ["Uniform","Clothing"],["U_O_SpecopsUniform_ocamo","Specops Fatigues (Hexcam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_O_SpecopsUniform_blk",                 ["Uniform","Clothing"],["U_O_SpecopsUniform_blk","Specops Fatigues (Black)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_O_OfficerUniform_ocamo",               ["Uniform","Clothing"],["U_O_OfficerUniform_ocamo","Officer Fatigues (Hexcam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_I_CombatUniform",                      ["Uniform","Clothing"],["U_I_CombatUniform","Combat Fatigues"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_I_CombatUniform_tshirt",               ["Uniform","Clothing"],["U_I_CombatUniform_tshirt","Fatigue T-Shirt"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_I_CombatUniform_shortsleeve",          ["Uniform","Clothing"],["U_I_CombatUniform_shortsleeve","Fatigue Shortsleeve"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_I_pilotCoveralls",                     ["Uniform","Clothing"],["U_I_pilotCoveralls","Pilot Coveralls"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_I_HeliPilotCoveralls",                 ["Uniform","Clothing"],["U_I_HeliPilotCoveralls","Heli Pilot Coveralls"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_I_GhillieSuit",                        ["Uniform","Clothing"],["U_I_GhillieSuit","Ghillie Suit"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_I_OfficerUniform",                     ["Uniform","Clothing"],["U_I_OfficerUniform","Officer Uniform"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_I_Wetsuit",                            ["Uniform","Clothing"],["U_I_Wetsuit","Wetsuit"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["U_Competitor",                           ["Uniform","Clothing"],["U_Competitor","ION Outfit"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Vests
["V_BandollierB_khk",                      ["Vest","Clothing"],["V_BandollierB_khk","Bandolier (Khaki)"],[1500,1200],[2, "", ""],[],"ItemMap" call A_isse_fnc_cfg_weapons_getname, "ItemMap" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_BandollierB_rgr",                      ["Vest","Clothing"],["V_BandollierB_rgr","Bandolier (Green)"],[1500,1200],[2, "", ""],[],"ItemRadio" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_BandollierB_cbr",                      ["Vest","Clothing"],["V_BandollierB_cbr","Bandolier (Coyote)"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_BandollierB_oli",                      ["Vest","Clothing"],["V_BandollierB_oli","Bandolier (Olive)"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_TacVest_khk",                          ["Vest","Clothing"],["V_TacVest_khk","Tac Vest (Khaki"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_TacVest_brn",                          ["Vest","Clothing"],["V_TacVest_brn","Tac Vest (Brown)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_TacVest_oli",                          ["Vest","Clothing"],["V_TacVest_oli","Tac Vest (Olive)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_TacVest_blk",                          ["Vest","Clothing"],["V_TacVest_blk","Tac Vest (Black)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_TacVest_camo",                         ["Vest","Clothing"],["V_TacVest_camo","Tac Vest (Camo)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_TacVest_blk_POLICE",                   ["Vest","Clothing"],["V_TacVest_blk_POLICE","Tac Vest (Police)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_RebreatherB",                          ["Vest","Clothing"],["V_RebreatherB","Rebreather"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_RebreatherIR",                         ["Vest","Clothing"],["V_RebreatherIR","Rebreather"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_RebreatherIA",                         ["Vest","Clothing"],["V_RebreatherIA","Rebreather"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_Rangemaster_belt",                     ["Vest","Clothing"],["V_Rangemaster_belt", "Rangemaster Belt"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrier1_rgr",                    ["Vest","Clothing"],["V_PlateCarrier1_rgr","Carrier Lite (Green)"],[500,400],[2, "", ""],[],"ItemCompass" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrier1_cbr",                    ["Vest","Clothing"],["V_PlateCarrier1_cbr","Carrier Lite (Coyote)"],[1500,1200],[2, "", ""],[],"FirstAidKit" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrier1_blk",                    ["Vest","Clothing"],["V_PlateCarrier1_blk","Carrier Lite (Black)"],[1500,1200],[2, "", ""],[],"FirstAidKit" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrier2_rgr",                    ["Vest","Clothing"],["V_PlateCarrier2_rgr","Carrier Rig (Green)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrier2_cbr",                    ["Vest","Clothing"],["V_PlateCarrier2_cbr","Carrier Rig (Coyote)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrier2_blk",                    ["Vest","Clothing"],["V_PlateCarrier2_blk","Carrier Rig (Black)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrierGL_rgr",                   ["Vest","Clothing"],["V_PlateCarrierGL_rgr","Carrier GL (Green)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrierGL_cbr",                   ["Vest","Clothing"],["V_PlateCarrierGL_cbr","Carrier GL (Coyote)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrierGL_blk",                   ["Vest","Clothing"],["V_PlateCarrierGL_blk","Carrier GL (Black)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_Chestrig_khk",                         ["Vest","Clothing"],["V_Chestrig_khk","Chest Rig (Khaki)"], [500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["V_ChestrigF_oli",                      ["Vest","Clothing"],["V_ChestrigF_oli","Chest Rig (Olive)"], [500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_HarnessO_brn",                         ["Vest","Clothing"],["V_HarnessO_brn","LBV Harness (Brown)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_HarnessO_gry",                         ["Vest","Clothing"],["V_HarnessO_gry","LBV Harness (Gray)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_HarnessOGL_gry",                       ["Vest","Clothing"],["V_HarnessOGL_gry","LBV GL Harness (Gray)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_HarnessOSpec_gry",                     ["Vest","Clothing"],["V_HarnessOSpec_gry","ELBV Harness (Gray)"], [500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_HarnessOGL_brn",                       ["Vest","Clothing"],["V_HarnessOGL_brn","LBV GL Harness (Brown)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrierSpec_rgr",                 ["Vest","Clothing"],["V_PlateCarrierSpec_rgr","Carrier Special (Green)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrierSpec_cbr",                 ["Vest","Clothing"],["V_PlateCarrierSpec_cbr","Carrier Special (Coyote)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_TacVestIR_blk",                        ["Vest","Clothing"],["V_TacVestIR_blk","Raven Vest"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_HarnessOSpec_brn",                     ["Vest","Clothing"],["V_HarnessOSpec_brn","ELBV Harness (Brown)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_TacVestCamo_khk",                      ["Vest","Clothing"],["V_TacVestCamo_khk","Camo Vest"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrierIA1_dgtl",                 ["Vest","Clothing"],["V_PlateCarrierIA1_dgtl","Carrier Lite (Digicam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrierIA2_dgtl",                 ["Vest","Clothing"],["V_PlateCarrierIA2_dgtl","Carrier Rig (Digicam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["V_PlateCarrierIAGL_dgtl",                ["Vest","Clothing"],["V_PlateCarrierIAGL_dgtl","Carrier GL (Digicam)"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Helmets (and hats)
["H_HelmetB",                              ["Headgear","Equipment"],["H_HelmetB", "ECH Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetB_paint",                        ["Headgear","Equipment"],["H_HelmetB_paint","ECH (Spraypaint)"],[500,400],[2, "", ""],[],"ItemCompass" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetB_light",                        ["Headgear","Equipment"],["H_HelmetB_light","ECH (Light)"],[1500,1200],[2, "", ""],[],"FirstAidKit" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetO_ocamo",                        ["Headgear","Equipment"],["H_HelmetO_ocamo","Hexcam Helmet"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetO_oucamo",                       ["Headgear","Equipment"],["H_HelmetO_oucamo","Urban Hexcam Helmet"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_PilotHelmetHeli_B",                    ["Headgear","Equipment"],["H_PilotHelmetHeli_B","Heli Pilot Helmet"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_PilotHelmetHeli_O",                    ["Headgear","Equipment"],["H_PilotHelmetHeli_O","Heli Pilot Helmet"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_PilotHelmetHeli_I",                    ["Headgear","Equipment"],["H_PilotHelmetHeli_I","Heli Pilot Helmet"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Booniehat_khk",                        ["Headgear","Equipment"],["H_Booniehat_khk","Khaki Boonie"],[1500,1200],[2, "", ""],[],"ItemMap" call A_isse_fnc_cfg_weapons_getname, "ItemMap" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Booniehat_mcamo",                      ["Headgear","Equipment"],["H_Booniehat_mcamo","Multicam Boonie"],[1500,1200],[2, "", ""],[],"ItemRadio" call A_isse_fnc_cfg_weapons_getname, "ItemRadio" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Booniehat_ocamo",                      ["Headgear","Equipment"],["H_Booniehat_ocamo","Hexcam Boonie"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Booniehat_grn",                        ["Headgear","Equipment"],["H_Booniehat_grn","Green Boonie"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Booniehat_tan",                        ["Headgear","Equipment"],["H_Booniehat_tan","Tan Boonie"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Booniehat_dirty",                      ["Headgear","Equipment"],["H_Booniehat_dirty","Dirty Boonie"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Booniehat_dgtl",                       ["Headgear","Equipment"],["H_Booniehat_dgtl","Digicam Boonie"],[500,400],[2, "", ""],[],"ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_red",                              ["Headgear","Equipment"],["H_Cap_red","Red Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Cap_brn_SERO",                       ["Headgear","Equipment"],["H_Cap_brn_SERO","SERO Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_blu",                              ["Headgear","Equipment"],["H_Cap_blu","Blue Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_tan",                              ["Headgear","Equipment"],["H_Cap_tan","Tan Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_blk",                              ["Headgear","Equipment"],["H_Cap_blk","Black Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_blk_CMMG",                         ["Headgear","Equipment"],["H_Cap_blk_CMMG","Black CMMG Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_brn_SPECOPS",                      ["Headgear","Equipment"],["H_Cap_brn_SPECOPS","Brown Specops Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Cap_blu_POLICE",                     ["Headgear","Equipment"],["H_Cap_blu_POLICE","Blue Police Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_tan_specops_US",                   ["Headgear","Equipment"],["H_Cap_tan_specops_US","Tan Specops Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_khaki_specops_UK",                 ["Headgear","Equipment"],["H_Cap_khaki_specops_UK","Khaki Specops Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_grn",                              ["Headgear","Equipment"],["H_Cap_grn","Green Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_grn_BI",                           ["Headgear","Equipment"],["H_Cap_grn_BI","Green BI Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_blk_Raven",                        ["Headgear","Equipment"],["H_Cap_blk_Raven","Raven Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_blk_ION",                          ["Headgear","Equipment"],["H_Cap_blk_ION","ION Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Cap_surfer",                         ["Headgear","Equipment"],["H_Cap_surfer","Surfer Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Cap_headphones",                       ["Headgear","Equipment"],["H_Cap_headphones","Cap and Headphones"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_MilCap_ocamo",                         ["Headgear","Equipment"],["H_MilCap_ocamo","Hexcam Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_MilCap_mcamo",                         ["Headgear","Equipment"],["H_MilCap_mcamo","Multicam Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_MilCap_oucamo",                        ["Headgear","Equipment"],["H_MilCap_oucamo","Urban Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_MilCap_rucamo",                        ["Headgear","Equipment"],["H_MilCap_rucamo","Russian Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_MilCap_gry",                           ["Headgear","Equipment"],["H_MilCap_gry","Grey Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_MilCap_dgtl",                          ["Headgear","Equipment"],["H_MilCap_dgtl","Digicam Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_MilCap_blue",                          ["Headgear","Equipment"],["H_MilCap_blue","Blue Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_MilCap_chck1",                       ["Headgear","Equipment"],["H_MilCap_chck1","Checked Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_MilCap_chck2",                       ["Headgear","Equipment"],["H_MilCap_chck2","Checked Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_MilCap_chck3",                       ["Headgear","Equipment"],["H_MilCap_chck3","Checked Cap"],[500,400],[2, "", ""],[],"ToolKit" call A_isse_fnc_cfg_weapons_getname, "ItemCompass" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetB_plain_mcamo",                  ["Headgear","Equipment"],["H_HelmetB_plain_mcamo", "Combat Helmet (Multicam)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetB_plain_blk",                    ["Headgear","Equipment"],["H_HelmetB_plain_blk", "Combat Helmet (Black)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetSpecB",                          ["Headgear","Equipment"],["H_HelmetSpecB", "Special Forces Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetSpecB_paint1",                   ["Headgear","Equipment"],["H_HelmetSpecB_paint1", "SF Helmet (Light Paint)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetSpecB_paint2",                   ["Headgear","Equipment"],["H_HelmetSpecB_paint2", "SF Helmet (Dark Paint)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetSpecB_blk",                      ["Headgear","Equipment"],["H_HelmetSpecB_blk", "SF Helmet (Black)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetIA",                             ["Headgear","Equipment"],["H_HelmetIA", "MICH Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetIA_net",                         ["Headgear","Equipment"],["H_HelmetIA_net", "MICH (Camo)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetIA_camo",                        ["Headgear","Equipment"],["H_HelmetIA_camo", "MICH2 (Camo)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetCrew_B",                         ["Headgear","Equipment"],["H_HelmetCrew_B", "Crew Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetCrew_O",                         ["Headgear","Equipment"],["H_HelmetCrew_O", "Crew Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetCrew_I",                         ["Headgear","Equipment"],["H_HelmetCrew_I", "Crew Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_PilotHelmetFighter_B",                 ["Headgear","Equipment"],["H_PilotHelmetFighter_B", "Fighter Pilot Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_PilotHelmetFighter_O",                 ["Headgear","Equipment"],["H_PilotHelmetFighter_O", "Fighter Pilot Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_PilotHelmetFighter_I",                 ["Headgear","Equipment"],["H_PilotHelmetFighter_I", "Fighter Pilot Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_CrewHelmetHeli_B",                     ["Headgear","Equipment"],["H_CrewHelmetHeli_B", "Heli Crew Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_CrewHelmetHeli_O",                     ["Headgear","Equipment"],["H_CrewHelmetHeli_O", "Heli Crew Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_CrewHelmetHeli_I",                     ["Headgear","Equipment"],["H_CrewHelmetHeli_I", "Heli Crew Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_BandMask_blk",                         ["Headgear","Equipment"],["H_BandMask_blk", "Black Bandana/Mask"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_BandMask_khk",                         ["Headgear","Equipment"],["H_BandMask_khk", "Khaki Bandana/Mask"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_BandMask_reaper",                      ["Headgear","Equipment"],["H_BandMask_reaper", "Reaper Bandana/Mask"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_BandMask_demon",                       ["Headgear","Equipment"],["H_BandMask_demon", "Demon Bandana/Mask"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetSpecO_ocamo",                    ["Headgear","Equipment"],["H_HelmetSpecO_ocamo", "Assassin Helmet"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_HelmetSpecO_blk",                      ["Headgear","Equipment"],["H_HelmetSpecO_blk", "Assassin Helmet (Black)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Bandanna_surfer",                    ["Headgear","Equipment"],["H_Bandanna_surfer", "Surfer Bandana"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Bandanna_khk",                       ["Headgear","Equipment"],["H_Bandanna_khk", "Khaki Bandana"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Bandanna_cbr",                       ["Headgear","Equipment"],["H_Bandanna_cbr", "Coyote Bandana"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Bandanna_sgg",                       ["Headgear","Equipment"],["H_Bandanna_sgg", "Sage Bandana"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Bandanna_gry",                       ["Headgear","Equipment"],["H_Bandanna_gry", "Gray Bandana"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Bandanna_camo",                      ["Headgear","Equipment"],["H_Bandanna_camo", "Camo Bandana"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Bandanna_mcamo",                     ["Headgear","Equipment"],["H_Bandanna_mcamo", "Multicam Bandana"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Shemag_khk",                         ["Headgear","Equipment"],["H_Shemag_khk", "Khaki Shemagh"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Shemag_tan",                         ["Headgear","Equipment"],["H_Shemag_tan", "Tan Shemagh"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_ShemagOpen_khk",                     ["Headgear","Equipment"],["H_ShemagOpen_khk", "Khaki Shemagh (Open)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_ShemagOpen_tan",                     ["Headgear","Equipment"],["H_ShemagOpen_tan", "Tan Shemagh (Open)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Beret_blk",                            ["Headgear","Equipment"],["H_Beret_blk", "Black Beret"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Beret_blk_POLICE",                     ["Headgear","Equipment"],["H_Beret_blk_POLICE", "Police Beret"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Beret_red",                            ["Headgear","Equipment"],["H_Beret_red", "Red Beret"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Beret_grn",                            ["Headgear","Equipment"],["H_Beret_grn", "Green Beret"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Beret_grn_SF",                         ["Headgear","Equipment"],["H_Beret_grn_SF", "Green SF Beret"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Beret_brn_SF",                         ["Headgear","Equipment"],["H_Beret_brn_SF", "Brown SF Beret"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Beret_ocamo",                          ["Headgear","Equipment"],["H_Beret_ocamo", "Hexcam Beret"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Watchcap_blk",                         ["Headgear","Equipment"],["H_Watchcap_blk", "Black Beanie"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Watchcap_khk",                         ["Headgear","Equipment"],["H_Watchcap_khk", "Khaki Beanie"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Watchcap_camo",                        ["Headgear","Equipment"],["H_Watchcap_camo", "Camo Beanie"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["H_Watchcap_sgg",                         ["Headgear","Equipment"],["H_Watchcap_sgg", "Sage Beanie"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_TurbanO_blk",                        ["Headgear","Equipment"],["H_TurbanO_blk", "Black Turban"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_StrawHat",                           ["Headgear","Equipment"],["H_StrawHat", "Straw Hat"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_StrawHat_dark",                      ["Headgear","Equipment"],["H_StrawHat_dark", "Straw Hat (Dark)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Hat_blue",                           ["Headgear","Equipment"],["H_Hat_blue", "Blue Hat"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Hat_brown",                          ["Headgear","Equipment"],["H_Hat_brown", "Brown Hat"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Hat_camo",                           ["Headgear","Equipment"],["H_Hat_camo", "Camo Hat"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Hat_grey",                           ["Headgear","Equipment"],["H_Hat_grey", "Gray Hat"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Hat_checker",                        ["Headgear","Equipment"],["H_Hat_checker", "Checkered Hat"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
//["H_Hat_tan",                            ["Headgear","Equipment"],["H_Hat_tan", "Tan Hat"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Glasses
["G_Diving",                               ["Goggles","Equipment"],["G_Diving", "Diving Goggles"],[2000, 1500], [2, "", ""],[], "G_Diving" call A_isse_fnc_cfg_weapons_getname, "G_Diving" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Shades_Black",                         ["Goggles","Equipment"],["G_Shades_Black", "Shades (Black)"],[2000, 1500], [2, "", ""],[], "G_Shades_Black" call A_isse_fnc_cfg_weapons_getname, "G_Shades_Black" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Shades_Blue",                          ["Goggles","Equipment"],["G_Shades_Blue", "Shades (Blue)"],[2000, 1500], [2, "", ""],[], "G_Shades_Blue" call A_isse_fnc_cfg_weapons_getname, "G_Shades_Blue" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Sport_Blackred",                       ["Goggles","Equipment"],["G_Sport_Blackred", "Sport Shades (Vulcan)"],[2000, 1500], [2, "", ""],[], "G_Sport_Blackred" call A_isse_fnc_cfg_weapons_getname,"G_Sport_Blackred" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Tactical_Clear",                       ["Goggles","Equipment"],["G_Tactical_Clear", "Tactical Glasses"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Spectacles",                           ["Goggles","Equipment"],["G_Spectacles", "Hipster Glasses"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Spectacles_Tinted",                    ["Goggles","Equipment"],["G_Spectacles_Tinted", "Hipster Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Combat",                               ["Goggles","Equipment"],["G_Combat", "Combat Goggles"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Lowprofile",                           ["Goggles","Equipment"],["G_Lowprofile", "Low Profile Combat Goggles"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Shades_Green",                         ["Goggles","Equipment"],["G_Shades_Green", "Green Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Shades_Red",                           ["Goggles","Equipment"],["G_Shades_Red", "Red Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Squares",                              ["Goggles","Equipment"],["G_Squares", "Square Glasses"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Squares_Tinted",                       ["Goggles","Equipment"],["G_Squares_Tinted", "Square Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Sport_BlackWhite",                     ["Goggles","Equipment"],["G_Sport_BlackWhite", "Shadow Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Sport_Blackyellow",                    ["Goggles","Equipment"],["G_Sport_Blackyellow", "Poison Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Sport_Greenblack",                     ["Goggles","Equipment"],["G_Sport_Greenblack", "Yetti Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Sport_Checkered",                      ["Goggles","Equipment"],["G_Sport_Checkered", "Style Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Sport_Red",                            ["Goggles","Equipment"],["G_Sport_Red", "Fire Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["G_Tactical_Black",                       ["Goggles","Equipment"],["G_Tactical_Black", "Tactical Shades"],[2000, 1500], [2, "", ""],[], "G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getname,"G_Tactical_Clear" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Pistol Presets
["hgun_P07_snds_F",                        ["Weapon","Equipment"],["hgun_P07_snds_F", "P07 SD (Tazer)"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["hgun_Rook40_snds_F",                     ["Weapon","Equipment"],["hgun_Rook40_snds_F","Rook 40 SD"],[1500,1200],[2, "", ""],[],"ItemMap" call A_isse_fnc_cfg_weapons_getname, "ItemMap" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["hgun_ACPC2_snds_F",                      ["Weapon","Equipment"],["hgun_ACPC2_snds_F","ACP-C2 SD"],[1500,1200],[2, "", ""],[],"ItemMap" call A_isse_fnc_cfg_weapons_getname, "ItemMap" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// SMG Presets
["SMG_01_Holo_F",                          ["Weapon","Equipment"],["SMG_01_Holo_F", "Vermin Holo Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["SMG_01_Holo_pointer_snds_F",             ["Weapon","Equipment"],["SMG_01_Holo_pointer_snds_F", "Vermin Holo Pointer SD"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["SMG_01_ACO_F",                           ["Weapon","Equipment"],["SMG_01_ACO_F", "Vermin ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["SMG_02_ACO_F",                           ["Weapon","Equipment"],["SMG_02_ACO_F", "Scorpion ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["SMG_02_ARCO_pointg_F",                   ["Weapon","Equipment"],["SMG_02_ARCO_pointg_F", "Scorpion ARCO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Sniper Presets
["srifle_EBR_ACO_F",                       ["Weapon","Equipment"],["srifle_EBR_ACO_F", "EBR ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["srifle_EBR_MRCO_pointer_F",              ["Weapon","Equipment"],["srifle_EBR_MRCO_pointer_F","EBR ACO Pointer"],[1500,1200],[2, "", ""],[],"ItemMap" call A_isse_fnc_cfg_weapons_getname, "ItemMap" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["srifle_EBR_ARCO_pointer_F",              ["Weapon","Equipment"],["srifle_EBR_ARCO_pointer_F", "EBR ARCO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["srifle_EBR_SOS_F",                       ["Weapon","Equipment"],["srifle_EBR_SOS_F","EBR Scope"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["srifle_GM6_SOS_F",                       ["Weapon","Equipment"],["srifle_GM6_SOS_F", "GM6 Scope"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["srifle_LRR_SOS_F",                       ["Weapon","Equipment"],["srifle_LRR_SOS_F","LRR Scope"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MG Presets
["LMG_Mk200_MRCO_F",                       ["Weapon","Equipment"],["LMG_Mk200_MRCO_F", "Mk200 MRCO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["LMG_Mk200_pointer_F",                    ["Weapon","Equipment"],["LMG_Mk200_pointer_F","Mk200 Pointer"],[1500,1200],[2, "", ""],[],"ItemMap" call A_isse_fnc_cfg_weapons_getname, "ItemMap" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["LMG_Zafir_pointer_F",                    ["Weapon","Equipment"],["LMG_Zafir_pointer_F", "Zafir Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Katiba Presets
["arifle_Katiba_ACO_F",                    ["Weapon","Equipment"],["arifle_Katiba_ACO_F", "Katiba ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Katiba_ACO_pointer_F",            ["Weapon","Equipment"],["arifle_Katiba_ACO_pointer_F", "Katiba ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Katiba_ARCO_F",                   ["Weapon","Equipment"],["arifle_Katiba_ARCO_F", "Katiba ARCO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Katiba_ARCO_pointer_F",           ["Weapon","Equipment"],["arifle_Katiba_ARCO_pointer_F", "Katiba ARCO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Katiba_C_ACO_pointer_F",          ["Weapon","Equipment"],["arifle_Katiba_C_ACO_pointer_F", "Katiba Carbine ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Katiba_C_ACO_F",                  ["Weapon","Equipment"],["arifle_Katiba_C_ACO_F", "Katiba Carbine ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Katiba_GL_ACO_F",                 ["Weapon","Equipment"],["arifle_Katiba_GL_ACO_F", "Katiba GL ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Katiba_GL_ARCO_pointer_F",        ["Weapon","Equipment"],["arifle_Katiba_GL_ARCO_pointer_F", "Katiba GL ARCO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Katiba_GL_ACO_pointer_F",         ["Weapon","Equipment"],["arifle_Katiba_GL_ACO_pointer_F", "Katiba GL ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MX Presets
["arifle_MXC_Holo_F",                      ["Weapon","rifle"],["arifle_MXC_Holo_F", "MXC Holo Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MXC_Holo_pointer_F",              ["Weapon","rifle"],["arifle_MXC_Holo_pointer_F", "MXC Holo Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MXC_ACO_F",                       ["Weapon","rifle"],["arifle_MXC_ACO_F", "MXC ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MXC_Holo_pointer_snds_F",         ["Weapon","rifle"],["arifle_MXC_Holo_pointer_snds_F", "MXC Holo Pointer SD"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MXC_ACO_pointer_F",               ["Weapon","rifle"],["arifle_MXC_ACO_pointer_F", "MXC ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_pointer_F",                    ["Weapon","rifle"],["arifle_MX_pointer_F", "MX IR Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_Holo_pointer_F",               ["Weapon","rifle"],["arifle_MX_Holo_pointer_F", "MX Holo Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_Hamr_pointer_F",               ["Weapon","rifle"],["arifle_MX_Hamr_pointer_F", "MX Hamr Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_ACO_pointer_F",                ["Weapon","rifle"],["arifle_MX_ACO_pointer_F", "MX ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_ACO_F",                        ["Weapon","rifle"],["arifle_MX_ACO_F", "MX ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_GL_ACO_F",                     ["Weapon","rifle"],["arifle_MX_GL_ACO_F", "MX GL ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_GL_ACO_pointer_F",             ["Weapon","rifle"],["arifle_MX_GL_ACO_pointer_F", "MX GL ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_GL_Hamr_pointer_F",            ["Weapon","rifle"],["arifle_MX_GL_Hamr_pointer_F", "MX GL Hamr Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_SW_pointer_F",                 ["Weapon","rifle"],["arifle_MX_SW_pointer_F", "MX SW Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MX_SW_Hamr_pointer_F",            ["Weapon","rifle"],["arifle_MX_SW_Hamr_pointer_F", "MX SW Hamr Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MXM_Hamr_pointer_F",              ["Weapon","rifle"],["arifle_MXM_Hamr_pointer_F", "MXM Hamr Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_MXM_SOS_pointer_F",               ["Weapon","rifle"],["arifle_MXM_SOS_pointer_F", "MXM Scope Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// TRG21 Presets
["arifle_TRG21_GL_ACO_pointer_F",          ["Weapon","rifle"],["arifle_TRG21_GL_ACO_pointer_F", "TRG21 GL ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_TRG21_ACO_pointer_F",             ["Weapon","rifle"],["arifle_TRG21_ACO_pointer_F", "TRG21 ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_TRG21_ARCO_pointer_F",            ["Weapon","rifle"],["arifle_TRG21_ARCO_pointer_F", "TRG21 ARCO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_TRG20_Holo_F",                    ["Weapon","rifle"],["arifle_TRG20_Holo_F", "TRG20 Holo Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_TRG20_ACO_pointer_F",             ["Weapon","rifle"],["arifle_TRG20_ACO_pointer_F", "TRG20 Aco Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_TRG20_ACO_Flash_F",               ["Weapon","rifle"],["arifle_TRG20_ACO_Flash_F", "TRG20 ACO Flashlight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_TRG20_ACO_F",                     ["Weapon","rifle"],["arifle_TRG20_ACO_F", "TRG20 ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Mk20 Presets
["arifle_Mk20_pointer_F",                  ["Weapon","rifle"],["arifle_Mk20_pointer_F", "Mk20 IR Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20_Holo_F",                     ["Weapon","rifle"],["arifle_Mk20_Holo_F", "Mk20 Holo Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20_ACO_F",                      ["Weapon","rifle"],["arifle_Mk20_ACO_F", "Mk20 ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20_ACO_pointer_F",              ["Weapon","rifle"],["arifle_Mk20_ACO_pointer_F", "Mk20 ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20_MRCO_F",                     ["Weapon","rifle"],["arifle_Mk20_MRCO_F", "Mk20 MRCO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20_MRCO_pointer_F",             ["Weapon","rifle"],["arifle_Mk20_MRCO_pointer_F", "Mk20 MRCO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20C_ACO_F",                     ["Weapon","rifle"],["arifle_Mk20C_ACO_F", "Mk20C ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20C_ACO_pointer_F",             ["Weapon","rifle"],["arifle_Mk20C_ACO_pointer_F", "Mk20C ACO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20_GL_MRCO_pointer_F",          ["Weapon","rifle"],["arifle_Mk20_GL_MRCO_pointer_F", "Mk20 GL MRCO Pointer"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["arifle_Mk20_GL_ACO_F",                   ["Weapon","rifle"],["arifle_Mk20_GL_ACO_F", "Mk20 GL ACO Sight"],[2000, 1500], [2, "", ""],[], "ItemGPS" call A_isse_fnc_cfg_weapons_getname, "ItemGPS" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// UAV Terminals
["I_UavTerminal",                          ["LinkedItem","Equipment"],["I_UavTerminal", "UAV Terminal (independent)"],[2000, 1500], [2, "", ""],[], "I_UavTerminal" call A_isse_fnc_cfg_weapons_getname, "I_UavTerminal" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["B_UavTerminal",                          ["LinkedItem","Equipment"],["B_UavTerminal", "UAV Terminal (bluefor)"],[2000, 1500], [2, "", ""],[], "B_UavTerminal" call A_isse_fnc_cfg_weapons_getname, "B_UavTerminal" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ],
["O_UavTerminal",                          ["LinkedItem","Equipment"],["O_UavTerminal", "UAV Terminal (opfor)"],[2000, 1500], [2, "", ""],[], "O_UavTerminal" call A_isse_fnc_cfg_weapons_getname, "O_UavTerminal" call A_isse_fnc_cfg_weapons_getdesc,[["plastik", 1],["ebauteile", 1]] ]
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
];

A_main_var_inv_allmagazineobjects = [
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// A3 Items
["Laserbatteries",                         ["Magazine", "Equipment"],["Laserbatteries", "Laser Batteries"],[800, 640],[1, "",""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Pistol and SMG Ammo
["30Rnd_9x21_Mag",                         ["Magazine", "pistol"],["30Rnd_9x21_Mag", "30Rnd 9mm"],[2400, 1920],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["16Rnd_9x21_Mag",                         ["Magazine", "pistol"],["16Rnd_9x21_Mag", "16Rnd 9mm"],[800, 640],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["9Rnd_45ACP_Mag",                         ["Magazine", "pistol"],["9Rnd_45ACP_Mag","9Rnd .45"],[800, 640],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["30Rnd_45ACP_Mag_SMG_01",                 ["Magazine", "pistol"],["30Rnd_45ACP_Mag_SMG_01", "30Rnd 9mm Vector"],[2400, 1920],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["30Rnd_45ACP_Mag_SMG_01_Tracer_Green",    ["Magazine", "pistol"],["30Rnd_45ACP_Mag_SMG_01_Tracer_Green","30Rnd 9mm Vector Green"],[2400, 1920],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Rocket Launcher Ammo
["NLAW_F",                                 ["Magazine", "launcher"],["NLAW_F", "NLAW Rocket"],[150000,120000], [3, "bomb", "sobr"],[], "PG7V" call A_isse_fnc_cfg_magazineinfo,"PG7V" call A_isse_fnc_cfg_magazineinfo,[["kupfer", 15],["blackpowder", 15],["ebauteile", 2]]],
["RPG32_F",                                ["Magazine", "launcher"],["RPG32_F", "RPG32 Rocket"],[100000,80000], [3, "bomb", "sobr"],[], "PG7V" call A_isse_fnc_cfg_magazineinfo,"PG7V" call A_isse_fnc_cfg_magazineinfo,[["kupfer", 15],["blackpowder", 15],["ebauteile", 2]]],
["RPG32_AA_F",                             ["Magazine", "launcher"],["RPG32_AA_F", "RPG32 AA Rocket"],[250000,200000], [3, "bomb", "sobr"],[], "PG7V" call A_isse_fnc_cfg_magazineinfo,"PG7V" call A_isse_fnc_cfg_magazineinfo,[["kupfer", 15],["blackpowder", 15],["ebauteile", 2]]],
["Titan_AA",                               ["Magazine", "launcher"],["Titan_AA", "Titan AA Rocket"],[500000,200000], [3, "bomb", "sobr"],[], "PG7V" call A_isse_fnc_cfg_magazineinfo,"PG7V" call A_isse_fnc_cfg_magazineinfo,[["kupfer", 15],["blackpowder", 15],["ebauteile", 2]]],
["Titan_AP",                               ["Magazine", "launcher"],["Titan_AP", "Titan AP Rocket"],[300000,240000], [3, "bomb", "sobr"],[], "PG7V" call A_isse_fnc_cfg_magazineinfo,"PG7V" call A_isse_fnc_cfg_magazineinfo,[["kupfer", 15],["blackpowder", 15],["ebauteile", 2]]],
["Titan_AT",                               ["Magazine", "launcher"],["Titan_AT", "Titan AT Rocket"],[400000,320000], [3, "bomb", "sobr"],[], "PG7V" call A_isse_fnc_cfg_magazineinfo,"PG7V" call A_isse_fnc_cfg_magazineinfo,[["kupfer", 15],["blackpowder", 15],["ebauteile", 2]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Grenade Launcher Ammo
["Rnd_HE",                                 ["Magazine", "rifle"],["1Rnd_HE_Grenade_shell", "1Rnd HE"],[1200, 960], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3HE",                                ["Magazine", "rifle"],["3Rnd_HE_Grenade_shell", "3Rnd HE"],[3000, 2400], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_A_other_fnc_smoke",                              ["Magazine", "rifle"],["1Rnd_A_other_fnc_smoke_Grenade_shell", "1Rnd White A_other_fnc_smoke"],[1000, 800], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3A_other_fnc_smoke",                             ["Magazine", "rifle"],["3Rnd_A_other_fnc_smoke_Grenade_shell", "3Rnd White A_other_fnc_smoke"],[2800, 2240], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_RedA_other_fnc_smoke",                           ["Magazine", "rifle"],["1Rnd_A_other_fnc_smokeRed_Grenade_shell", "1Rnd Red A_other_fnc_smoke"],[1000, 800], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3RedA_other_fnc_smoke",                          ["Magazine", "rifle"],["3Rnd_A_other_fnc_smokeRed_Grenade_shell", "3Rnd Red A_other_fnc_smoke"],[2800, 2240], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_GreenA_other_fnc_smoke",                         ["Magazine", "rifle"],["1Rnd_A_other_fnc_smokeGreen_Grenade_shell", "1Rnd Green A_other_fnc_smoke"],[1000, 800], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3GreenA_other_fnc_smoke",                        ["Magazine", "rifle"],["3Rnd_A_other_fnc_smokeGreen_Grenade_shell", "3Rnd Green A_other_fnc_smoke"],[2800, 2240], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_YellowA_other_fnc_smoke",                        ["Magazine", "rifle"],["1Rnd_A_other_fnc_smokeYellow_Grenade_shell", "1Rnd Yellow A_other_fnc_smoke"],[1000, 800], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3YellowA_other_fnc_smoke",                       ["Magazine", "rifle"],["3Rnd_A_other_fnc_smokeYellow_Grenade_shell", "3Rnd Yellow A_other_fnc_smoke"],[2800, 2240], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_PurpleA_other_fnc_smoke",                        ["Magazine", "rifle"],["1Rnd_A_other_fnc_smokePurple_Grenade_shell", "1Rnd Purple A_other_fnc_smoke"],[1000, 800], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3PurpleA_other_fnc_smoke",                       ["Magazine", "rifle"],["3Rnd_A_other_fnc_smokePurple_Grenade_shell", "3Rnd Purple A_other_fnc_smoke"],[2800, 2240], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_BlueA_other_fnc_smoke",                          ["Magazine", "rifle"],["1Rnd_A_other_fnc_smokeBlue_Grenade_shell", "1Rnd Blue A_other_fnc_smoke"],[1000, 800], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3A_other_fnc_smokeBlue",                         ["Magazine", "rifle"],["3Rnd_A_other_fnc_smokeBlue_Grenade_shell", "3Rnd Blue A_other_fnc_smoke"],[2800, 2240], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_OrangeA_other_fnc_smoke",                        ["Magazine", "rifle"],["1Rnd_A_other_fnc_smokeOrange_Grenade_shell", "1Rnd Orange A_other_fnc_smoke"],[1000, 800], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3OrangeA_other_fnc_smoke",                       ["Magazine", "rifle"],["3Rnd_A_other_fnc_smokeOrange_Grenade_shell", "3Rnd Orange A_other_fnc_smoke"],[2800, 2240], [1, "", ""], [], "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_A_other_fnc_smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_FlareWhite",                         ["Magazine", "rifle"],["UGL_FlareWhite_F", "1Rnd White Flare"],[1000, 800], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3FlareWhite",                        ["Magazine", "rifle"],["3Rnd_UGL_FlareWhite_F", "3Rnd White Flare"],[2800, 2240], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_FlareGreen",                         ["Magazine", "rifle"],["UGL_FlareGreen_F", "1Rnd Green Flare"],[1000, 800], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3FlareGreen",                        ["Magazine", "rifle"],["3Rnd_UGL_FlareGreen_F", "3Rnd Green Flare"],[2800, 2240], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_FlareRed",                           ["Magazine", "rifle"],["UGL_FlareRed_F", "1Rnd Red Flare"],[1000, 800], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3FlareRed",                          ["Magazine", "rifle"],["3Rnd_UGL_FlareRed_F", "3Rnd Red Flare"],[2800, 2240], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_FlareYellow",                        ["Magazine", "rifle"],["UGL_FlareYellow_F", "1Rnd Yellow Flare"],[1000, 800], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3FlareYellow",                       ["Magazine", "rifle"],["3Rnd_UGL_FlareYellow_F", "3Rnd Yellow Flare"],[2800, 2240], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_FlareCIR",                           ["Magazine", "rifle"],["UGL_FlareCIR_F", "1Rnd IR Flare"],[1200, 960], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Rnd_3FlareCIR",                          ["Magazine", "rifle"],["3Rnd_UGL_FlareCIR_F", "3Rnd IR Flare"],[3600, 2880], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["FlareWhite_F",                           ["Magazine", "rifle"],["FlareWhite_F", "20mm White Flare"],[800, 640], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["FlareGreen_F",                           ["Magazine", "rifle"],["FlareGreen_F", "20mm Green Flare"],[800, 640], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["FlareRed_F",                             ["Magazine", "rifle"],["FlareRed_F", "20mm Red Flare"],[800, 640], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["FlareYellow_F",                          ["Magazine", "rifle"],["FlareYellow_F", "20mm Yellow Flare"],[800, 640], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Thrown
["HandGrenade_Stone",                      ["Magazine", "explosive"],["HandGrenade_Stone", "Firecracker"], [250, 200],[4, "",""],[], "HandGrenade" call A_isse_fnc_cfg_magazineinfo,"HandGrenade" call A_isse_fnc_cfg_magazineinfo,[["kupfer", 1],["blackpowder", 1]] ],
["HandGrenade",                            ["Magazine", "explosive"],["HandGrenade", "Hand Grenade"],[2000, 1600], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["SmokeShell",                             ["Magazine", "equipment"],["SmokeShell", "Tear Gas"],[750, 600],[0, "", ""],[], "SmokeShell" call A_isse_fnc_cfg_magazineinfo,"SmokeShell" call A_isse_fnc_cfg_magazineinfo,[["kupfer", 1],["blackpowder", 1]] ],
["A_other_fnc_smokeShellRed",                          ["Magazine", "equipment"],["A_other_fnc_smokeShellRed", "Red A_other_fnc_smoke Grenade"],[2000, 1600], [0, "", ""], [], "A_other_fnc_smokeShellRed" call A_isse_fnc_cfg_magazineinfo, "A_other_fnc_smokeShellRed" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["A_other_fnc_smokeShellGreen",                        ["Magazine", "equipment"],["A_other_fnc_smokeShellGreen", "Green A_other_fnc_smoke Grenade"],[2000, 1600], [0, "", ""], [], "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["A_other_fnc_smokeShellYellow",                       ["Magazine", "equipment"],["A_other_fnc_smokeShellYellow", "Yellow A_other_fnc_smoke Grenade"],[2000, 1600], [0, "", ""], [], "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["A_other_fnc_smokeShellPurple",                       ["Magazine", "equipment"],["A_other_fnc_smokeShellPurple", "Purple A_other_fnc_smoke Grenade"],[2000, 1600], [0, "", ""], [], "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["A_other_fnc_smokeShellBlue",                         ["Magazine", "equipment"],["A_other_fnc_smokeShellBlue", "Blue A_other_fnc_smoke Grenade"],[2000, 1600], [0, "", ""], [], "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["A_other_fnc_smokeShellOrange",                       ["Magazine", "equipment"],["A_other_fnc_smokeShellOrange", "Orange A_other_fnc_smoke Grenade"],[2000, 1600], [0, "", ""], [], "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, "A_other_fnc_smokeShellGreen" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Chemlight_green",                        ["Magazine", "equipment"],["Chemlight_green", "Green Chemlight"],[800, 640], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Chemlight_red",                          ["Magazine", "equipment"],["Chemlight_red", "Red Chemlight"],[800, 640], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Chemlight_yellow",                       ["Magazine", "equipment"],["Chemlight_yellow", "Yellow Chemlight"],[800, 640], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Chemlight_blue",                         ["Magazine", "equipment"],["Chemlight_blue", "Blue Chemlight"],[800, 640], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["MiniGrenade",                            ["Magazine", "explosive"],["MiniGrenade", "Mini-Grenade"],[1200, 960], [1, "", ""], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Put
["ATMine",                                 ["Magazine", "explosive"],["ATMine_Range_Mag", "AT Mine"],[12000, 9600], [1, "bomb", "sobr"], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["APERSMine",                              ["Magazine", "explosive"],["APERSMine_Range_Mag", "APERS Mine"],[12000, 9600], [1, "bomb", "sobr"], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["APERSBoundingMine",                      ["Magazine", "explosive"],["APERSBoundingMine_Range_Mag", "APERS Bounding Mine"],[12000, 9600], [1, "bomb", "sobr"], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["SLAMDirectionalMine",                    ["Magazine", "explosive"],["SLAMDirectionalMine_Wire_Mag", "SLAM AT Mine"],[12000, 9600], [1, "bomb", "sobr"], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["APERSTripMine",                          ["Magazine", "explosive"],["APERSTripMine_Wire_Mag", "APERS Tripwire Mine"],[12000, 9600], [1, "bomb", "sobr"], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["Claymore",                               ["Magazine", "explosive"],["ClaymoreDirectionalMine_Remote_Mag","Claymore Charge"],[12000, 9600], [1, "bomb", "sobr"], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["SatchelCharge",                          ["Magazine", "explosive"],["SatchelCharge_Remote_Mag", "Satchel Charge"],[12000, 9600], [1, "bomb", "sobr"], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["DemoCharge",                             ["Magazine", "explosive"],["DemoCharge_Remote_Mag", "Demolition Charge"],[12000, 9600], [1, "bomb", "sobr"], [], "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, "1Rnd_Smoke_M203" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// MG Ammo
["100Rnd_65x39_caseless_mag",              ["Magazine", "mg"],["100Rnd_65x39_caseless_mag", "100Rnd 6.5mm Caseless"],[4000, 3200],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["100Rnd_65x39_caseless_mag_Tracer",       ["Magazine", "mg"],["100Rnd_65x39_caseless_mag_Tracer", "100Rnd 6.5mm Tracer"],[4000, 3200],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["200Rnd_65x39_cased_Box",                 ["Magazine", "mg"],["200Rnd_65x39_cased_Box", "200Rnd 6.5mm Cased"],[7000, 5600],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["200Rnd_65x39_cased_Box_Tracer",          ["Magazine", "mg"],["200Rnd_65x39_cased_Box_Tracer", "200Rnd 6.5mm Tracer"],[7000, 5600],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["150Rnd_762x51_Box",                      ["Magazine", "mg"],["150Rnd_762x51_Box", "150Rnd 7.62mm"],[4500, 3600],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["150Rnd_762x51_Box_Tracer",               ["Magazine", "mg"],["150Rnd_762x51_Box_Tracer", "150Rnd 7.62mm Tracer"],[4500, 3600],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Heavy Sniper Ammo
["5Rnd_127x108_Mag",                       ["Magazine", "rifle"],["5Rnd_127x108_Mag", "5Rnd 12.7mm"],[8000, 6400],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["7Rnd_408_Mag",                           ["Magazine", "rifle"],["7Rnd_408_Mag", "7Rnd .408"],[10000, 8000],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Sniper Rifle Ammo
["5Rnd_65x39_Mag",                         ["Magazine", "rifle"],["5Rnd_65x39_Mag", "5Rnd 6.5mm Hunting Rifle"],[2200, 1760],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Rifle Ammo
["30Rnd_556x45_Stanag",                    ["Magazine", "rifle"],["30Rnd_556x45_Stanag", "30Rnd Stanag 5.56mm"],[2000, 1600],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["30Rnd_556x45_Stanag_Tracer_Red",         ["Magazine", "rifle"],["30Rnd_556x45_Stanag_Tracer_Red", "30Rnd Stanag 5.56mm Red"],[2000, 1600],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["30Rnd_556x45_Stanag_Tracer_Green",       ["Magazine", "rifle"],["30Rnd_556x45_Stanag_Tracer_Green","30Rnd Stanag 5.56mm Green"],[2000, 1600],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["30Rnd_556x45_Stanag_Tracer_Yellow",      ["Magazine", "rifle"],["30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd Stanag 5.56mm Yellow"],[2000, 1600],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["20Rnd_556x45_UW_mag",                    ["Magazine", "rifle"],["20Rnd_556x45_UW_mag", "20Rnd Underwater 5.56mm"],[5000, 4000],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["30Rnd_65x39_caseless_mag",               ["Magazine", "rifle"],["30Rnd_65x39_caseless_mag","30Rnd 6.5mm Caseless"],[2500, 2000],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["30Rnd_65x39_caseless_green",             ["Magazine", "rifle"],["30Rnd_65x39_caseless_green_mag_Tracer","30Rnd 6.5mm Caseless Grn"],[2500, 2000],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["30Rnd_65x39_caseless_mag_Tracer",        ["Magazine", "rifle"],["30Rnd_65x39_caseless_mag_Tracer", "30Rnd 6.5mm Caseless Red"],[2500, 2000],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ],
["20Rnd_762x51_Mag",                       ["Magazine", "rifle"],["20Rnd_762x51_Mag", "20Rnd 7.62mm"],[1500, 1200],[1, "", ""],[], "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, "30Rnd_556x45_G36" call A_isse_fnc_cfg_magazineinfo, [["kupfer", 1],["blackpowder", 1]] ]
];

A_main_var_inv_allvehiclesarray = [
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Cars
["B_Quadbike_01_F",                                     ["Vehicle", "car"],["B_Quadbike_01_F", "Quadbike"],[6000, 5000], [1, "car", "probator", 60],  [150, [1,0,0,3]], "B_Quadbike_01_F" call A_isse_fnc_cfg_vehicle_getname, "B_Quadbike_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["O_Quadbike_01_F",                                     ["Vehicle", "car"],["O_Quadbike_01_F", "Quadbike"],[6000, 5000], [1, "car", "probator", 60],  [150, [1,0,0,3]], "O_Quadbike_01_F" call A_isse_fnc_cfg_vehicle_getname, "O_Quadbike_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["I_Quadbike_01_F",                                     ["Vehicle", "car"],["O_Quadbike_01_F", "Quadbike"],[6000, 5000], [1, "car", "probator", 60],  [150, [1,0,0,3]], "O_Quadbike_01_F" call A_isse_fnc_cfg_vehicle_getname, "O_Quadbike_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Quadbike_01_F",                                     ["Vehicle", "car"],["O_Quadbike_01_F", "Quadbike"],[6000, 5000], [1, "car", "probator", 60],  [150, [1,0,0,3]], "O_Quadbike_01_F" call A_isse_fnc_cfg_vehicle_getname, "O_Quadbike_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F",                                      ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (random)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_red",                                  ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (red)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_white",                                ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (white)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_tan",                                  ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (tan)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_dark_blue",                            ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (blue)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_bur",                                  ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (burgundy)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_rider",                                ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (rider)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_sky_blue",                             ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (sky blue)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_hot_pink",                             ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (hot pink)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_black",                                ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (black)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_white_services",                       ["Vehicle", "car"],["C_Offroad_01_F", "Service Offroad (white)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_tan_services",                         ["Vehicle", "car"],["C_Offroad_01_F", "Service Offroad (tan)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_white_backpacks_construction",         ["Vehicle", "car"],["C_Offroad_01_F", "PMC Offroad (white)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_black_backpacks_construction",         ["Vehicle", "car"],["C_Offroad_01_F", "PMC Offroad (black)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_bur_backpacks_construction",           ["Vehicle", "car"],["C_Offroad_01_F", "PMC Offroad (burgundy)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_red_police_bumper2_construction",      ["Vehicle", "car"],["C_Offroad_01_F", "Police Offroad (red)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_dark_blue_police_bumper2_construction",["Vehicle", "car"],["C_Offroad_01_F", "Police Offroad (blue)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_bur_police_bumper2_construction",      ["Vehicle", "car"],["C_Offroad_01_F", "Police Offroad (burgundy)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_white_police_bumper2_construction",    ["Vehicle", "car"],["C_Offroad_01_F", "Police Offroad (white)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_black_police_bumper2_construction",    ["Vehicle", "car"],["C_Offroad_01_F", "Police Offroad (black)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Offroad_01_F_rider_construction",                   ["Vehicle", "car"],["C_Offroad_01_F", "Offroad (The rider)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Offroad_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_light_tan",                          ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (tan)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_dark_tan",                           ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (dark tan)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_light_gray",                         ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (light gray)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_dark_gray",                          ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (dark gray)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_light_blue",                         ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (light blue)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_dark_blue",                          ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (dark blue)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_light_green",                        ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (light green)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_light_yellow",                       ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (light yellow)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_black",                              ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (black)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_F_white",                              ["Vehicle", "car"],["C_Hatchback_01_F", "Hatchback (white)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_sport_F_red",                          ["Vehicle", "car"],["C_Hatchback_01_sport_F", "Sports Hatchback (red)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_sport_F_blue",                         ["Vehicle", "car"],["C_Hatchback_01_sport_F", "Sports Hatchback (blue)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_sport_F_orange",                       ["Vehicle", "car"],["C_Hatchback_01_sport_F", "Sports Hatchback (orange)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_sport_F_white",                        ["Vehicle", "car"],["C_Hatchback_01_sport_F", "Sports Hatchback (white)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_sport_F_light_gray",                   ["Vehicle", "car"],["C_Hatchback_01_sport_F", "Sports Hatchback (light gray)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Hatchback_01_sport_F_dark_green",                   ["Vehicle", "car"],["C_Hatchback_01_sport_F", "Sports Hatchback (dark green)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getname, "C_Hatchback_01_sport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_SUV_01_F_red",                                      ["Vehicle", "car"],["C_SUV_01_F", "SUV (red)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_SUV_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_SUV_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_SUV_01_F_black",                                    ["Vehicle", "car"],["C_SUV_01_F", "SUV (black)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_SUV_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_SUV_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_SUV_01_F_gray",                                     ["Vehicle", "car"],["C_SUV_01_F", "SUV (gray)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_SUV_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_SUV_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_SUV_01_F_orange",                                   ["Vehicle", "car"],["C_SUV_01_F", "SUV (orange)"],[45500, 29125], [2, "car", "probator", 250], [150, [1,0,0,3]], "C_SUV_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_SUV_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Trucks
["B_Truck_01_covered_F",                                ["Vehicle", "truck"],["B_Truck_01_covered_F", "HEMTT Covered"],[280000, 224000], [1, "truck", "probator", 900], [150, [1,0,0,3]], "B_Truck_01_covered_F" call A_isse_fnc_cfg_vehicle_getname, "B_Truck_01_covered_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["B_Truck_01_transport_F",                              ["Vehicle", "truck"],["B_Truck_01_transport_F", "HEMTT Open"],[260000, 208000], [1, "truck", "probator", 900],  [150, [1,0,0,3]], "B_Truck_01_transport_F" call A_isse_fnc_cfg_vehicle_getname, "B_Truck_01_transport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["O_Truck_02_covered_F",                                ["Vehicle", "truck"],["O_Truck_02_covered_F", "Zamak Covered"],[180000, 144000],[1, "truck", "probator", 800],  [150, [1,0,0,3]], "O_Truck_02_covered_F" call A_isse_fnc_cfg_vehicle_getname, "O_Truck_02_covered_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["O_Truck_02_transport_F",                              ["Vehicle", "truck"],["O_Truck_02_transport_F", "Zamak Open"],[160000, 128000], [1, "truck", "probator", 800],  [150, [1,0,0,3]], "O_Truck_02_transport_F" call A_isse_fnc_cfg_vehicle_getname, "O_Truck_02_transport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["I_Truck_02_covered_F",                                ["Vehicle", "truck"],["I_Truck_02_covered_F", "Zamak Covered"],[180000, 144000], [1, "truck", "probator", 800],  [150, [1,0,0,3]], "I_Truck_02_covered_F" call A_isse_fnc_cfg_vehicle_getname, "I_Truck_02_covered_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["I_Truck_02_transport_F",                              ["Vehicle", "truck"],["I_Truck_02_transport_F", "Zamak Open"],[160000, 128000], [1, "truck", "probator", 800],  [150, [1,0,0,3]], "I_Truck_02_transport_F" call A_isse_fnc_cfg_vehicle_getname, "I_Truck_02_transport_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_transport_F_fwhite_bwhite",                  ["Vehicle", "truck"],["C_Van_01_transport_F", "Tansport Van (white)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_transport_F" call A_isse_fnc_cfg_vehicle_getname, "c_offroad" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_transport_F_fcamo_bcamo",                    ["Vehicle", "truck"],["C_Van_01_transport_F", "Tansport Van (camo)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_transport_F" call A_isse_fnc_cfg_vehicle_getname, "c_offroad" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_transport_F_fred_bred",                      ["Vehicle", "truck"],["C_Van_01_transport_F", "Tansport Van (red)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_transport_F" call A_isse_fnc_cfg_vehicle_getname, "c_offroad" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_fuel_F_fwhite_bwhite",                       ["Vehicle", "truck"],["C_Van_01_fuel_F", "Refuel Van (white)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_fuel_F" call A_isse_fnc_cfg_vehicle_getname, "C_Van_01_fuel_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_fuel_F_fred_bred",                           ["Vehicle", "truck"],["C_Van_01_fuel_F", "Refuel Van (red)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_fuel_F" call A_isse_fnc_cfg_vehicle_getname, "C_Van_01_fuel_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_fuel_F_fcamo_bcamo",                         ["Vehicle", "truck"],["C_Van_01_fuel_F", "Refuel Van (camo)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_fuel_F" call A_isse_fnc_cfg_vehicle_getname, "C_Van_01_fuel_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_box_F_fwhite",                               ["Vehicle", "truck"],["C_Van_01_box_F", "Box Van (white)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_box_F" call A_isse_fnc_cfg_vehicle_getname, "C_Van_01_box_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_box_F_fred",                                 ["Vehicle", "truck"],["C_Van_01_box_F", "Box Van (red)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_box_F" call A_isse_fnc_cfg_vehicle_getname, "C_Van_01_box_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["C_Van_01_box_F_fcamo",                                ["Vehicle", "truck"],["C_Van_01_box_F", "Box Van (camo)"],[45500, 29125], [1, "truck", "probator", 250], [150, [1,0,0,3]], "C_Van_01_box_F" call A_isse_fnc_cfg_vehicle_getname, "C_Van_01_box_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Armed cars
["B_MRAP_01_F",                                         ["Vehicle", "car"],["B_MRAP_01_F", "Hunter"],[340000, 272000], [1, "bomb", "response", 300],  [150, [1,0,0,3]], "B_MRAP_01_F" call A_isse_fnc_cfg_vehicle_getname, "B_MRAP_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["B_MRAP_01_hmg_F",                                     ["Vehicle", "car"],["B_MRAP_01_hmg_F", "Hunter HMG"],[540000, 432000], [1, "bomb", "sobr", 200],  [150, [1,0,0,3]], "B_MRAP_01_HMG_F" call A_isse_fnc_cfg_vehicle_getname, "B_MRAP_01_HMG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["B_MRAP_01_gmg_F",                                     ["Vehicle", "car"],["B_MRAP_01_gmg_F", "Hunter GMG"],[940000, 752000], [1, "bomb", "sobr", 150],  [150, [1,0,0,3]], "B_MRAP_01_RCWS_F" call A_isse_fnc_cfg_vehicle_getname, "B_MRAP_01_RCWS_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["O_MRAP_02_F",                                         ["Vehicle", "car"],["O_MRAP_02_F", "Ifrit"],[440000, 352000], [1, "bomb", "response", 300],  [150, [1,0,0,3]], "O_MRAP_02_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["O_MRAP_02_hmg_F",                                     ["Vehicle", "car"],["O_MRAP_02_hmg_F", "Ifrit HMG"],[740000, 592000], [1, "bomb", "sobr", 200],  [150, [1,0,0,3]], "O_MRAP_02_MG_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_MG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["O_MRAP_02_gmg_F",                                     ["Vehicle", "car"],["O_MRAP_02_gmg_F", "Ifrit GMG"],[1105500, 884400], [2, "bomb", "sobr", 150], [150, [1,0,0,3]], "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["I_MRAP_03_F",                                         ["Vehicle", "car"],["I_MRAP_02_F", "Strider"],[360000, 288000], [1, "bomb", "response", 300],  [150, [1,0,0,3]], "O_MRAP_02_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["I_MRAP_03_hmg_F",                                     ["Vehicle", "car"],["I_MRAP_02_hmg_F", "Strider HMG"],[550000, 440000], [1, "bomb", "sobr", 200], [150, [1,0,0,3]], "O_MRAP_02_MG_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_MG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["I_MRAP_03_gmg_F",                                     ["Vehicle", "car"],["I_MRAP_02_gmg_F", "Strider GMG"],[955500, 764400], [2, "bomb", "sobr", 150], [150, [1,0,0,3]], "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// APC
["B_APC_Wheeled_01_cannon_F",                           ["Vehicle", "car"],["B_APC_Wheeled_01_cannon_F", "AMV-7 (APC)"],[8055500, 6009125], [2, "bomb", "sobr", 150], [150, [1,0,0,3]], "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["O_APC_Wheeled_02_rcws_F",                             ["Vehicle", "car"],["O_APC_Wheeled_02_rcws_F", "MSE-3 (APC)"],[12055500, 8009125], [2, "bomb", "sobr", 150], [150, [1,0,0,3]], "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["B_APC_Tracked_01_rcws_F",                             ["Vehicle", "car"],["B_APC_Tracked_01_rcws_F", "IFV-6c (APC)"],[22055500, 14009125], [2, "bomb", "sobr", 150], [150, [1,0,0,3]], "B_APC_Tracked_01_rcws_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
["O_APC_Tracked_02_cannon_F",                           ["Vehicle", "car"],["O_APC_Tracked_02_cannon_F", "BTR-K (APC)"],[32055500, 14009125], [2, "bomb", "sobr", 150], [150, [1,0,0,3]], "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getname, "O_MRAP_02_GMG_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 4],["glas", 1],["plastik", 1],["petroleum", 4]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Air
["B_Heli_Light_01_F",                                   ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_nobenches_adddoors",                ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_nobenches_adddoors_blueline",       ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Blueline)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_nobenches_adddoors_elliptical",     ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Elliptical)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_nobenches_adddoors_sheriff",        ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Sherrif)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_nobenches_adddoors_jeans",          ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Jeans)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_nobenches_adddoors_speedy",         ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Speedy)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_vrana",                             ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Vrana)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_wasp",                              ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Wasp)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_wave",                              ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Wave)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_sunset",                            ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Sunset)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_shadow",                            ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Shadow)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_graywatcher",                       ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Graywatcher)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_furious",                           ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Furious)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_F_digital",                           ["Vehicle", "air"],["B_Heli_Light_01_F", "MH-9 (Transport/Digital)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_F", "B_Heli_Light_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_armed_F",                             ["Vehicle", "air"],["B_Heli_Light_01_armed_F", "AH-9 (Attack)"],[2500000, 2000000], [5, "air", "air_support_training", 150], [1000, [1,2,0,13] ], "B_Heli_Light_01_armed_F", "B_Heli_Light_01_armed_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_armed_F_digital",                     ["Vehicle", "air"],["B_Heli_Light_01_armed_F", "MH-9 (Attack/Digital)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_armed_F", "B_Heli_Light_01_armed_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Light_01_armed_F_wasp",                        ["Vehicle", "air"],["B_Heli_Light_01_armed_F", "MH-9 (Attack/Wasp)"],[875000, 700000], [5, "air", "response", 250], [1000, [1,2,0,13] ], "B_Heli_Light_01_armed_F", "B_Heli_Light_01_armed_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Attack_01_F",                                  ["Vehicle", "air"],["B_Heli_Attack_01_F", "AH-99 (Attack)"],[1375000, 1100000], [5, "air", "air_support_training", 100], [1000, [1,2,0,13] ], "B_Heli_Attack_01_F", "B_Heli_Attack_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Attack_01_F_nodagr_noasraam",                  ["Vehicle", "air"],["B_Heli_Attack_01_F", "AH-99 (Attack/Gatling)"],[1375000, 1100000], [5, "air", "air_support_training", 100], [1000, [1,2,0,13] ], "B_Heli_Attack_01_F", "B_Heli_Attack_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Transport_01_F",                               ["Vehicle", "air"],["B_Heli_Transport_01_F", "UH-80 (Transport)"],[3105000, 2484000], [5, "air", "air_support_training", 600], [1000, [1,2,0,13] ], "B_Heli_Transport_01_F", "B_Heli_Transport_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_Heli_Transport_01_camo_F",                          ["Vehicle", "air"],["B_Heli_Transport_01_camo_F", "UH-80 Camo (Transport)"],[3105000, 2484000], [5, "air", "air_support_training", 600], [1000, [1,2,0,13] ], "B_Heli_Transport_01_F", "B_Heli_Transport_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["I_Heli_Transport_02_F",                               ["Vehicle", "air"],["I_Heli_Transport_02_F", "CH-49 (Transport)"],[2250000, 1800000], [5, "air", "air_support_training",600], [1000, [1,2,0,13] ], "I_Heli_Transport_02_F", "I_Heli_Transport_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["I_Heli_Transport_02_F_dahoman",                       ["Vehicle", "air"],["I_Heli_Transport_02_F", "CH-49 (Transport/Dahoman)"],[2250000, 1800000], [5, "air", "air_support_training",600], [1000, [1,2,0,13] ], "I_Heli_Transport_02_F", "I_Heli_Transport_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["I_Heli_Transport_02_F_ion",                           ["Vehicle", "air"],["I_Heli_Transport_02_F", "CH-49 (Transport/ion)"],[2250000, 1800000], [5, "air", "air_support_training",600], [1000, [1,2,0,13] ], "I_Heli_Transport_02_F", "I_Heli_Transport_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Light_02_F",                                   ["Vehicle", "air"],["O_Heli_Light_02_F", "PO-30 (Attack)"],[9100000,7280000], [5,"air", "air_support_training", 150], [1000, [1,2,0,13] ], "O_Heli_Light_02_F", "O_Heli_Light_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Light_02_F_nodagr",                            ["Vehicle", "air"],["O_Heli_Light_02_F", "PO-30 (Attack Gatling)"],[9100000,7280000], [5,"air", "air_support_training", 150], [1000, [1,2,0,13] ], "O_Heli_Light_02_F", "O_Heli_Light_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Light_02_F_nodagr_ind",                        ["Vehicle", "air"],["O_Heli_Light_02_F", "PO-30 (Attack Gatling)"],[9100000,7280000], [5,"air", "air_support_training", 150], [1000, [1,2,0,13] ], "O_Heli_Light_02_F", "O_Heli_Light_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Light_02_unarmed_F",                           ["Vehicle", "air"],["O_Heli_Light_02_unarmed_F", "PO-30 (Transport)"],[5100000, 4080000], [5,"pmc_license_air", "air_support_training", 400], [1000, [1,2,0,13] ], "O_Heli_Light_02_unarmed_F", "O_Heli_Light_02_unarmed_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Light_02_unarmed_F_civ",                       ["Vehicle", "air"],["O_Heli_Light_02_unarmed_F", "PO-30 (Transport/Civilian)"],[5100000, 4080000], [5,"pmc_license_air", "air_support_training", 400], [1000, [1,2,0,13] ], "O_Heli_Light_02_unarmed_F", "O_Heli_Light_02_unarmed_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Attack_02_F",                                  ["Vehicle", "air"],["O_Heli_Attack_02_F", "Mi-48 (Attack)"],[14100000, 11280000], [5,"air", "air_support_training", 100], [1000, [1,2,0,13] ], "O_Heli_Attack_02_F", "O_Heli_Attack_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Attack_02_F_noscalpel_noskyfire",              ["Vehicle", "air"],["O_Heli_Attack_02_F", "Mi-48 (Attack/Gatling)"],[14100000, 11280000], [5,"air", "air_support_training", 100], [1000, [1,2,0,13] ], "O_Heli_Attack_02_F", "O_Heli_Attack_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Attack_02_black_F",                            ["Vehicle", "air"],["O_Heli_Attack_02_black_F", "Mi-48 Black (Attack)"],[14100000, 11280000], [5,"pmc_license_air", "air_support_training", 100], [1000, [1,2,0,13] ], "O_Heli_Attack_02_black_F", "O_Heli_Attack_02_black_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["O_Heli_Attack_02_black_F_noscalpel_noskyfire",        ["Vehicle", "air"],["O_Heli_Attack_02_black_F", "Mi-48 Black (Attack/Gatling)"],[14100000, 11280000], [5,"pmc_license_air", "air_support_training", 100], [1000, [1,2,0,13] ], "O_Heli_Attack_02_black_F", "O_Heli_Attack_02_black_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["I_Plane_Fighter_03_AA_F",                             ["Vehicle", "air"],["I_Plane_Fighter_03_AA_F", "A-143 Buzzard AA"],[14100000, 11280000], [5,"pmc_license_air", "air_support_training", 100], [1000, [1,2,0,13] ], "I_Plane_Fighter_03_AA_F", "I_Plane_Fighter_03_AA_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["I_Plane_Fighter_03_AA_F_noasraam_nozephyr",           ["Vehicle", "air"],["I_Plane_Fighter_03_AA_F", "A-143 Buzzard AA"],[14100000, 11280000], [5,"pmc_license_air", "air_support_training", 100], [1000, [1,2,0,13] ], "I_Plane_Fighter_03_AA_F", "I_Plane_Fighter_03_AA_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//UAV
["I_UAV_01_F",                                          ["Vehicle", "air"],["I_UAV_01_F", "AR-2 Darter (Quadrotor UAV)"],[2250000, 1800000], [5, "air", "air_support_training",600], [1000, [1,2,0,13] ], "I_UAV_01_F", "I_UAV_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["I_UAV_02_F",                                          ["Vehicle", "air"],["I_UAV_02_F", "K40 Ababil-3 (Fixedwing UAV)"],[2250000, 1800000], [5, "air", "air_support_training",600], [1000, [1,2,0,13] ], "I_UAV_02_F", "I_UAV_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_UAV_01_F",                                          ["Vehicle", "air"],["B_UAV_01_F", "AR-2 Darter (Quadrotor UAV)"],[2250000, 1800000], [5, "air", "air_support_training",600], [1000, [1,2,0,13] ], "B_UAV_01_F", "B_UAV_01_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_UAV_02_CAS_F",                                      ["Vehicle", "air"],["B_UAV_02_CAS_F", "MQ4A Greyhawk (Fixedwing CAS UAV)"],[2250000, 1800000], [5, "air", "air_support_training",600], [1000, [1,2,0,13] ], "B_UAV_02_CAS_F", "B_UAV_02_CAS_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
["B_UAV_02_F",                                          ["Vehicle", "air"],["B_UAV_02_F", "MQ4A Greyhawk (Fixedwing UAV)"],[2250000, 1800000], [5, "air", "air_support_training",600], [1000, [1,2,0,13] ], "B_UAV_02_F", "B_UAV_02_F", [["stahl", 500],["ebauteile", 15],["glas", 10],["plastik", 40],["mineraloel", 60],["money",8000]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Ship
["B_Boat_Transport_01_F",                               ["Vehicle", "boat"],["B_Boat_Transport_01_F", "Zodiac Boat"],[50000, 40000], [0, "boat", "patrol", 250], [100,[1,1,0,3] ], "B_Assaultboat" call A_isse_fnc_cfg_vehicle_getname, "B_Assaultboat" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 1],["ebauteile", 1],["glas", 2],["plastik", 3],["petroleum", 5]] ],
["O_Boat_Transport_01_F",                               ["Vehicle", "boat"],["O_Boat_Transport_01_F", "Zodiac Boat"], [60000, 48000],[0, "boat", "patrol", 250], [100,[1,2,0,10] ], "O_Assaultboat" call A_isse_fnc_cfg_vehicle_getname, "O_Assaultboat" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 8],["ebauteile", 4],["glas", 8],["plastik", 20],["petroleum", 5],["kupfer", 20],["blackpowder", 15]]],
["I_Boat_Transport_01_F",                               ["Vehicle", "boat"],["I_Boat_Transport_01_F", "Zodiac Boat"], [60000, 48000],[0, "boat", "patrol", 250], [100,[1,2,0,10] ], "O_Assaultboat" call A_isse_fnc_cfg_vehicle_getname, "O_Assaultboat" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 8],["ebauteile", 4],["glas", 8],["plastik", 20],["petroleum", 5],["kupfer", 20],["blackpowder", 15]]],
["B_Lifeboat",                                          ["Vehicle", "boat"],["B_Lifeboat", "Zodiac Boat (Rescue)"], [40000, 32000],[0, "boat", "", 150], [100,[1,2,0,10] ], "B_Lifeboat" call A_isse_fnc_cfg_vehicle_getname, "B_Lifeboat" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 8],["ebauteile", 4],["glas", 8],["plastik", 20],["petroleum", 5],["kupfer", 20],["blackpowder", 15]]],
["O_Lifeboat",                                          ["Vehicle", "boat"],["O_Lifeboat", "Zodiac Boat (Rescue)"], [40000, 32000],[0, "boat", "probator", 150], [100,[1,2,0,10] ], "O_Lifeboat" call A_isse_fnc_cfg_vehicle_getname, "O_Lifeboat" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 8],["ebauteile", 4],["glas", 8],["plastik", 20],["petroleum", 5],["kupfer", 20],["blackpowder", 15]]],
["O_Lifeboat_icamo",                                    ["Vehicle", "boat"],["O_Lifeboat", "Zodiac Boat (Cammo)"], [40000, 32000],[0, "boat", "probator", 150], [100,[1,2,0,10] ], "O_Lifeboat" call A_isse_fnc_cfg_vehicle_getname, "O_Lifeboat" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 8],["ebauteile", 4],["glas", 8],["plastik", 20],["petroleum", 5],["kupfer", 20],["blackpowder", 15]]],
["C_Rubberboat",                                        ["Vehicle", "boat"],["C_Rubberboat", "Zodiac Boat (White/Blue)"],[35000, 28000], [0, "boat", "probator", 150],  [100, [1,0,0,4] ], "C_Rubberboat" call A_isse_fnc_cfg_vehicle_getname, "C_Rubberboat" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",3000]] ],
["B_Boat_Armed_01_minigun_F",                           ["Vehicle", "boat"],["B_Boat_Armed_01_minigun_F", "Assault Boat (Minigun)"],[2250000,1800000], [0, "boat", "sobr", 200],  [100, [1,0,0,4] ], "B_Boat_Armed_01_minigun_F" call A_isse_fnc_cfg_vehicle_getname, "B_Boat_Armed_01_minigun_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["O_Boat_Armed_01_hmg_F",                               ["Vehicle", "boat"],["O_Boat_Armed_01_hmg_F", "Assault Boat (HMG)"],[2650000,2120000], [0, "bomb", "sobr", 200],  [100, [1,0,0,4] ], "O_Boat_Armed_01_hmg_F" call A_isse_fnc_cfg_vehicle_getname, "O_Boat_Armed_01_hmg_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["I_Boat_Armed_01_minigun_F",                           ["Vehicle", "boat"],["I_Boat_Armed_01_minigun_F", "Assault Boat (Minigun)"],[2850000,2280000], [0, "bomb", "sobr", 200],  [100, [1,0,0,4] ], "I_Boat_Armed_01_minigun_F" call A_isse_fnc_cfg_vehicle_getname, "I_Boat_Armed_01_minigun_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["B_SDV_01_F",                                          ["Vehicle", "boat"],["B_SDV_01_F", "SDV (Submarine)"],[10250000,8200000], [0, "boat", "sobr", 100],  [100, [1,0,0,4] ], "B_SDV_01_F" call A_isse_fnc_cfg_vehicle_getname, "B_SDV_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["O_SDV_01_F",                                          ["Vehicle", "boat"],["O_SDV_01_F", "SDV (Submarine)"],[10750000,8600000], [0, "bomb", "sobr", 100],  [100, [1,0,0,4] ], "O_SDV_01_F" call A_isse_fnc_cfg_vehicle_getname, "O_SDV_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["I_SDV_01_F",                                          ["Vehicle", "boat"],["I_SDV_01_F", "SDV (Submarine)"],[10750000,8600000], [0, "bomb", "sobr", 100],  [100, [1,0,0,4] ], "I_SDV_01_F" call A_isse_fnc_cfg_vehicle_getname, "I_SDV_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["C_Boat_Civil_01_F",                                   ["Vehicle", "boat"],["C_Boat_Civil_01_F", "Speedboat (Civilian)"],[10750000,8600000], [0, "bomb", "sobr", 100],  [100, [1,0,0,4] ], "C_Boat_Civil_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Boat_Civil_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["C_Boat_Civil_01_F_icamo",                             ["Vehicle", "boat"],["C_Boat_Civil_01_F", "Speedboat (Camo)"],[10750000,8600000], [0, "bomb", "sobr", 100],  [100, [1,0,0,4] ], "C_Boat_Civil_01_F" call A_isse_fnc_cfg_vehicle_getname, "C_Boat_Civil_01_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["C_Boat_Civil_01_police_F",                            ["Vehicle", "boat"],["C_Boat_Civil_01_police_F", "Speedboat (Police)"],[10750000,8600000], [0, "bomb", "sobr", 100],  [100, [1,0,0,4] ], "C_Boat_Civil_01_police_F" call A_isse_fnc_cfg_vehicle_getname, "C_Boat_Civil_01_police_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ],
["C_Boat_Civil_01_rescue_F",                            ["Vehicle", "boat"],["C_Boat_Civil_01_rescue_F", "Speedboat (Rescue)"],[10750000,8600000], [0, "bomb", "sobr", 100],  [100, [1,0,0,4] ], "C_Boat_Civil_01_rescue_F" call A_isse_fnc_cfg_vehicle_getname, "C_Boat_Civil_01_rescue_F" call A_isse_fnc_cfg_vehicle_getdesc, [["stahl", 2],["ebauteile", 1],["glas", 2],["plastik", 5],["petroleum", 5],["money",2000]] ]


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
];

A_main_var_backpackarray = [
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Assault Packs
["B_AssaultPack_khk",                      ["backpack", "backpack"],["B_AssaultPack_khk", "Assault Pack (Khaki)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_dgtl",                     ["backpack", "backpack"],["B_AssaultPack_dgtl", "Assault Pack (Digicam)"],[1000, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_rgr",                      ["backpack", "backpack"],["B_AssaultPack_rgr", "Assault Pack (Green)"],[1000, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_rgr_LAT",                  ["backpack", "backpack"],["B_AssaultPack_rgr_LAT", "LAT Assault Pack (Green)"],[1000, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_rgr_Medic",                ["backpack", "backpack"],["B_AssaultPack_rgr_Medic", "Medic Pack (Green)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_rgr_Repair",               ["backpack", "backpack"],["B_AssaultPack_rgr_Repair", "Engineer Pack (Green)"],[1000, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_rgr_ReconMedic",           ["backpack","backpack"],["B_AssaultPack_rgr_ReconMedic","Recon Medic Pack (Green)"],[1000, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_sgg",                      ["backpack", "backpack"],["B_AssaultPack_sgg", "Assault Pack (Sage)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_AssaultPack_sgg_ReconExp",           ["backpack", "backpack"],["B_AssaultPack_sgg_ReconExp", "Recon Explosive Pack"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_AssaultPack_sgg_ReconLAT",           ["backpack", "backpack"],["B_AssaultPack_sgg_ReconLAT", "Recon LAT Pack"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_blk",                      ["backpack", "backpack"],["B_AssaultPack_blk", "Assault Pack (Black)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_DiverExp",                 ["backpack", "backpack"],["B_AssaultPack_blk_DiverExp", "Diver Assault Pack"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_cbr",                      ["backpack", "backpack"],["B_AssaultPack_cbr","Assault Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_mcamo",                    ["backpack", "backpack"],["B_AssaultPack_mcamo", "Assault Pack (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_mcamo_AAR",                ["backpack", "backpack"],["B_AssaultPack_mcamo_AAR", "AAR Assault Pack (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_mcamo_Ammo",               ["backpack", "backpack"],["B_AssaultPack_mcamo_Ammo", "Ammo Assault Pack (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_AssaultPack_ocamo",                    ["backpack", "backpack"],["B_AssaultPack_ocamo","Assault Pack (Hexcam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_AssaultPackG",                       ["backpack", "backpack"],["B_AssaultPackG", "Assault Pack (Guerrilla)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_AssaultPackG_AAR",                   ["backpack", "backpack"],["B_AssaultPackG_AAR", "AAR Assault Pack (Guer)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_AssaultPackG_Eng",                   ["backpack", "backpack"],["B_AssaultPackG_Eng", "Engineer Assault Pack (Guer)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Field Packs
["B_FieldPack_blk",                        ["backpack", "backpack"],["B_FieldPack_blk","Field Pack (Black)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_blk_DiverExp",               ["backpack", "backpack"],["B_FieldPack_blk_DiverExp", "Diver Demo Pack (Black)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_ocamo",                      ["backpack", "backpack"],["B_FieldPack_ocamo", "Field Pack (Hexcam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_ocamo_Medic",                ["backpack", "backpack"],["B_FieldPack_ocamo_Medic", "Medic Pack (Hexcam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_FieldPack_AA",                       ["backpack", "backpack"],["B_FieldPack_AA", "AA Field Pack"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_FieldPack_AAR",                      ["backpack", "backpack"],["B_FieldPack_AAR", "AAR Field Pack"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_FieldPack_ReconMedic",               ["backpack", "backpack"],["B_FieldPack_ReconMedic", "Recon Medic Field Pack"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_oucamo",                     ["backpack", "backpack"],["B_FieldPack_oucamo", "Field Pack (Urban)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_FieldPack_ReconExp",                 ["backpack", "backpack"],["B_FieldPack_ReconExp", "Recon Demo Field Pack"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_cbr",                        ["backpack", "backpack"],["B_FieldPack_cbr", "Field Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_cbr_LAT",                    ["backpack", "backpack"],["B_FieldPack_cbr_LAT", "LAT Field Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_cbr_Repair",                 ["backpack", "backpack"],["B_FieldPack_cbr_Repair", "Engineer Field Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_cbr_AAT",                    ["backpack", "backpack"],["B_FieldPack_cbr_AAT", "AAT Field Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_cbr_Ammo",                   ["backpack", "backpack"],["B_FieldPack_cbr_Ammo", "Ammo Field Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_cbr_AT",                     ["backpack", "backpack"],["B_FieldPack_cbr_AT", "AT Field Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_khk",                        ["backpack", "backpack"],["B_FieldPack_khk", "Field Pack (Khaki)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_FieldPack_oli",                        ["backpack", "backpack"],["B_FieldPack_oli", "Field Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Fieldpack_oli_AA",                   ["backpack", "backpack"],["B_Fieldpack_oli_AA", "AA Field Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Fieldpack_oli_Ammo",                 ["backpack", "backpack"],["B_Fieldpack_oli_Ammo", "Ammo Field Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Fieldpack_oli_Medic",                ["backpack", "backpack"],["B_Fieldpack_oli_Medic", "Medic Field Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Fieldpack_oli_Repair",               ["backpack", "backpack"],["B_Fieldpack_oli_Repair", "Engineer Field Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Fieldpack_oli_LAT",                  ["backpack", "backpack"],["B_Fieldpack_oli_LAT", "LAT Field Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Fieldpack_oli_AT",                   ["backpack", "backpack"],["B_Fieldpack_oli_AT", "AT Field Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Fieldpack_oli_AAR",                  ["backpack", "backpack"],["B_Fieldpack_oli_AAR", "AAR Field Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Carryall Packs
["B_Carryall_ocamo",                       ["backpack", "backpack"],["B_Carryall_ocamo", "Carryall Pack (Hexcam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_ocamo_Exp",                   ["backpack", "backpack"],["B_Carryall_ocamo_Exp", "Demo Carryall Pack (Hexcam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_ocamo_AAA",                   ["backpack", "backpack"],["B_Carryall_ocamo_AAA", "AAA Carryall Pack (Hexcam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_ocamo_Eng",                   ["backpack", "backpack"],["B_Carryall_ocamo_Eng", "Engineer Carryall (Hexcam)"],[1500,1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_oucamo",                      ["backpack", "backpack"],["B_Carryall_oucamo", "Carryall Pack (Urban)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_mcamo",                       ["backpack", "backpack"],["B_Carryall_mcamo", "Carryall Pack (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_mcamo_AAA",                   ["backpack", "backpack"],["B_Carryall_mcamo_AAA", "AAA Carryall Pack (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_mcamo_AAT",                   ["backpack", "backpack"],["B_Carryall_mcamo_AAT", "AAT Carryall Pack (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_oli",                         ["backpack", "backpack"],["B_Carryall_oli", "Carryall Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Carryall_oli_AAT",                   ["backpack", "backpack"],["B_Carryall_oli_AAT", "AAT Carryall Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Carryall_oli_Exp",                   ["backpack", "backpack"],["B_Carryall_oli_Exp", "Demo Carryall Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Carryall_oli_AAA",                   ["backpack", "backpack"],["B_Carryall_oli_AAA", "AAA Carryall Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Carryall_oli_Eng",                   ["backpack", "backpack"],["B_Carryall_oli_Eng", "Engineer Carryall (Olive)"],[1500,1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_khk",                         ["backpack", "backpack"],["B_Carryall_khk", "Carryall Pack (Khaki)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_cbr",                         ["backpack", "backpack"],["B_Carryall_cbr", "Carryall Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Carryall_cbr_AAT",                     ["backpack", "backpack"],["B_Carryall_cbr_AAT", "AAT Carryall Pack (Coyote)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Bergen Packs
["B_Bergen_sgg",                           ["backpack", "backpack"],["B_Bergen_sgg", "Bergen Bag (Sage)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Bergen_sgg_Exp",                     ["backpack", "backpack"],["B_Bergen_sgg_Exp", "Bergen Demo Bag (Sage)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Bergen_mcamo",                         ["backpack", "backpack"],["B_Bergen_mcamo", "Bergen Bag (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Bergen_rgr",                           ["backpack", "backpack"],["B_Bergen_rgr", "Bergen Bag (Green)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Bergen_blk",                           ["backpack", "backpack"],["B_Bergen_blk", "Bergen Bag (Black)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_BergenG",                            ["backpack", "backpack"],["B_BergenG", "Bergen Bag (Guerrilla)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_BergenG_Medic",                      ["backpack", "backpack"],["B_BergenG_Medic", "Bergen Medic Bag (Guerrilla)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_BergenG_Ammo",                       ["backpack", "backpack"],["B_BergenG_Ammo", "Bergen Ammo Bag (Guerrilla)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_BergenC_red",                        ["backpack", "backpack"],["B_BergenC_red", "Bergen Bag (Red)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_BergenC_grn",                        ["backpack", "backpack"],["B_BergenC_grn", "Bergen Bag (Green)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_BergenC_blu",                        ["backpack", "backpack"],["B_BergenC_blu", "Bergen Bag (Blue)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Other Packs
["B_Kitbag_mcamo",                         ["backpack", "backpack"],["B_Kitbag_mcamo", "Kit Bag (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Kitbag_mcamo_AA",                    ["backpack", "backpack"],["B_Kitbag_mcamo_AA", "AA Kit Bag (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Kitbag_mcamo_Eng",                     ["backpack", "backpack"],["B_Kitbag_mcamo_Eng", "Engineer Kit Bag (Multicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Kitbag_sgg",                           ["backpack", "backpack"],["B_Kitbag_sgg","Kit Bag (Sage)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Kitbag_sgg_AT",                      ["backpack", "backpack"],["B_Kitbag_sgg_AT","AT Kit Bag (Sage)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
//["B_Kitbag_sgg_Exp",                     ["backpack", "backpack"],["B_Kitbag_sgg_Exp","Demo Kit Bag (Sage)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Kitbag_cbr",                           ["backpack", "backpack"],["B_Kitbag_cbr", "Coyote Kit Bag"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_TacticalPack_rgr",                     ["backpack", "backpack"],["B_TacticalPack_rgr", "Tactical Pack (Green)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_TacticalPack_mcamo",                   ["backpack", "backpack"],["B_TacticalPack_mcamo", "Tactical Pack (Mutlicam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_TacticalPack_ocamo",                   ["backpack", "backpack"],["B_TacticalPack_ocamo", "Tactical Pack (Hexcam)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_TacticalPack_blk",                     ["backpack", "backpack"],["B_TacticalPack_blk", "Tactical Pack (Black)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_TacticalPack_oli",                     ["backpack", "backpack"],["B_TacticalPack_oli", "Tactical Pack (Olive)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_OutdoorPack_blk",                      ["backpack", "backpack"],["B_OutdoorPack_blk", "Outdoor Pack (Black)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_OutdoorPack_tan",                      ["backpack", "backpack"],["B_OutdoorPack_tan", "Outdoor Pack (Tan)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_OutdoorPack_blu",                      ["backpack", "backpack"],["B_OutdoorPack_blu", "Outdoor Pack (Blue)"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_HuntingBackpack",                      ["backpack", "backpack"],["B_HuntingBackpack", "Hunting Backpack"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
["B_Parachute",                            ["backpack", "backpack"],["B_Parachute", "Parachute"],[1500, 1000], [0, "", "", 200], [100, [1,0,0,4] ]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Mortars
["B_Mortar_01_weapon_F",                   ["backpack","weppack"],["B_Mortar_01_weapon_F","Mk6 Mortar Tube"],[85000, 85000], [0, "", "response", 200], [100, [1,0,0,4] ]],
["B_Mortar_01_support_F",                  ["backpack","weppack"],["B_Mortar_01_support_F","Mk6 Mortar Tripod"],[85000, 85000], [0, "", "response", 200], [100, [1,0,0,4] ]]
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
];

A_main_var_fortificationsarray = [
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// to be added
];

A_main_var_inv_allitemsarray = [
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Moneh
["money",                                  ["Item", "money"], ["Land_Money_F", "Dollars"],[1, 1],[0, "", ""],[true,true,true, false, false, "", "img\icons\money.paa", ""],localize "STRS_item_moneh", localize "STRS_item_moneh_info",[]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Weapons
//["pistol",                                 ["Item", "weapon"], ["Land_Suitcase_F", "Pistol"],[0, 0],[0, "", ""],[false, false,true, false, false, "holsterscript.sqf", "img\icons\pistol.paa", ""], localize "STRS_inv_item_waffe",localize "STRS_inv_item_waffe_info", []],
//["rifle",                                  ["Item", "weapon"], ["Land_Suitcase_F", "Rifle"],[0, 0],[0, "", ""],[false, false,true, false, false, "holsterscript.sqf", "img\icons\rifle.paa", ""], localize "STRS_inv_item_waffe",localize "STRS_inv_item_waffe_info", []],
["knife",                                  ["Item", "weapon"], ["Land_File_F", "Knife"],[0, 0],[0, "", ""],[false, true,true, false, false, "", "img\icons\knife.paa", ""], "Knife", "Knife", []],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Armor
["stun_light",                             ["Item", "armor"], ["Land_Suitcase_F", "Light Stun Armor"],[65000, 52000],[0, "pmc_defense","patrol", "img\icons\vest.paa", ""],[true, true,true, false, false, A_item_fnc_stun_armor], "Light Stun armor protects the chest area from stun rounds","Light Stun armor protects the chest area from stun rounds", []],
["stun_light_ter",                         ["Item", "armor"], ["Land_Suitcase_F", "Light Stun Armor"],[65000, 52000],[0, "bomb", "patrol", "img\icons\vest.paa", ""],[true, true,true, !(isblu), false, A_item_fnc_stun_armor], "Light Stun armor protects the chest area from stun rounds","Light Stun armor protects the chest area from stun rounds", []],
["stun_light_ill",                         ["Item", "armor"], ["Land_Suitcase_F", "Light Stun Armor"],[65000, 52000],[0, "bomb", "patrol", "img\icons\vest.paa", ""],[true, true,true, !(isblu), false, A_item_fnc_stun_armor], "Light Stun armor protects the chest area from stun rounds","Light Stun armor protects the chest area from stun rounds", []],
["stun_full",                              ["Item", "armor"], ["Land_Suitcase_F", "Full Stun Armor"],[100000, 80000],[0, "pmc_defense", "patrol", "img\icons\vest.paa", ""],[false, false,true, false, false, A_item_fnc_stun_armor], "Full Stun armor protects you from stun rounds","Full Stun armor protects you from stun rounds", []],
["gasmask",                                ["Item", "armor"], ["Land_Suitcase_F", "Gas Mask"],[25000, 20000],[2, "", ""],[true,true,true, false, false, A_item_fnc_gaskmask, "img\icons\gasmask.paa", ""], "A Gask Mask to protect against tear gas", "A Gask Mask to protect against tear gas",[["plastik", 3]] ],
["stun_light_on",                          ["Item", "armor"], ["Land_Suitcase_F", "Equipped Light Stun Armor"],[100000, 80000],[0, "pmc_defense", "patrol"],[false, false,false, false, false, A_item_fnc_stun_armor ,"img\icons\vest.paa", ""], "Equipped Light stun armor","Equipped Light stun armor", []],
["stun_full_on",                           ["Item", "armor"], ["Land_Suitcase_F", "Equipped Full Stun Armor"],[100000, 80000],[0, "pmc_defense", "patrol"],[false, false,false, false, false, A_item_fnc_stun_armor, "img\icons\vest.paa", ""],"Equipped Full stun armor","Equipped Full stun armor", []],
["gasmask_on",                             ["Item", "armor"], ["Land_Suitcase_F", "Equipped Gas Mask"],[25000, 20000],[2, "", ""],[false,false,false, false, false, A_item_fnc_gaskmask, "img\icons\gasmask.paa", ""], "An equipped gas mask", "An equipped gas mask",[["plastik", 3]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Ammo
["A_item_fnc_vclammo",                                ["Item", "carobjects"],["Land_Suitcase_F", "Vehicle Ammo"],[65000, 52000],[10, "engineer", "response"],[true, true, true,!(isblu), false, A_item_fnc_vclammo, "img\icons\ammo.paa", ""],localize "STRS_inv_item_A_item_fnc_vclammo",localize "STRS_inv_item_A_item_fnc_vclammo_info", [["kupfer", 5],["blackpowder", 5]] ],
//["Mammo_WP",["Item", "carobjects"],["Mammo_WP", "8 WP Mortar Rounds"],[25000, 20000],[10, "", ""], [true, true, true,!(isblu), false, A_item_fnc_m_ammo],"Adds 8 WP rounds","Adds 8 WP rounds", [["kupfer", 5],["blackpowder", 5]] ],
//["Mammo_HE",["Item", "carobjects"],["Mammo_HE", "8 HE Mortar Rounds"],[25000, 20000],[10, "", ""], [true, true, true,!(isblu), false, A_item_fnc_m_ammo],"Adds 8 HE rounds","Adds 8 HE rounds", [["kupfer", 5],["blackpowder", 5]] ],
//["Mammo_IL",["Item", "carobjects"],["Mammo_IL", "8 Illum Mortar Rounds"],[25000, 20000],[10, "", ""], [true, true, true,!(isblu), false, A_item_fnc_m_ammo],"Adds 8 Illumination rounds","Adds 8 Illumination rounds", [["kupfer", 5],["blackpowder", 5]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// A_bombs_fnc_bombs
["fernzuenderbombe",                       ["Item", "bomb"],["Land_Suitcase_F", "Remote Bomb"],[2000000, 1600000],[50, "bomb", "sobr"],[true, true, true,true, false,A_bombs_fnc_bombs, "img\icons\remote_bomb.paa", ""],localize "STRS_inv_item_fernbombe",localize "STRS_inv_item_fernbombe_info", [["kupfer", 20],["blackpowder", 22],["ebauteile", 3]]],
["zeitzuenderbombe",                       ["Item", "bomb"],["Land_Suitcase_F", "Time Bomb"],[2000000, 1600000],[50, "bomb", "sobr"],[true, true, true,true, false,A_bombs_fnc_bombs, "img\icons\time_bomb.paa", ""],localize "STRS_inv_item_zeitbombe",localize "STRS_inv_item_zeitbombe_info", [["kupfer", 20],["blackpowder", 22],["ebauteile", 3]] ],
["aktivierungsbombe",                      ["Item", "bomb"],["Land_Suitcase_F", "Activation Bomb"],[2000000, 1600000],[50, "bomb", "sobr"],[true,true,true, true, false, A_bombs_fnc_bombs, "img\icons\bomb.paa", ""],localize "STRS_inv_item_enginebombe",localize "STRS_inv_item_enginebombe_info",[["kupfer", 20],["blackpowder", 22],["ebauteile", 3]] ],
["geschwindigkeitsbombe",                  ["Item", "bomb"],["Land_Suitcase_F", "Speed Bomb"],[2000000, 1600000],[50, "bomb", "sobr"],[true,true,true, true, false, A_bombs_fnc_bombs, "img\icons\bomb.paa", ""],localize "STRS_inv_item_speedbombe",localize "STRS_inv_item_speedbombe_info",[["kupfer", 20],["blackpowder", 22],["ebauteile", 3]] ],
["selbstmordbombe",                        ["Item", "bomb"],["Land_Suitcase_F", "Suicide Bomb"],[2000000, 1600000],[50, "bomb", "sobr"],[true, true, true,true, false, A_item_fnc_suicide_bomb, "img\icons\bomb.paa", ""],localize "STRS_inv_item_selbstmordbombe",localize "STRS_inv_item_selbstmordbombe_info", [["kupfer", 20],["blackpowder", 22],["ebauteile", 3]]],
["fernzuender",                            ["Item", "bomb"],["Land_Suitcase_F", "Remote Control"],[250000, 200000], [2, "", ""],[true,true,true, true, false, A_bombs_fnc_bombs, "img\icons\bomb_remote_control.paa", ""],localize "STRS_inv_item_fernzuender",localize "STRS_inv_item_zuender_info", [["ebauteile", 2],["plastik", 2]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Service
["kleinesreparaturkit",                    ["Item", "service"],["Land_Tyre_F", "Repair Kit"],[4250, 3375],[3, "", ""],[true,true,true, false, false, A_item_fnc_repair, "img\icons\A_item_fnc_repairkit.paa", ""],localize "STRS_inv_item_A_item_fnc_repairkit",localize "STRS_inv_item_A_item_fnc_repairkit_info",[["plastik", 1]] ],
["kanister",                               ["Item", "service"],["Land_CanisterFuel_F", "Refuel Can"],[3500, 2625],[5, "", "patrol"],[true,true,true, false, false, A_interaction_fnc_item_refuel, "img\icons\refuelcan.paa", ""], localize "STRS_inv_item_kanister", localize "STRS_inv_item_kanister_info",[["plastik", 1],["petroleum", 1]] ],
["Fuelline",                               ["Item", "service"],["Land_Suitcase_F", "syphon Fuel-kit"],[2500, 1875],[1, "", "patrol"],[true,true,true, false, false, A_item_fnc_syphon, "img\icons\syphon.paa", ""], localize "STRS_inv_item_fuelcut", localize "STRS_inv_item_fuelcut_info",[["stahl", 1]] ],
["OilBarrel",                              ["Item", "service"],["Land_MetalBarrel_F", "Refined Oil"],[11250, 7500],[15, "", ""],[true,true,true, false, false, A_interaction_fnc_item_refuel, "img\icons\petroleum.paa", ""], "Barrel of oil", localize "STRS_inv_item_kanister_info",[["crudeoil", 10]] ],
["reparaturkit",                           ["Item", "service"],["Land_Tyre_F", "Large repair Kit"],[7500, 5000],[10, "engineer", ""],[true,true,true, false, false, A_item_fnc_largerepair, "img\icons\large_repairkit.paa", ""],localize "STRS_inv_item_repairkit", localize "STRS_inv_item_repairkit_info",[["plastik", 1],["stahl", 2]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Misc
//["mobileroadblock",["Item", "misc"],["Land_CanisterPlastic_F","Mobile Roadblock"],[5000,4000],[5, "", "patrol"], [true, true, true,false, false,"mobileroadblock.sqf"],localize "STRS_inv_item_roadblock",localize "STRS_inv_item_roadblock_info", [["plastik", 1]]],
//["A_missions_fnc_searchLight_US_EP1",["Item", "misc"],["A_missions_fnc_searchLight_US_EP1", "A_missions_fnc_search Light"],[3000,2400],[10, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],"A_missions_fnc_searchlight",localize "STRS_inv_item__info", [] ],
//["M2StaticMG_US_EP1",["Item", "misc"],["M2StaticMG_US_EP1", "M2 static"],[97000, 77600],[20, "riflelicense", "sobr"],[true, true, true,false, false,"createobject.sqf"], "M2StaticMG_US_EP1" call A_isse_fnc_cfg_weapons_getname,"M2StaticMG_US_EP1" call A_isse_fnc_cfg_weapons_getdesc,[["stahl", 5], ["kupfer", 1],["plastik", 1]] ],
//["roadblock",["Item", "misc"],["Land_CncBlock_Stripes", "Roadblock"],[3000, 2000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_roadblock",localize "STRS_inv_item_roadblock_info", [] ],
//["bargate",["Item", "misc"],["Land_CanisterPlastic_F", "Bar Gate"],[3000, 2000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],"Bargate",localize "STRS_inv_item_bargate_info", [] ],
//["BigbagfenceCorner",["Item", "misc"],["Land_fort_bagfence_corner", "Big bag fence (Corner)"],[1500, 1000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_BigbagfenceCorner",localize "STRS_inv_item_BigbagfenceCorner_info", [] ],
//["bigbagfence",["Item", "misc"],["Land_fort_bagfence_long", "Big bag fence"],[1500, 1000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_bigbagfence",localize "STRS_inv_item_bigbagfence_info", [] ],
//["bigbagfenceRound",["Item", "misc"],["Land_fort_bagfence_round", "Big bag fence (Round)"],[1500, 1000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_bigbagfenceRound",localize "STRS_inv_item_bigbagfenceRound_info", [] ],
//["bunkersmall",["Item", "misc"],["Land_fortified_nest_small", "Bunker (Small)"],[2500, 1500],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_bunkersmall",localize "STRS_inv_item_bunkersmall_info", [] ],
//["danger",["Item", "misc"],["Sign_Danger", "Danger Sign"],[800, 1000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_danger",localize "STRS_inv_item_danger_info", [] ],
//["factory",["Item", "misc"],["Land_A_GeneralStore_01a", "Factory"],[180000, 1000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_factory",localize "STRS_inv_item_factory_info", [] ],
//["officebuilding",["Item", "misc"],["Land_A_Office01", "Office Building"],[150000, 1000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_officebuilding",localize "STRS_inv_item_officebuilding_info", [] ],
//["barrack",["Item", "misc"],["Land_Barrack2", "Barrack"],[35000, 10000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_barrack",localize "STRS_inv_item_barrack_info", [] ],
//["Hedgehog_EP1",["Item", "misc"],["Hedgehog_EP1", "Hedgehog"],[3500, 10000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_barrack",localize "STRS_inv_item_barrack_info", [] ],
//["Sign_Checkpoint_US_EP1",["Item", "misc"],["Sign_Checkpoint_US_EP1","Checkpoint sign"],[350, 100],[3, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_barrack",localize "STRS_inv_item_barrack_info", [] ],
//["Land_CamoNetVar_NATO_EP1",["Item", "misc"],["Land_CamoNetVar_NATO_EP1", "Camo-Net"],[3500, 10000],[10, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_barrack",localize "STRS_inv_item_barrack_info", [] ],
//["Land_ladderEP1",["Item", "misc"],["Land_ladderEP1", "Breaching ladder"],[3500, 10000],[0, "bomb", "sobr"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_barrack",localize "STRS_inv_item_barrack_info", [] ],
//["Land_Campfire_burning",["Item", "misc"],["Land_Campfire_burning", "Campfire"],[5, 0],[0, "", ""], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_barrack",localize "STRS_inv_item_barrack_info", [] ],
//["Fort_Barricade_EP1",["Item", "misc"],["Fort_Barricade_EP1", "Road barricade"],[5000, 0],[60, "bomb", ""], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_barrack",localize "STRS_inv_item_barrack_info", [] ],
//["smallhouse",["Item", "misc"],["Land_sara_domek_zluty", "Small House2"],[65000, 1000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_smallhouse",localize "STRS_inv_item_smallhouse_info", [] ],
//["smallhouse2",["Item", "misc"],["Land_HouseV_1I4", "Small House"],[55000, 1000],[20, "", "patrol"], [true, true, true,false, false,"createobject.sqf"],localize "STRS_inv_item_smallhouse2",localize "STRS_inv_item_smallhouse2_info", [] ],
//["hideout",["Item", "misc"],["Land_CanisterPlastic_F", "Hideout"],[20000, 1],[0, "", ""], [false, true, false,false, false,"hideout.sqf"],localize "STRS_item_hideout",localize "STRS_item_hideout_info", [] ],
//["roadcone",                               ["Item", "misc"],["RoadCone_L_F", "Road Cone (Light)"],[50, 100],[0.5, "", "patrol"], [true, true, true,false, false,"createobject.sqf", "img\icons\roadcone.paa", ""],localize "STRS_inv_item_roadcone",localize "STRS_inv_item_roadcone_info", [] ],

["weaponbag",                              ["Item", "misc"], ["Land_Suitcase_F", "weaponbag"],[1000, 800],[0.5, "", ""], [true, true, true,false, false, A_item_fnc_weaponbag, "img\icons\weaponbag.paa", ""],localize "STRS_inv_item_waffentascbe",localize "STRS_inv_item_waffentascbe_info", [["plastik", 1]]],
["itembag",                                ["Item", "misc"], ["Land_Suitcase_F", "itembag"],[500, 400],[0.5, "", ""], [true, true, true,false, false, A_item_fnc_itembag, "img\icons\itembag.paa", ""],"itembag","use when near dropped items to delete them", [["plastik", 1]]],
["defuser",                                ["Item", "misc"], ["Land_Suitcase_F", "defuser"],[4000, 3200],[0, "bomb", "response"], [true,true,false, false, false, A_item_fnc_defuser,"img\icons\defuser.paa", ""], localize "STRS_inv_item_A_item_fnc_defuser", localize "STRS_inv_item_defuser_info", [["stahl", 1],["ebauteile", 1]]],
["bankinsurance",                          ["Item", "misc"], ["Land_File2_F", "Bank Insurance"],[2500, 2000],[2, "", ""],[true,true,false, false, false, A_item_fnc_nouse, "img\icons\bankinsurance.paa", ""], localize "STRS_item_versicherung", localize "STRS_item_versicherung_info",[]],
["shovel",                                 ["Item", "misc"], ["Land_Shovel_F", "Shovel"],[800, 640],[5, "", ""],[true,true,true, false, false, "", "img\icons\shovel.paa", ""], "Shovel", "Use it in a mining area. Durability: 20 Mining speed: slow",[["wood", 2]] ],
["emptybarrel",                            ["Item", "misc"], ["Land_MetalBarrel_F", "Empty Barrel"],[800, 640],[5, "", ""],[true,true,true, false, false, "", "img\icons\pretroleum_empty.paa", ""], "Empty Barrel", "Use this item to store liquids such as oil.",[["wood", 2]] ],
["pickaxe",                                ["Item", "misc"], ["Land_Axe_fire_F", "Pick/Axe"],[4000, 3200],[5, "", ""],[true,true,true, false, false, "", "img\icons\pickaxe.paa", ""], "Pick/Axe", localize "STRS_item_pickaxe",[ ["wood", 2], ["ironore", 1]] ],
["woodaxe",                                ["Item", "misc"], ["Land_Axe_F", "Wood axe"],[4000, 3200],[5, "", ""],[true,true,true, false, false, "","img\icons\woodaxe.paa", ""], "Woodaxe", localize "STRS_item_woodaxe",[["wood", 2],["ironore", 1]]],
["drill",                                  ["Item", "misc"], ["Land_DrillAku_F", "Drill"],[4000, 3200],[5, "", ""],[true,true,true, false, false, "", "img\icons\drill.paa", ""], "Drill", "Use it in a mining area. Durability: 50 Mining speed: average",[ ["wood", 2]] ],
["grinder",                                ["Item", "misc"], ["Land_Grinder_F", "Grinder"],[4000, 3200],[5, "", ""],[true,true,true, false, false, "", "img\icons\grinder.paa", ""], "Grinder", "Use it in a mining area. Durability: 50 Mining speed: average",[ ["wood", 2]] ],
["handsaw",                                ["Item", "misc"], ["Land_Saw_F", "Handsaw"],[4000, 3200],[5, "", ""],[true,true,true, false, false, "", "img\icons\handsaw.paa", ""], "Handsaw", "Use it in a mining area. Durability: 50 Mining speed: average",[ ["wood", 2]] ],
["JackHammer",                             ["Item", "misc"], ["Land_Suitcase_F", "Jack Hammer"],[45000, 36000],[20, "engineer", "probator"],[true,true,true, false, false, "", "img\icons\jackhammer.paa", ""], "Jack Hammer", "Use it in a mining area. Durability: 100 Mining speed: fast",[["stahl", 1], ["plastik", 1],["ebauteile", 1]] ],
["bucket",                                 ["Item", "misc"], ["Land_Bucket_F", "Bucket"],[45000, 36000],[20, "engineer", "probator"],[true,true,true, false, false, "", "img\icons\bucket.paa", ""], "Bucket", "Use it at an oil rig to scoop crude oil from barrels.",[["stahl", 1], ["plastik", 1],["ebauteile", 1]] ],

//["Spikestrip",["Item", "misc"],["Fort_RazorWire", "Spike Strip"],[2800, 2000],[40, "", "probator"], [true, true, true,false, false, "Spikestrip.sqf"], "Spike Strip", "Use it to pop a tire.",[["stahl", 1], ["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//["medikit",["Item", "Shop"],["Land_CanisterPlastic_F", "Medikit"],[7500, 6000],[4, ""], [true, true, true,false, false, A_item_fnc_medkit],localize "STRS_inv_item_medikit",localize "STRS_inv_item_medikit_info", [["plastik", 1],["stahl", 2]] ],
// Shop
["lighter",                                ["Item", "Shop"],["Land_Suitcase_F", "lighter"],[1500, 1200],[1, "", ""],[true,true,true, false, false, A_item_fnc_lighter, "img\icons\torch.paa", ""],localize "STRS_inv_item_lighter", localize "STRS_inv_item_lighter_info",[["petroleum", 2]] ],
["handy",                                  ["Item", "Shop"], ["Land_MobilePhone_old_F", "Mobile Phone"],[500, 400],[0, ""],[true,true,false, false, false, A_item_fnc_handy, "img\icons\mobile.paa", ""], localize "STRS_inv_item_handy",localize "STRS_inv_item_handy_info", [["plastik", 2],["ebauteile", 2]]],
["fishingpole",                            ["Item", "Shop"], ["Land_Suitcase_F", "fishing Pole"],[8000, 6400],[5, "", "probator"],[true,true,true, false, false, A_item_fnc_fishing, "img\icons\fishing_pole.paa", ""], "Fishing Pole", "Use it in a A_item_fnc_fishing area.",[["stahl", 1], ["plastik", 1],["ebauteile", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Car Objects
["lockpick",                               ["Item", "carobjects"],["Land_Suitcase_F", "Lockpick"],[6000, 4500],[0.5, "", "response"],[true,true,true, false, false, A_item_fnc_lockpick, "img\icons\A_item_fnc_lockpick.paa", ""],localize "STRS_item_A_item_fnc_lockpick",localize "STRS_item_lockpick_info", [["stahl", 1]] ],
["keychain",                               ["Item", "carobjects"],["Land_Suitcase_F", "Key Chain"],[0, 0],[0, "", ""], [true,true, false,false,false, "", "img\icons\keychain.paa", ""],localize "STRS_inv_item_keychain",localize "STRS_inv_item_schluesselb_info", [] ],
["nitro",                                  ["Item", "carobjects"],["Land_Suitcase_F", "Nitro"], [65000, 52000],[5, "engineer", "patrol"],[true,true,true, false, false, A_item_fnc_nitro, "img\icons\nitro.paa", ""], localize "STRS_inv_item_nitro",localize "STRS_inv_item_nitro_info", [["stahl", 1],["ebauteile", 1],["plastik", 1],["petroleum", 10]]],
["supgrade1",                              ["Item", "carobjects"],["Land_Suitcase_F", "Speed Upgrade 1"], [12500, 10000],[5, "engineer", "patrol"],[true,true,true, false, false, A_interaction_fnc_vehicle_item_speed_upgrade, "img\icons\speed1.paa", ""], "Speed Upgrade 1",localize "STRS_inv_item_supgrade_info", [["stahl", 1],["ebauteile", 1],["plastik", 1],["petroleum", 10]]],
["supgrade2",                              ["Item", "carobjects"],["Land_Suitcase_F", "Speed Upgrade 2"], [25000, 20000],[10, "engineer", "patrol"],[true,true,true, false, false, A_interaction_fnc_vehicle_item_speed_upgrade, "img\icons\speed2.paa", ""], "Speed Upgrade 2",localize "STRS_inv_item_supgrade_info", [["stahl", 1],["ebauteile", 1],["plastik", 1],["petroleum", 10]]],
["supgrade3",                              ["Item", "carobjects"],["Land_Suitcase_F", "Speed Upgrade 3"], [45000, 36000],[20, "engineer", "patrol"],[true,true,true, false, false, A_interaction_fnc_vehicle_item_speed_upgrade, "img\icons\speed3.paa", ""], "Speed Upgrade 3",localize "STRS_inv_item_supgrade_info", [["stahl", 1],["ebauteile", 1],["plastik", 1],["petroleum", 10]]],
["supgrade4",                              ["Item", "carobjects"],["Land_Suitcase_F", "Speed Upgrade 4"], [80000, 64000],[30, "engineer", "patrol"],[true,true,true, false, false, A_interaction_fnc_vehicle_item_speed_upgrade, "img\icons\speed4.paa", ""], "Speed Upgrade 4",localize "STRS_inv_item_supgrade_info", [["stahl", 1],["ebauteile", 1],["plastik", 1],["petroleum", 10]]],
["supgrade5",                              ["Item", "carobjects"],["Land_Suitcase_F", "Speed Upgrade 5"], [135000, 101250],[40, "engineer", "patrol"],[true,true,true, false, false, A_interaction_fnc_vehicle_item_speed_upgrade, "img\icons\speed5.paa", ""], "Speed Upgrade 5",localize "STRS_inv_item_supgrade_info", [["stahl", 1],["ebauteile", 1],["plastik", 1],["petroleum", 10]]],
["speedgun",                               ["Item", "carobjects"],["Land_HandyCam_F", "Speed Gun"], [135000, 101250],[40, "engineer", "patrol"],[true,true,true, false, false, A_interaction_fnc_vehicle_item_speed_gun_upgrade, "img\icons\speed_gun.paa", ""], "Speed Gun",localize "STRS_inv_item_speedgun_info", [["stahl", 1],["ebauteile", 1],["plastik", 1],["petroleum", 10]]],


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// A_item_fnc_food
["rabbit",                                 ["Item", "food"],["Land_TacticalBacon_F", "Rabbit Meat"],[2275, 815],[1, "", ""], [true, true, true,false, false, A_item_fnc_food, "img\icons\rabbit.paa", ""],"Rabbit meat","Rabbit meat", [] ],
["trout",                                  ["Item", "food"],["Land_TacticalBacon_F", "Trout"],[900, 370],[2, "", ""], [true, true, true,false, false, A_item_fnc_food, "img\icons\trout.paa", ""],localize "STRS_inv_item_fisch",localize "STRS_inv_item_nahrung_info", [] ],
["walleye",                                ["Item", "food"],["Land_TacticalBacon_F", "Walleye"],[1450, 490],[2, "", ""], [true, true, true,false, false, A_item_fnc_food, "img\icons\walleye.paa", ""],localize "STRS_inv_item_fisch",localize "STRS_inv_item_nahrung_info", [] ],
["perch",                                  ["Item", "food"],["Land_TacticalBacon_F", "Perch"],[6000, 610],[2, "", ""], [true, true, true,false, false, A_item_fnc_food, "img\icons\perch.paa", ""],localize "STRS_inv_item_fisch",localize "STRS_inv_item_nahrung_info", [] ],
["bass",                                   ["Item", "food"],["Land_TacticalBacon_F", "Bass"],[4550, 720],[2, "", ""], [true, true, true,false, false, A_item_fnc_food, "img\icons\bass.paa", ""],localize "STRS_inv_item_fisch",localize "STRS_inv_item_nahrung_info", [] ],
["Bread",                                  ["Item", "food"],["Land_TacticalBacon_F", "Bread"],[1500, 750],[1, "", ""], [true, true, true,false, false, A_item_fnc_food, "img\icons\bread.paa", ""],localize "STRS_inv_item_Bread",localize "STRS_inv_item_nahrung_info", [["getreide", 2]] ],
//["Donut",["Item", "food"],["Land_CanisterPlastic_F", "Donut"],[1000, 1000],[0.5, "", ""], [true, true, true,false, false,A_item_fnc_food],localize "STRS_inv_item_Bread",localize "STRS_inv_item_nahrung_info", [] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Drink
["wine",                                   ["Item", "drink"],["Land_Suitcase_F", "Wine"],[120, 120],[0.5, "", ""], [true, true, true,false, false, A_effects_fnc_alcohol, "img\icons\wine.paa", ""],localize "Wine",localize "STRS_inv_item_alkohol_info", [["quellwasser", 1], ["hopfen", 1]] ],
["beer",                                   ["Item", "drink"],["Land_Suitcase_F", "Lager"],[120, 120],[0.5, "", ""], [true, true, true,false, false, A_effects_fnc_alcohol, "img\icons\beer.paa", ""],localize "STRS_inv_item_beer",localize "STRS_inv_item_alkohol_info", [["quellwasser", 1], ["hopfen", 1]] ],
["fanta",                                  ["Item", "drink"],["Land_Can_V2_F", "Bitter"],[170, 170],[0.5, "", ""], [true, true, true,false, false, A_effects_fnc_alcohol,  "img\icons\sodacan.paa", ""],localize "STRS_inv_item_beer",localize "STRS_inv_item_alkohol_info", [["quellwasser", 1], ["hopfen", 1]] ],
["vodka",                                  ["Item", "drink"],["Land_Suitcase_F", "Vodka"],[180, 180],[0.5, "", ""], [true, true, true,false, false, A_effects_fnc_alcohol, "img\icons\vodka.paa", ""],localize "STRS_inv_item_vodka",localize "STRS_inv_item_alkohol_info", [["quellwasser", 1], ["hopfen", 1]] ],
["smirnoff",                               ["Item", "drink"],["Land_Suitcase_F", "Smirnoff ICE"],[130, 130],[0.5, "", ""], [true, true, true,false, false, A_effects_fnc_alcohol, "img\icons\vodka.paa", ""],localize "STRS_inv_item_smirnoff",localize "STRS_inv_item_alkohol_info", [["quellwasser", 1], ["hopfen", 1]] ],
["wiskey",                                 ["Item", "drink"],["Land_Suitcase_F", "Whiskey"],[200, 200],[0.5, "", ""], [true, true, true,false, false, A_effects_fnc_alcohol, "img\icons\whiskey.paa", ""],localize "STRS_inv_item_wiskey",localize "STRS_inv_item_alkohol_info", [["quellwasser", 1], ["hopfen", 1]] ],
["redgull",                                ["Item", "drink"],["Land_Can_V3_F", "Red Gull"],[250, 250],[0.5, "", ""], [true, true, true,false, false, A_effects_fnc_alcohol, "img\icons\sodacan.paa", ""],localize "STRS_inv_item_wine",localize "STRS_inv_item_alkohol_info", [["quellwasser", 1], ["hopfen", 1]] ],
["water",                                  ["Item", "drink"],["Land_BottlePlastic_V1_F", "Mineral Water"],[270, 270],[0.5, "", ""], [true, true, true,false, false, A_effects_fnc_alcohol, "img\icons\water.paa", ""],localize "STRS_inv_item_wine",localize "STRS_inv_item_alkohol_info", [["quellwasser", 1], ["hopfen", 1]] ],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Ore
["platinumore",                            ["Item", "ore"],["Skeet_Clay_F", "Platinum Ore"],[4000, 1600],[3, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\platnum.paa", "img\platinumore.paa"],"Platinum Ore",localize "STRS_item_farmitem_info", []],
["silverore",                              ["Item", "ore"],["Skeet_Clay_F", "Silver Ore"],[3200, 1150],[3, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\silver.paa", "img\silverore.paa"],"Silver Ore",localize "STRS_item_farmitem_info", []],
["goldore",                                ["Item", "ore"],["Skeet_Clay_F", "Gold Ore"],[3600, 1375],[4, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\gold.paa","img\goldore.paa"],"Gold Ore",localize "STRS_item_farmitem_info", []],
["coalore",                                ["Item", "ore"],["Skeet_Clay_F", "Coal Ore"],[120, 50],[0.5, "", ""],[true, true, true,false, false,  A_item_fnc_useresource, "img\icons\coal.paa", "img\coalore.paa"],"Coal Ore",localize "STRS_item_farmitem_info", [["wood", 1]]],
["ironore",                                ["Item", "ore"],["Skeet_Clay_F", "Iron Ore"], [1600, 600],[3, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\iron.paa", "img\ironore.paa"],"Iron Ore",localize "STRS_item_farmitem_info", []],
["rubyore",                                ["Item", "ore"],["Skeet_Clay_F", "Ruby Ore"],[1000, 350],[3, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\ruby.paa", "img\rubyore.paa"],"Ruby Ore",localize "STRS_item_farmitem_info", []],
["diamondore",                             ["Item", "ore"],["Skeet_Clay_F", "Diamond Ore"],[1600, 600],[3, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\diamond.paa", "img\diamondore.paa"],"Diamond Ore",localize "STRS_item_farmitem_info", []],
["copperore",                              ["Item", "ore"],["Skeet_Clay_F", "Copper Ore"],[800, 300],[3, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\copper.paa", "img\copperore.paa"], "Copper Ore",localize "STRS_item_farmitem_info", []],
["sulfurore",                              ["Item", "ore"],["Skeet_Clay_F", "Sulfur Ore"],[100, 50],[0.5, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\sulfur.paa", "img\sulfurore.paa"], "Sulfur Ore",localize "STRS_item_farmitem_info", []],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Resource
["sand",                                   ["Item", "ressource"],["Land_Sacks_heap_F", "Sand"],[100, 40],[1, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\sand.paa", ""], localize "STRS_inv_item_sand", localize "STRS_inv_item_sand_info", []],
["glass",                                  ["Item", "ressource"],["Land_Suitcase_F", "Glass"], [600, 225],[1.5, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\glass.paa", ""], localize "STRS_item_glas", localize "STRS_item_farmitem_info", [["sand", 2]] ],
["getreide",                               ["Item", "ressource"],["Land_Suitcase_F", "Wheat"],[400, 150],[0.5, "", ""],[true,true,true, false, false, A_item_fnc_food, "img\icons\wheat.paa", ""], localize "STRS_inv_item_getreide", localize "STRS_inv_item_nahrung_info", []],
["wood",                                   ["Item", "ressource"],["Land_WoodPile_F", "Wood"],[50, 15],[0.5, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\wood.paa", ""],localize "STRS_item_wood",localize "STRS_item_farmitem_info", [] ],
["mineraloel",                             ["Item", "ressource"],["Land_CanisterOil_F", "Mineral Oil"],[100, 50],[1, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\mineral_oil.paa", ""],localize "STRS_item_mineraloel",localize "STRS_item_farmitem_info", [["ironore", 2]]],
["ebauteile",                              ["Item", "ressource"],["Land_Suitcase_F", "Electronic Components"],[100, 50],[2.5, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\electronic.paa", ""], localize "STRS_item_ebauteile",localize "STRS_item_farmitem_info", [["silizium", 1],["kupfer", 2],["petroleum", 2]] ],
["silizium",                               ["Item", "ressource"],["Land_Sacks_heap_F", "Silicon"], [50, 20],[0.5, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\silicon.paa", ""], localize "STRS_item_silizium",localize "STRS_item_farmitem_info", []],
["steel",                                  ["Item", "ressource"],["Land_Suitcase_F", "Steel"], [5000, 900],[3, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\steel.paa", ""],"Steel Bars", localize "STRS_item_farmitem_info", [["ironore", 5]] ],
["blackpowder",                            ["Item", "ressource"],["Land_Sacks_heap_F", "Black Powder"],[100, 50],[1, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\blackpowder.paa", ""],localize "STRS_item_blackpowder",localize "STRS_item_farmitem_info", [["coalore", 1],["sulfurore", 1]]],
["crudeoil",                               ["Item", "ressource"],["Land_MetalBarrel_F", "Crude Oil"],[2000, 750],[3, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\crude_oil.paa", ""],"Oil",localize "STRS_item_farmitem_info", []],
["petroleum",                              ["Item", "ressource"],["Land_MetalBarrel_F", "Petroleum"], [2200, 750],[0.5, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\petroleum.paa", ""], localize "STRS_item_petroleum",localize "STRS_item_farmitem_info", [["crudeoil", 1]]],
["plastik",                                ["Item", "ressource"],["Land_Suitcase_F", "Plastic"],[100, 50],[1.5, "", ""], [true, true, true,false, false,  A_item_fnc_useresource, "img\icons\plastic.paa", ""],localize "STRS_item_plastik",localize "STRS_item_farmitem_info", [["petroleum", 2],["coalore", 1]]],
["stahlwolle",                             ["Item", "ressource"],["Land_Suitcase_F", "Steel Wool"],[100, 50],[1, "", ""],[true,true,true, false, false, A_item_fnc_useresource, "img\icons\steel_wool.paa", ""], localize "STRS_item_stahlwolle", localize "STRS_item_farmitem_info", [["stahl", 1]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// A_item_fnc_drugs
//["Whale",["Item", "drug"],["Land_CanisterPlastic_F", "Whale"],[30000, 30000], [30, ""], [true, true, true,true, A_item_fnc_food],"whale",localize "STRS_inv_item_nahrung_info", [] ],
["coca_seedling",                          ["Item", "seedling"],["Land_Suitcase_F", "Coca seedling"],[200, 120],[1, ""], [true, true, true,true, false, A_plant_fnc_interact_plant_seedling, "img\icons\sapling.paa", ""],localize "STRS_inv_item_cocaine",localize "STRS_item_farmitem_info", [] ],
["marijuana_seedling",                     ["Item", "seedling"],["Land_Suitcase_F", "Marijuana seedling"],[200, 80],[1, ""], [true, true, true,true, false, A_plant_fnc_interact_plant_seedling, "img\icons\sapling.paa", ""],localize "STRS_inv_item_marijuana",localize "STRS_item_farmitem_info", [] ],
["poppy_seedling",                         ["Item", "seedling"],["Land_Suitcase_F", "Poppy seedling"],[200, 100],[1, ""], [true, true, true,true, false, A_plant_fnc_interact_plant_seedling, "img\icons\sapling.paa", ""],localize "STRS_inv_item_heroin",localize "STRS_item_farmitem_info", [] ],
["Unprocessed_Cocaine",                    ["Item", "drug"],["Land_Sack_F", "Unprocessed Cocaine"],[200, 120],[1, ""], [true, true, true,true, false,  A_item_fnc_useresource, "img\icons\unprocessed_cocaine.paa", ""],localize "STRS_inv_item_cocaine",localize "STRS_item_farmitem_info", [] ],
["Unprocessed_Marijuana",                  ["Item", "drug"],["Land_Sack_F", "Unprocessed Marijuana"],[200, 80],[1, ""], [true, true, true,true, false,  A_item_fnc_useresource, "img\icons\unprocessed_marijuana.paa", ""],localize "STRS_inv_item_marijuana",localize "STRS_item_farmitem_info", [] ],
["Unprocessed_LSD",                        ["Item", "drug"],["Land_Sack_F", "Unprocessed LSD"],[200, 90],[1, ""], [true, true, true,true, false,  A_item_fnc_useresource, "img\icons\unprocessed_lsd.paa", ""],localize "STRS_inv_item_lsd",localize "STRS_item_farmitem_info", [] ],
["Unprocessed_Heroin",                     ["Item", "drug"],["Land_Sack_F", "Unprocessed Heroin"],[200, 100],[1, ""], [true, true, true,true, false,  A_item_fnc_useresource, "img\icons\unprocessed_heroin.paa", ""],localize "STRS_inv_item_heroin",localize "STRS_item_farmitem_info", [] ],
["marijuana",                              ["Item", "drug"],["Land_PainKillers_F", "Marijuana"],[10000, 4500],[0.5, ""], [true, true, true,true, false, A_item_fnc_drugs, "img\icons\marijuana.paa", ""],localize "STRS_inv_item_marijuana",localize "STRS_inv_item_drogen_info", [["Unprocessed_Marijuana", 10]]],
["cocaine",                                ["Item", "drug"],["Land_PainKillers_F", "Cocaine"],[15000, 6000],[0.5, ""], [true, true, true,true, false, A_item_fnc_drugs, "img\icons\cocaine.paa", ""],localize "STRS_inv_item_cocaine",localize "STRS_inv_item_drogen_info", [["Unprocessed_Cocaine", 10]]],
["lsd",                                    ["Item", "drug"],["Land_PainKillers_F", "LSD"],[25000, 8500],[0.5, ""],[true,true,true, true, false, A_item_fnc_drugs, "img\icons\lsd.paa", ""], localize "STRS_inv_item_lsd",localize "STRS_inv_item_drogen_info", [["Unprocessed_LSD", 10]]],
["heroin",                                 ["Item", "drug"],["Land_PainKillers_F", "Heroin"],[22500, 7250],[0.5, ""],[true,true,true, true, false, A_item_fnc_drugs, "img\icons\heroin.paa", ""], localize "STRS_inv_item_heroin",localize "STRS_inv_item_drogen_info", [["Unprocessed_Heroin", 10]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Rings
["Diamondring",                            ["Item", "Ring"],["Land_Suitcase_F", "Diamond Ring"],[20000, 6500],[0.1, "", ""],[true, true, true, false, false, A_item_fnc_nouse, "img\icons\diamond_ring_large.paa", ""],"Diamond Ring","Sell at the Jewelry store", [["diamondore", 12]]],
["EDiamondring",                           ["Item", "Ring"],["Land_Suitcase_F", "Expensive Diamond Ring"],[28000, 8500],[1.5, "", ""], [true, true, true, false, false, A_item_fnc_nouse, "img\icons\diamond_ring_small.paa", ""],"Expensive Diamond Ring","Sell at the Jewelry store", [["diamondore", 15],["goldore", 10]]],
["Platinumring",                           ["Item", "Ring"],["Land_Suitcase_F", "Platinum Ring"],[24000, 7500],[0.5, "", ""], [true, true, true, false, false, A_item_fnc_nouse, "img\icons\platnum_ring.paa", ""],"Platinum Ring","Sell at the Jewelry store", [["platinumore", 10]]],
["EPlatinumring",                          ["Item", "Ring"],["Land_Suitcase_F", "Expensive Platinum Ring"],[32000, 9500],[1, "", ""],[true, true, true, false, false, A_item_fnc_nouse, "img\icons\platnum_rings.paa", ""],"Expensive Platinum Ring","Sell at the Jewelry store", [["platinumore", 10],["rubyore", 10]]],
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Dead Animals
// not used?
["Salema_F",                               ["Item", "animal"],["Salema_F", "Salema"],[1500, 1500], [0.1, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\salema.paa", "sea"], "Salema Progy fish", "Salema Progy fish", []], 
//["Ornate_random_F",                        ["Item", "animal"],["Ornate_random_F", "Dead fish"],[1000, 1500], [0.1, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\goldfish.paa", "sea"], "Tropical fish", "Tropical fish", []],
["Mackerel_F",                             ["Item", "animal"],["Mackerel_F", "Mackerel"],[1000, 1500], [2, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\mackerel.paa", "sea"], "Mackerel fish", "Mackerel fish", []],
["Tuna_F",                                 ["Item", "animal"],["Tuna_F", "Tuna"],[1500, 1500], [2, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\tuna.paa", "sea"], "Tuna fish", "Tuna fish", []],
["Mullet_F",                               ["Item", "animal"],["Mullet_F", "Mullet"],[1000, 1500], [2, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\mullet.paa", "sea"], "Mullet fish", "Mullet fish", []],
["CatShark_F",                             ["Item", "animal"],["CatShark_F", "Cat-shark"],[1500, 1500], [3, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\catshark.paa", "sea"], "Cat-Shark", "Cat-Shark", []],
["Rabbit_F",                               ["Item", "animal"],["Rabbit_F", "Rabbit"],[1500, 1500], [2, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\rabbit.paa", "land"], "Rabbit", "Rabbit", []],
["Snake_random_F",                         ["Item", "animal"],["Snake_random_F", "Snake"],[1500, 1500], [1, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\snake.paa", "land"], "Snake", "Snake", []],
["Goat_random_F",                          ["Item", "animal"],["Goat_random_F", "Goat"],[1500, 1500], [1, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\goat.paa", "land"], "Goat", "Goat", []],
["Sheep_random_F",                         ["Item", "animal"],["Sheep_random_F", "Sheep"],[1500, 1500], [1, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\sheep.paa", "land"], "Sheep", "Sheep", []],
["Hen_random_F",                           ["Item", "animal"],["Hen_random_F", "Chicken"],[1500, 1500], [1, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\chicken.paa", "land"], "Chicken", "Chicken", []],
["Turtle_F",                               ["Item", "animal"],["Turtle_F", "Turtle"],[1500, 1500], [10, "", "", 200], [true,true,true, false, true, "animal.sqf", "img\icons\turtle.paa", "sea"], "Turtle", "Turtle", []]
];

