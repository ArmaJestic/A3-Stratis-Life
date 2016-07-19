#include "includes\macro.h"

//=================================================================================
INV_smscost              = 25;
add_civmoney             = 1250;
add_copmoney             = 2500;
add_workplace            = 1250;
CopWaffenAvailable       = 0;
CopInPrisonTime          = 180;
shooting_self            = 0;
srHinbewegen             = 0;
["stunned", false] call A_stats_fnc_init_variable;
hatGanggebietErobert     = false;
CivTimeInPrison          = 0;
CopLog                   = [];
MayorTaxes               = 0;
MayorTaxPercent          = 35;
chiefSteuern             = 0;
chiefBekommtSteuern      = 35;
eigene_zeit              = time;

money_limit              = 1000000000;
bank_limit               = 1000000000;

wantedbonus              = 25000;
monehStehlenMax          = 200000;
demerits                 = 0;
gtbonus                  = 10;
gtactive                 = false;
keyblock                 = false;
maxmanitime              = 2400;
powerrestorecost         = 10000;
impoundpay               = 1000;
noholster                = false;
MGcost                   = 10000;
PKcost                   = 10000;
SQUADcost                = 20000;
maxinfai                 = 16;
firestrikes              = 3;
totalstrikes             = 3;
facworkercost            = 15000;
fvspam                   = false;
maxfacworkers            = 50;
maxfacworkers2           = 41;
firingcaptive            = false;
lockpickchance           = 30;
planting                 = false;
drugstockinc             = 900;
druguserate              = 120;

currecciv               = false;
curreccop               = false;
currecins               = false;
currecred               = false;

buybi                   = false;

//========AWESOME===========

stunshots              = 0;
stunshotsmax           = 3;

stunloop               = false;

MaxStunTime            = 15;

StunActiveTime         = 0;
StunTimePerHit         = 15;

Stuntimelight          = 5;

M_punch                = 1.5;

stunpistolfront        = 10;
stunpistolback         = 15;

stunriflefront         = 15;
stunrifleback          = 20;

stunpronecrit          = 30;
stunpronehev           = 25;
stunpronereg           = 20;

stunfrontcrit          = 25;
stunfronthev           = 20;
stunfrontreg           = 15;

stunbackcrit           = 30;
stunbackhev            = 25;
stunbackreg            = 25;

M_prone_crit           = 0.1;
M_prone_hev            = 0.05;
M_prone_reg            = 0.01;

M_front_crit           = 0.05;
M_front_hev            = 0.01;
M_front_reg            = 0.005;

M_back_crit            = 0.5;
M_back_hev             = 0.1;
M_back_reg             = 0.05;

pmcopmax               = 3;
pmccoplimit            = 0;
pmccoptimer            = 60 * 30;
pmccoptimerz           = false;

S_LOADED               = false;
A_running              = false;

A_actions              = compile preprocessfilelinenumbers "actions.sqf";
A_actionsremove        = compile preprocessfilelinenumbers "actionsRemove.sqf";



backup_cop_weapons      =
[
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "M9",
    "m16a4"
];

backup_cop_magazines    =
[
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

backup_opf_weapons      =
[
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "Makarov",
    "AK_74_GL_kobra"
];
backup_opf_magazines    =
[
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

backup_ins_weapons      =
[
    "ItemMap",
    "ItemRadio",
    "ItemCompass",
    "ItemWatch",
    "AK_47_S"
];

backup_ins_magazines    =
[
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "30Rnd_762x39_AK47",
    "HandGrenade_East",
    "HandGrenade_East"
];


//========AWESOME===========


//===============MOTD==================
motdwaittime            = 120;

//===============Cop Patrol==================

pmissionactive          = false;
patrolwaittime          = false;
patrolmoneyperkm        = 5.0;  // 1 would be equal to $7,000 for 1KM

//=========government convoy=============
govconvoybonus          = 20000;
convoyrespawntime       = 30;  //reset to 30 after testing

//===== Gas station robbing
maxstationmoney         = 35000;
wantedamountforrobbing  = 25000;

if(debug)then{drugstockinc = 6;druguserate = 20};
//==============================PETROL/OIL=========================================
fuel_max_reserve        = 10000; //(how many liters in reserve)
fuel_per_barrel         = 100; //(how many liters in 1 barrel)
fuel_pump_rate          = 3; //(how fast in liters/second fuel is dispensed)
fuel_base_price         = 1; //(price of 1 liter of fuel)
if (isServer) then { [0] call A_shop_menu_fnc_set_fuel_consumed; };


//==============================MINING=============================================
shoveldur=20;
shovelmax=2;
pickaxedur=50;
pickaxemax=3;
hammerdur=100;
hammermax=4;
working=false;

//===============================GANGS=============================================
gangincome          = 15000;
gangcreatecost      = 75000;
gangdeltime         = 300;
gangareas           = [gangarea1,gangarea2,gangarea3];

//=========== cop patrol array ==========
coppatrolarray  =
[
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

if (isblu) then {
    RadioTextMsg_1 = "Put your fucking hands up!";
    RadioTextMsg_2 = "Pull over and stay in your vehicle!";
    RadioTextMsg_3 = "Drop your weapon and put your hands on your head!";
    RadioTextMsg_4 = "Your free to go, have a nice day";
} else {
    RadioTextMsg_1 = "Put your fucking hands up now!";
    RadioTextMsg_2 = "Step away from the vehicle!";
    RadioTextMsg_3 = "Do it now or your dead!";
    RadioTextMsg_4 = "Dont shoot i give up!";
};

RadioTextArt_1 = "direct";
RadioTextArt_2 = "direct";
RadioTextArt_3 = "direct";
RadioTextArt_4 = "direct";

publicarbeiterarctionarray = [];


robpoolsafe1           = 0; 
robpoolsafe2           = 0;
robpoolsafe3           = 0;
deadtimebonus          = 0.001;

["arrested", false] call A_stats_fnc_init_variable;
["deadtimes", 0] call A_stats_fnc_init_variable;
["copskilled", 0] call A_stats_fnc_init_variable;
["civskilled", 0] call A_stats_fnc_init_variable;
["arrestsmade", 0] call A_stats_fnc_init_variable;

selfkilled               = 0;
killstrafe               = 20000;
copteamkillstrafe        = 20000;
GesetzAnzahl             = 10;
MayorExtraPay            = 5000;
chiefExtraPay            = 10000;


atmscriptrunning = 0;
shopactivescript = 0;
deadcam_wechsel_dauer    = 5;
slave_cost               = 50000;
slavemoneyprosekunde	 = 500;
maxslave                 = 6;
copslaveallowed          = 1;
localslave               = 0;
localslavecounter        = 0;
huren_cost               = 50000;
hoemoneyprosekunde       = 500;
maxhuren                 = 5;
copworkerallowed         = 0;
pimpactive               = 0;
localhuren               = 0;
localhurencounter        = 0;
speedbomb_minspeed       = 1;
speedbomb_maxspeed       = 100;
speedbomb_mindur         = 10;
speedbomb_maxdur         = 300;
zeitbombe_mintime        = 1;
zeitbombe_maxtime        = 10;
publichideoutarray       = [];
hideoutcost              = 20000;
marker_ausserhalb        = param1;
marker_innerhalb         = 5;
marker_CopDistance       = 50; //controls distance cops need to be to make civ dots appear outside of towns.
CivMarkerUngenau         = 20;



workplace_object = 0;
workplace_radius = 1;
workplacearray           = [[workplace1, 80], [workplace2, 80], [workplace3, 60]];

nonlethalweapons         = ["Binocular", "NVGoggles", "ItemMap", "ItemCompass", "ItemRadio", "ItemWatch", "ItemGPS"];
slavearray               = workplacearray;
timeinworkplace          = 0;
wpcapacity               = 10;
inventory_has_itemshop          = 0;
INV_haswepshop           = 0;
["BuildingsOwnerArray", []] call A_stats_fnc_init_variable;

if(isciv) then {
BuyAbleBuildingsArray    =
    [
        ["wp1", "Workplace 1", workplace_getjobflag_1, 100000, 500, "wp", "WpAblage_1"],
        ["wp2", "Workplace 2", workplace_getjobflag_2, 200000, 1000, "wp", "WpAblage_2"],
        ["wp3", "Workplace 3", workplace_getjobflag_3, 350000, 1500, "wp", "WpAblage_3"]
    ];
};

civclassarray          = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
civslavearray          = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
civworkerarray         = ["C_man_1_1_F","C_man_1_2_F","C_man_1_3_F"];
terroristarray         = ["TK_GUE_Soldier_3_EP1","TK_GUE_Soldier_AAT_EP1","TK_GUE_Soldier_AT_EP1","TK_GUE_Soldier_EP1","TK_GUE_Soldier_HAT_EP1","TK_INS_Soldier_AAT_EP1","TK_INS_Soldier_EP1"];

player_connected_handler = {
	private["_id", "_name", "_uid"];
	_id = _this select 0;
	_name = _this select 1;
	_uid = _this select 2;
	
	publicVariable "legislation_laws";
	publicVariable "INV_ItemTypenArray";
	publicVariable "INV_ItemStocks";
	publicVariable "INV_ItemMaxStocks";
};

if(isServer)then {
	onPlayerConnected { [_id, _name, _uid] call player_connected_handler };
};
