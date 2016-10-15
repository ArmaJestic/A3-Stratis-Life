// A_client_fnc_init

#include "..\..\includes\macro.h"


A_client_var_player_is_armed = false;
A_client_var_logics_check_object = 0;
A_client_var_logics_check_warn_distance = 1;
A_client_var_logics_check_teleport_distance = 2;

A_client_var_logics_checks = [
	//[someeditorlogicid, 300, 300]
];

A_client_var_bases_check_faction_bool = 0;
A_client_var_bases_check_trigger_area = 1;
A_client_var_bases_check_teleport_height = 2;
A_client_var_bases_check_teleport_marker = 3;
A_client_var_bases_check_teleport_message = 4;

A_client_var_bases_checks = [
//	["isins", "ins_area_1", 20, "telehesnotins", "You were teleported out of the Insurgent base!"],
//	["isopf", "opfor_area_1", 20, "telehesnottla", "You were teleported out of the TLA base!"],
	["isblu", "blufor_area_1", 20, "telehesnotcop", "You were teleported out of the Police base!"]
];

A_client_var_cached_gear = "";


if (isServer) exitwith {};

player addEventHandler ["fired", {_this call A_player_fnc_handle_fired}];
player addEventHandler ["HandleDamage", {_this call A_player_fnc_handle_damage}];

[] call A_client_fnc_loop_init;