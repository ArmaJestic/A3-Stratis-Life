// A_client_fnc_loop

#include "..\..\includes\macro.h"


private ["_client_loop_i"];
_client_loop_i = 0; 

while {_client_loop_i < 5000} do {
	call A_client_fnc_check_gear;
	call A_client_fnc_check_money;
	call A_client_fnc_check_bank;
	call A_client_fnc_check_actions;
	call A_client_fnc_check_factory_actions;
	call A_client_fnc_check_license_actions;
	call A_client_fnc_check_gang_area_actions;
	call A_client_fnc_check_lotto_actions;
	call A_client_fnc_check_prison_actions;
	call A_client_fnc_check_inventory;
	call A_client_fnc_cop_stun_gun_modify;
	call A_client_fnc_check_workplaces;
	call A_client_fnc_check_base_items;
	call A_client_fnc_check_logics;
	call A_client_fnc_check_camera;
	call A_client_fnc_check_bases;
	call A_client_fnc_check_static_weapons;
	call A_client_fnc_check_respawn_time;
	call A_client_fnc_check_smoke_grenade;
	call A_client_fnc_check_drag_actions;
	call A_client_fnc_check_restrains;
	call A_client_fnc_check_house;
	call A_client_fnc_check_bunker;
	call A_client_fnc_check_input;
	call A_client_fnc_check_near_objects;
	call A_client_fnc_check_vehicle_outside_actions;
	call A_client_fnc_check_player_actions;
	call A_client_fnc_check_plant_actions;
	//call A_client_fnc_check_towing;
	//call A_client_fnc_check_towed;
	sleep 0.5;
	
	_client_loop_i = _client_loop_i + 1;
};
[] spawn A_client_fnc_loop;
