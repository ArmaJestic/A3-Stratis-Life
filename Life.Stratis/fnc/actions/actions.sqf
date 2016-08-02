// A_actions_fnc_actions
// sets up all actions
// lots of unused bits
// the string being passed to a script/function to be compiled is a security risk
// each line will need its own function
// the whole system needs to be reworked

#include "..\..\includes\macro.h"


if(A_actions_var_a_running) exitWith {null};
A_actions_var_a_running = true;

private["_role"];
_role = player;

// temp disabled
//====================================== BANK ROB =====================================================
//action4 =	_role addaction ["Rob safe", A_other_fnc_bankrob, ["ausrauben", safe1],1,false,true,"", "((player distance safe1) <= 3) && isciv"];
//action5 =	_role addaction ["Rob safe", A_other_fnc_bankrob, ["ausrauben", safe2],1,false,true,"", "((player distance safe2) <= 3) && isciv"];
//action6 =	_role addaction ["Rob safe", A_other_fnc_bankrob, ["ausrauben", safe3],1,false,true,"", "((player distance safe3) <= 3) && isciv"];

// unused
//==================================== A_other_fnc_holster RIFLE ==================================================
//action7 = 	_role addaction ["A_other_fnc_holster Rifle",A_other_fnc_noscript,[""],1,false,true,"",'player distance workplacejob_deliveryflag3 <= 4'];

// temp disabled
//===================================== A_missions_fnc_assassination =================================================
//action8 = _role addaction ["Get A_missions_fnc_A_missions_fnc_assassination job","A_missions_fnc_assassination.sqf",["getajob_assassin"],1,false,true,"","player distance assassin <= 3 and isciv"];
//action9 = _role addaction ["Escort VIP", A_other_fnc_noscript, "[VIPtarget] join (group player); player groupchat ""escort the VIP to the police base before he is assassinated!"";",1,false,true,"","player distance VIPtarget < 5 and isblu"];

// temp disabled
//========================================= HUNTING ===================================================
//action_h1 =	_role addaction ["Take rabbit meat",A_other_fnc_noscript,'_no = ceil(random 2);if (((call A_inventory_fnc_get_own_weight) + ("rabbit" call A_inventory_fnc_get_item_type_kg)*_no) > A_inventory_var_INV_CarryingCapacity)exitwith{player groupChat localize "STRS_inv_buyitems_maxgewicht"};(nearestobjects [getpos player, ["rabbit"],  3] select 0) setvariable ["inuse", 1, true]; player playmove "AinvPknlMstpSlayWrflDnon_medic";sleep 4;waituntil {animationstate player != "AinvPknlMstpSlayWrflDnon_medic"};deletevehicle (nearestobjects [getpos player, ["rabbit"],  3] select 0);[player, "rabbit", _no] call A_inventory_fnc_add_item;player groupchat format["you got %1 rabbit meat", _no];',1,true,true,"",'_w = (nearestobjects [getpos player, ["rabbit"],  3] select 0) getvariable "inuse"; undefined(_w) and player distance (nearestobjects [getpos player, ["rabbit"],  3] select 0) < 5 and !alive (nearestobjects [getpos player, ["rabbit"],  3] select 0) and isciv'];

// temp disabled
//===================================== TARGET RESET ==================================================
//action12 = _role addaction ["Reset targets",A_other_fnc_noscript,'{_x animate["terc",0]} foreach (nearestobjects [getPosATL player, ["TargetEpopup","TargetPopUpTarget"],  100])',1,true,true,"",'player distance gunshop1 < 5'];
//action113 = _role addaction ["Reset targets",A_other_fnc_noscript,'{_x animate["terc",0]} foreach (nearestobjects [getPosATL coprangetrigger, ["TargetEpopup","TargetPopUpTarget","TargetFakeTank_Lockable_EP1"],  900])',1,true,true,"",'player distance coprangereset < 5'];

//===================================== IMPOUND AREA ==================================================
action21 = _role addaction ["Impound Lot", A_other_fnc_noscript, format['[%1, %2] call A_interaction_fnc_impound_vehicle_menu;', player, cp2vehshopspawn], 1, false,true, "","player distance cp2vehshop <= 2.5"];
action22 = _role addaction ["Impound Lot", A_other_fnc_noscript, format['[%1, %2] call A_interaction_fnc_impound_vehicle_menu;', player, impoundarea2], 1, false,true, "","player distance impoundbuy <= 2.5"];

//================================== COP SLAVE ACTIONS ================================================
action24 = _role addaction ["Who do you work for?",A_other_fnc_noscript,'player groupchat format["this slave works for %1.", leader (nearestobjects [getpos player, A_main_var_civslavearray,  3] select 0)]',1,true,true,"",'_slave = (nearestobjects [getpos player, A_main_var_civslavearray, 3] select 0); not([_slave] call A_player_fnc_human) and ((player distance _slave) < 5) and ([(leader _slave)] call A_player_fnc_human) and isblu'];
action25 = _role addaction ["Set slave free",A_other_fnc_noscript,'_slave = (nearestobjects [getpos player, A_main_var_civslavearray,  3] select 0); _civ = leader _slave; deletevehicle _slave; [player, "(human-exploitation)", 20000] call A_player_fnc_update_warrants; player groupchat "the slave has been freed!";',1,true,true,"",'_slave = (nearestobjects [getpos player, A_main_var_A_main_var_civslavearray, 3] select 0); not([_slave] call A_player_fnc_human) and ((player distance _slave) < 5) and ([(leader _slave)] call A_player_fnc_human) and isblu'];

// unused
//==================================== A_item_fnc_repair POWER ===================================================
//action41 = _role addaction [format["Restore Power 1 ($%1)", A_main_var_powerrestorecost],A_other_fnc_noscript,'_moneh = [player, "money"] call A_inventory_fnc_get_item_amount; if(_moneh < A_main_var_powerrestorecost)exitwith{player groupchat "you do not have enough money"};[player, "money", -(A_main_var_powerrestorecost)] call A_inventory_fnc_add_item; "power1 setdamage 0;" call A_broadcast_fnc_broadcast',1,false,true,"","player distance power1 <= 7 and !alive power1 and isblu"];
//action42 = _role addaction [format["Restore Power 2 ($%1)", A_main_var_powerrestorecost],A_other_fnc_noscript,'_moneh = [player, "money"] call A_inventory_fnc_get_item_amount; if(_moneh < A_main_var_powerrestorecost)exitwith{player groupchat "you do not have enough money"};[player, "money", -(A_main_var_powerrestorecost)] call A_inventory_fnc_add_item; "power2 setdamage 0;" call A_broadcast_fnc_broadcast',1,false,true,"","player distance power2 <= 7 and !alive power2 and isblu"];

//================================== ELECTIONS =========================================================
action43 = _role addAction ["Nominate police chief", A_actions_fnc_action, [[], "A_voting_menu_fnc_nomination_menu_police"],1,false,true,"","player distance cp2atm < 7"];
action44 = _role addAction ["Nominate president", A_actions_fnc_action,[[], "A_voting_menu_fnc_nomination_menu_president"],1,false,true,"","player distance rathaus <= 3"];

//================================== PRESIDENT actions =================================================
action4345 = _role addAction ["Legislation", A_actions_fnc_action,[[player], "A_legislation_menu_fnc_menu_create"],1,false,true,"","(player distance rathaus <= 3 && {([player] call A_player_fnc_president)})"];
action4346 = _role addAction ["Economy", A_actions_fnc_action,[[player], "A_economy_menu_fnc_menu_create"],1,false,true,"","(player distance rathaus <= 3 && {([player] call A_player_fnc_president)})"];

//===================================== BUY INSURANCE ===================================================
action47 = _role addaction [format["Buy bank insurance ($%1)", ("bankinsurance" call A_inventory_fnc_get_item_buy_cost)],A_other_fnc_noscript,'[player] call A_interaction_fnc_buy_insurance;', 1 , false,true,"","(!A_interaction_var_interact_buy_item_active && (player distance mainbank <= 2.5 or player distance cp2atm <= 2.5 or player distance storage <= 2.5))"];

//======================================= CRIMELOG ====================================================
//action48 = _role addaction ["Crime Log","A_dlg_fnc_maindialogs.sqf",["A_main_var_coplog"],1,false,true,"","player distance rathaus <= 3"];

//======================================== SLAVES =====================================================
action49 = _role addaction [format["Buy Slave ($%1)", A_main_var_slave_cost],"slaves.sqf", ["slave"],1,false,true,"","!A_main_var_currecciv and player distance slaveflag <= 10 and isciv"];

//==================================== PRIVATE STORAGE ================================================
action50 = _role addaction ["Private storage",A_other_fnc_noscript,'[player] call A_storage_menu_fnc_menu_private_storage;', 1, false,true,"","player distance storage <= 2.5"];
storage1 = _role addaction ["Private storage",A_other_fnc_noscript,'[player] call A_storage_menu_fnc_menu_private_storage;', 1, false,true,"","player distance cp2atm <= 2.5"];
storage2 = _role addaction ["Private storage",A_other_fnc_noscript,'[player] call A_storage_menu_fnc_menu_private_storage;', 1, false,true,"","player distance pmcatm <= 2.5"];
//storage4 = _role addaction ["Private storage",A_other_fnc_noscript,'[player] call A_storage_menu_fnc_menu_private_storage;', 1, false,true,"","player distance atm5 <= 2.5"];

//========================================= BAIL ======================================================
//action51 = _role addaction ["Pay Bail", "A_dlg_fnc_maindialogs.sqf", ["bail"],1,false,true,"","player distance bailflag <= 5 and isciv"];

//===================================== ITEM PROCESS ==================================================
action52 = _role addAction ["Process Diamond rock", A_other_fnc_noscript, '[player, "Diamond rock", "Diamondring", 12] call A_interaction_fnc_item_process;', 1, false, true, "",'((player distance Diamond_1) <= 5) && isciv && ([player, "diamond"] call A_player_fnc_has_license)'];
action53 = _role addAction ["Process Oil", A_other_fnc_noscript, '[player, "Oil", "OilBarrel", 10] call A_interaction_fnc_item_process;', 1, false, true, "", '((player distance Oil_1) <= 5) && isciv && ([player, "oil"] call A_player_fnc_has_license)'];
action54 = _role addAction["Make Glass", A_other_fnc_noscript, '[player, "Sand", "Glass", 2] call A_interaction_fnc_item_process;', 1 , false, true, "", '((player distance Glassblower) <= 5) && isciv && ([player, "glassblowing"] call A_player_fnc_has_license)'];

//action55 = _role addaction 
//[
//		"Process Wheat", A_other_fnc_noscript, '[player, "getreide", "Bread", 2] call A_interaction_fnc_item_process;', 1, false, true, "", 
//		'((player distance Bakery_1) <= 5) && isciv && ([player, "Baker"] call A_player_fnc_has_license)'
//];

// temp disabled
//===================================== CONVOY CASH ===================================================
//action56 = _role addAction ["Steal police payroll",A_other_fnc_noscript,'convoy_cash=false; publicvariable "convoy_cash"; _cash = (playersNumber west)* A_main_var_govconvoybonus; [player, "money", _cash] call A_inventory_fnc_add_item; [player, "(convoy-heist)", _cash] call A_player_fnc_update_warrants;  player groupchat format["You stole $%1!", _cash];',1,false,true,"","_driver = driver convoy_truck; (player distance convoy_truck) <= 7 && convoy_cash && not([player] call A_player_fnc_blufor) && (not(alive _driver) || (isNull _driver))"];

//======================================== WORKERS =====================================================
//_role addaction [format ["Hire a worker ($%1)", A_main_var_huren_cost],"worker.sqf", ["holen"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv"];

//======================================= WORKPLACE ====================================================
action61 = _role addaction ["Get courier job","A_missions_fnc_delivery.sqf", ["getajob_A_missions_fnc_delivery"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv"];
action62 = _role addaction ["Cancel A_missions_fnc_A_missions_fnc_delivery mission","A_missions_fnc_A_missions_fnc_delivery.sqf", ["cancel"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv and alreadygotaworkplacejob == 1"];
action63 = _role addaction ["Get A_missions_fnc_A_missions_fnc_taxi job","A_missions_fnc_A_missions_fnc_taxi.sqf", ["getajob_A_missions_fnc_A_missions_fnc_taxi"],1,false,true,"","(player distance workplace_getjobflag_1 <= 7 or player distance workplace_getjobflag_2 <= 7 or player distance workplace_getjobflag_3 <= 7) and isciv"];
action64 = _role addaction ["Finish A_missions_fnc_A_missions_fnc_taxi mission","A_missions_fnc_A_missions_fnc_taxi.sqf", ["canceljob_A_missions_fnc_A_missions_fnc_taxi"],1,false,true,"","(player distance workplace_getjobflag_1 <= 5 or player distance workplace_getjobflag_2 <= 5 or player distance workplace_getjobflag_3 <= 5) and isciv and workplacejob_A_missions_fnc_A_missions_fnc_taxi_active"];
action65 = _role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 0) select 1, (BuyAbleBuildingsArray select 0) select 3],"buyshop.sqf", ["property", 0],1,false,true,"","player distance ((BuyAbleBuildingsArray select 0) select 2) <= 5 and !(((BuyAbleBuildingsArray select 0) select 0) in BuildingsOwnerArray)"];
action66 = _role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 1) select 1, (BuyAbleBuildingsArray select 1) select 3],"buyshop.sqf", ["property", 1],1,false,true,"","player distance ((BuyAbleBuildingsArray select 1) select 2) <= 5 and !(((BuyAbleBuildingsArray select 1) select 0) in BuildingsOwnerArray)"];
action67 = _role addaction [format [localize "STRS_addAction_buy_shop", (BuyAbleBuildingsArray select 2) select 1, (BuyAbleBuildingsArray select 2) select 3],"buyshop.sqf", ["property", 2],1,false,true,"","player distance ((BuyAbleBuildingsArray select 2) select 2) <= 5 and !(((BuyAbleBuildingsArray select 2) select 0) in BuildingsOwnerArray)"];

//====================================== VEHICLE actions ================================================
//action68 = _role addaction [localize "STRS_addaction_trunk_see",A_other_fnc_noscript,'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);_str = ([_vcl] call A_vehicle_fnc_storage_name);[_str] call A_SCRIPT_VEHICLECHECK;',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and not([player, _vcl] call A_vehicle_fnc_owner) and ([_vcl] call A_vehicle_fnc_player_owned) and isblu'];
//action69 = _role addaction [localize "STRS_addaction_trunk_check",A_other_fnc_noscript,'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);_str = ([_vcl] call A_vehicle_fnc_storage_name);if([_vcl,_str] call A_inventory_fnc_storage_remove_illegal)then{call compile format["publicvariable ""%1"";", _str]};',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and not([player, _vcl] call A_vehicle_fnc_owner) and ([_vcl] call A_vehicle_fnc_player_owned) and isblu'];
//action70 = _role addaction ["Impound vehicle", A_other_fnc_noscript,format['[%1,([%1, 5] call A_vehicle_fnc_target)] call A_interaction_fnc_impound_vehicle_seize;', player], 1, true, true, "", 'private["_vcl"]; _vcl = [player, 5] call A_vehicle_fnc_target; ([player] call A_player_fnc_blufor) && not(undefined(_vcl)) && not([player,(vehicle player)] call A_mounted_fnc_player_inside)'];
//action71 = _role addaction ["Pull out",A_other_fnc_noscript,'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) execVM "A_other_fnc_pullout.sqf";',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and count (crew _vcl) > 0 and ([_vcl] call A_vehicle_fnc_player_owned) and (call A_inventory_fnc_iventory_is_armed) and not([player,_vcl] call A_mounted_fnc_player_inside)'];
//action72 = _role addaction [localize "STRS_addAction_vehicleinfo",A_other_fnc_noscript,'(nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0) call A_SCRIPT_VEHINFO;',1,true,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0);player distance _vcl < 10 and ([_vcl] call A_vehicle_fnc_player_owned) and not([player,_vcl] call A_mounted_fnc_player_inside)'];
//action73 = null;
//action74 = null;
//action75 = null;
//action76 = null;
//action77 = null;
//action78 = null;

//======================================== SHOP EXPORT ==================================================
//action79 = _role addaction ["Shop 1 export",A_other_fnc_noscript,"[(shop1 call A_inventory_fnc_get_shop_number)] call A_shop_menu_fnc_open_dialog;",1,false,true,"","player distance shop1export <= 3"];
//action80 = _role addaction ["Shop 2 export",A_other_fnc_noscript,"[(shop2 call A_inventory_fnc_get_shop_number)] call A_shop_menu_fnc_open_dialog;",1,false,true,"","player distance shop2export <= 3"];
//action81 = _role addaction ["Shop 3 export",A_other_fnc_noscript,"[(shop3 call A_inventory_fnc_get_shop_number)] call A_shop_menu_fnc_open_dialog;",1,false,true,"","player distance shop3export <= 3"];
//action82 = _role addaction ["Shop 4 export",A_other_fnc_noscript,"[(shop4 call A_inventory_fnc_get_shop_number)] call A_shop_menu_fnc_open_dialog;",1,false,true,"","player distance shop4export <= 3"];
//action83 = null; 							
//action84 = null;	
//action85 = null;

//===================================== Gas station Robbing===============================================
gsshop1 = fuelshop1 addaction ["Rob Gas Station 1", A_other_fnc_noscript, '[player, 1] call A_player_fnc_rob_station', 1, false, true, ""," not(isblu) && station1money >= 10000"];
//gsshop2 = fuelshop2 addaction ["Rob Gas Station 2", A_other_fnc_noscript, '[player, 2] call A_player_fnc_rob_station', 1, false, true, ""," not(isblu) && station2money >= 10000"];
//gsshop3 = fuelshop3 addaction ["Rob Gas Station 3", A_other_fnc_noscript, '[player, 3] call A_player_fnc_rob_station', 1, false, true, "",  "not(isblu) && station3money >= 10000"];
//gsshop4 = fuelshop4 addaction ["Rob Gas Station 4", A_other_fnc_noscript, '[player, 4] call A_player_fnc_rob_station', 1, false, true, "", "not(isblu) && station4money >= 10000"];
//gsshop5 = fuelshop5 addaction ["Rob Gas Station 5", A_other_fnc_noscript, '[player, 5] call A_player_fnc_rob_station', 1, false, true, "", "not(isblu) && station5money >= 10000"];
//gsshop6 = fuelshop6 addaction ["Rob Gas Station 6", A_other_fnc_noscript, '[player, 6] call A_player_fnc_rob_station', 1, false, true, "", "not(isblu) && station6money >= 10000"];
//gsshop7 = fuelshop7 addaction ["Rob Gas Station 7", A_other_fnc_noscript, '[player, 7] call A_player_fnc_rob_station', 1, false, true, "", "not(isblu) && station7money >= 10000"];
//gsshop8 = fuelshop8 addaction ["Rob Gas Station 8", A_other_fnc_noscript, '[player, 8] call A_player_fnc_rob_station', 1, false, true, "", "not(isblu) && station8money >= 10000"];
//gsshop9 = fuelshop9 addaction ["Rob Gas Station 9", A_other_fnc_noscript, '[player, 9] call A_player_fnc_rob_station', 1, false, true, "", "not(isblu) && station9money >= 10000"];

//========================   unflip vehicle     ================================
//action86 = _role addaction ["Unflip vehicle",A_other_fnc_noscript,"_this call A_interaction_fnc_vehicle_unflip;",1,false,true,"",'_vcl = (nearestobjects [getpos player, ["Air", "Ship", "LandVehicle"], 3] select 0); player distance _vcl < 5 and ([player, _vcl] call A_vehicle_fnc_owner) and not([player,_vcl] call A_mounted_fnc_player_inside)'];

// temp disabled
//=========================    Cop Patrol actions   ==============================
//action87 = _role addaction["Get patrol mission","coppatrol.sqf",["start"],1,false,true,"","isblu and player distance cp2atm <= 4 and !A_main_var_pmissionactive and !A_main_var_patrolwaittime"];
//action88 = _role addaction["Cancel patrol mission","coppatrol.sqf",["end"],1,false,true,"","isblu and A_main_var_pmissionactive and player distance cp2atm <= 4"];

//========================   A_missions_fnc_hostage  ================================================
action89 = _role addaction ["Take A_missions_fnc_A_missions_fnc_A_missions_fnc_hostage Mission","A_missions_fnc_A_missions_fnc_hostage.sqf",["getajob_A_missions_fnc_A_missions_fnc_hostage"],1,false,true,"","player distance A_missions_fnc_A_missions_fnc_hostage <= 3 and isciv"];
action90 = _role addaction ["Take A_missions_fnc_A_missions_fnc_hostage", A_other_fnc_noscript, "[A_missions_fnc_hostage1] join (group player); player groupchat ""Keep the A_missions_fnc_hostage close or you will fail!"";",1,false,true,"","player distance A_missions_fnc_hostage1 < 5 and isciv"];

//=======================  Escape Locked Vehicle ==============================================
//action91 = (vehicle player) addaction ["Jump Off",A_other_fnc_noscript,'moveOut player;',1,false,true,"",'_vcl = vehicle player;((_vcl iskindof "Motorcycle") or (_vcl iskindof "ATV_Base_EP1")) and not([player, _vcl] call A_vehicle_fnc_owner) and (locked _vcl) == 2 and (speed _vcl < 30)'];
//action112 = (vehicle player) addaction ["Break Out",A_other_fnc_noscript,'moveOut player;',1,false,true,"",'_vcl = vehicle player;(player != _vcl) and not([player, _vcl] call A_vehicle_fnc_owner) and (locked _vcl) == 2 and !(_vcl iskindof "Motorcycle") and !(_vcl iskindof "ATV_Base_EP1") and (speed _vcl < 30)'];

//=======================   ADMIN CAMERA ==============================================
//action91 = _role addaction ["Camera Console","aaacode.sqf",[],1,false,true,"","player distance rubblepile <= 2"];
//action112 = _role addaction ["Get Code","code.sqf",[],1,false,true,"","isciv and player distance hide1 <= 4"];


// temp disabled
//[cp2atm, ["Access PMC White List", A_other_fnc_noscript, '[player] call A_interaction_fnc_pmc_whitelist_menu;', 0, false, true, "", "true"]] call A_actions_fnc_add_new_action;

// temp disabled
//[player] call A_holster_fnc_add_actions;

A_actions_var_a_running = false;
