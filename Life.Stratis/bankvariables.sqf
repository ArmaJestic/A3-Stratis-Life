#include "Awesome\Functions\macro.h"

startmoneh                   = 50000;
donatormoneh                 = startmoneh * 5; //(250k)
silvermoneh                  = donatormoneh * 2; //(500k)
goldmoneh                    = donatormoneh * 3; //(750k)
platinummoneh                = donatormoneh * 4 ; //(1 million)
adminmoneh                   = donatormoneh * 12;  //(3 million)

robb_timeSperre              = 1200;
local_useBankPossible        = true;
maxinsafe                    = 1000000000;
BankRaubKontoverlust         = 4000;
ShopRaubKontovershop         = 0;
ShopRaubProzentVershop       = 0;
rblock                       = 0;
stolencash                   = 0;
Maxbankrobpercentlost        = 0.05;
MaxbankrobpercentlostA       = 0.10;
MaxbankrobpercentlostB       = 0.20;
zinsen_prozent               = 1;
zinsen_dauer                 = 1200;
robenable                    = true;

donators1     = ["32114118","11864902","11872198","3478662","36557446","26082630","11060102","48390213","38996486","68448198","50452678","55164870","4022278","27321414","19960774","3289670","75077446","27514246","21532166","6028038","17781638","73708486","73764294","26213190","93001990","5803968"];
donators2     = ["71662278","51369350","6095040","34373126","10154566"];
donators3     = ["11124934","10006086","12071430"];
donators4     = ["24943814","72681222"];

private["_uid"];
_uid = getPlayerUID player;

if (_uid in donators1) then {
    startmoneh = donatormoneh;
}
else { if (_uid in donators2) then {
    startmoneh = silvermoneh;
}
else { if (_uid in donators3) then {
    startmoneh = goldmoneh;
}
else { if (_uid in donators4) then {
    startmoneh = platinummoneh;
};};};};

if ([player] call player_admin) then {
	startmoneh = startmoneh + adminmoneh;
};

if (undefined(bankaccount)) then {
	["bankaccount", ([startmoneh] call encode_number)] call stats_init_variable;
};

shopflagarray            = [shop1,shop2,shop3,shop4];
bankflagarray            = [mainbank, atm1, atm2, atm3, atm4, atmpf, pmcatm, insatm, opfatm_floating, cp1atm, cp2atm, blue4atm];
carshoparray             = [carshop1, carshop2, carshop3];
speedcamarray            = [speed1,speed2,speed3,speed4,speed5];
drugsellarray            = [mdrugsell,cdrugsell,ldrugsell,hdrugsell];
GasStationArray          =
[
    fuelshop1,
    (nearestobject[getpos fuelshop1, "Land_FuelStation_Feed_F"])
];