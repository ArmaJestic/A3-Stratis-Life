// A_factory_fnc_globals

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


private["_weaponfactory"];
_weaponfactory=
[
	"hgun_ACPC2_F",
	"9Rnd_45ACP_Mag",
	"hgun_Rook40_F",
	"16Rnd_9x21_Mag",
	"SMG_02_F",
	"30Rnd_9x21_Mag",
	"HandGrenade",
	"arifle_TRG21_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_Mk20_F",
	"arifle_Mk20C_F",
	"arifle_Mk20_GL_F",
	"30Rnd_556x45_Stanag_Tracer_Yellow",
	"30Rnd_556x45_Stanag",
	"srifle_EBR_F",
	"20Rnd_762x51_Mag",
	"Rnd_HE",
	"Rnd_Smoke",
	"Rnd_RedSmoke",
	"Rnd_GreenSmoke",
	"Rnd_YellowSmoke",
	"Rnd_PurpleSmoke",
	"Rnd_BlueSmoke",
	"Rnd_OrangeSmoke",
	"Rnd_FlareWhite",
	"Rnd_FlareGreen",
	"muzzle_snds_L",
	"muzzle_snds_M",
	"acc_flashlight",
	"acc_pointer_IR",
	"optic_Holosight",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_Arco"
];

private["_terrorfactory"];
_terrorfactory=
[
];


private["_vehiclefactory"];
_vehiclefactory=
[
	"O_Quadbike_01_F",
	"C_Offroad_01_F_red",
	"C_Offroad_01_F_white",
	"C_Offroad_01_F_tan",
	"C_Offroad_01_F_dark_blue",
	"C_Offroad_01_F_bur",
	"C_Offroad_01_F_rider",
	"C_Offroad_01_F_sky_blue",
	"C_Offroad_01_F_hot_pink",
	"C_Hatchback_01_F_light_tan",
	"C_Hatchback_01_F_dark_tan",
	"C_Hatchback_01_F_light_gray",
	"C_Hatchback_01_F_dark_gray",
	"C_Hatchback_01_F_light_blue",
	"C_Hatchback_01_F_dark_blue",
	"C_Hatchback_01_F_light_green",
	"C_Hatchback_01_F_light_yellow",
	"C_Hatchback_01_F_black",
	"C_Hatchback_01_F_white",
	"C_Hatchback_01_sport_F_red",
	"C_Hatchback_01_sport_F_blue",
	"C_Hatchback_01_sport_F_orange",
	"C_Hatchback_01_sport_F_white",
	"C_Hatchback_01_sport_F_light_gray",
	"C_Hatchback_01_sport_F_dark_green",
	"C_SUV_01_F_red",
	"C_SUV_01_F_black",
	"C_SUV_01_F_gray",
	"C_SUV_01_F_orange",
	"C_SUV_01_F_hot_pink",
	"C_Van_01_transport_F_fwhite_bwhite",
	"C_Van_01_transport_F_fcamo_bcamo",
	"C_Van_01_transport_F_fred_bred",
	"C_Van_01_fuel_F_fwhite_bwhite",
	"C_Van_01_fuel_F_fred_bred",
	"C_Van_01_fuel_F_fcamo_bcamo",
	"C_Van_01_box_F_fwhite",
	"C_Van_01_box_F_fred",  
	"C_Van_01_box_F_fcamo",
	"I_Truck_02_covered_F",
	"I_Truck_02_transport_F"
];

private["_aircraft_factory"];
_aircraft_factory =
[
	"B_Heli_Light_01_F_nobenches_adddoors",
	"I_Heli_Transport_02_F_dahoman"
];

private["_itemfactory"];
_itemfactory=
[
	"hgun_ACPC2_F",
	"16Rnd_9x21_Mag",
	"9Rnd_45ACP_Mag",
	"reparaturkit",
	"kleinesreparaturkit",
	"kanister",
	"nitro",
	"lockpick",
	"medikit",
	"Firstaidkit",
	"Toolkit",
	"lighter",
	"defuser",
	"fernzuender",
	"vclammo",
	"fishingpole",
	"knife",
	"shovel",
	"pickaxe",
	"JackHammer",
	"supgrade1",
	"supgrade2",
	"supgrade3",
	"supgrade4",
	"supgrade5"
];

private["_tairfactory"];
_tairfactory =
[
	"O_MRAP_02_F",
	"O_MRAP_02_hmg_F",
	"O_MRAP_02_gmg_F",
	"O_APC_Wheeled_02_rcws_F",
	"O_APC_Tracked_02_cannon_F",
	"O_Heli_Light_02_unarmed_F",
	"O_Heli_Light_02_F_nodagr",
	"O_Heli_Attack_02_F_noscalpel_noskyfire",
	"O_Heli_Attack_02_black_F_noscalpel_noskyfire"
];

private["_alcoholfactory"];
_alcoholfactory = 
[
	"beer",
	"fanta",
	"vodka",
	"smirnoff",
	"wiskey",
	"redgull",
	"water"
];

private["_ringfactory"];
_ringfactory = 
[
	"Diamondring",
	"EDiamondring",
	"Platinumring",
	"EPlatinumring"
];

private["_furnace"];
_furnace = ["steel"];

factory_object = 0;
factory_id = 1;
factory_name = 2;
factory_crate = 3;
factory_spawn = 4;
factory_items = 5;
factory_cost = 6;
factory_storage = 7;
factory_queue = 8;

all_factories =
[
	[Vehiclefactory, "factory1", "Vehicle Factory", dummyobj, vfacspawn, _vehiclefactory, 2500000, "Fabrikablage1", "vehiclequeue"],
	//[ Aircraftfactory, "factory2", "Aircraft Factory", dummyobj, airfacspawn, _aircraft_factory, 5000000, "AircraftFactory1", "aircraftqueue"],
	[ItemFabrik_1, "factory3", "General Factory", igunbox,dummyobj, _itemfactory, 250000, "Fabrikablage3", "itemqueue"],
	[weaponfactory, "factory4", "Weapon Factory", wfgunbox,dummyobj, _weaponfactory, 5000000, "Fabrikablage4", "weaponqueue"],
	[tairshop, "factory6", "Terrorist Vehicle Factory", dummyobj, tairspawn, _tairfactory, 10000000, "Fabrikablage6", "tavehiclequeue"]
	//[ alcoholfactory, "factory7", "Alcohol Factory", dummyobj, dummyobj, _alcoholfactory, 450000, "Fabrikablage7", "alcoholfactoryqueue"] ,
	//[ ringfactory, "factory9", "Ring Factory", dummyobj, dummyobj, _ringfactory, 2500000, "Fabrikablage9", "diamondqueue"],
	//[ Furnace, "factory10","Furnace", dummyobj, dummyobj, _furnace, 1500000, "Fabrikablage10","furnacequeue"]
];
