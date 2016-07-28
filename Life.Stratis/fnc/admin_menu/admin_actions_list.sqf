// A_admin_menu_fnc_admin_actions_list

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


([
	["------ Admin Commands ------", {}],
	["Camera (Toggle)", {
		[] call A_camera_fnc_toggle;
	}],
	["Carmagedon", {
		ARGV(2,_text);
		_distance = [(_text)] call A_misc_fnc_parse_number;
		
		if (_distance <= 0) exitWith {null};
		
		player groupchat format["Starting Carmagedon at a range of %1 meters", _distance];
		
		{
			{		
				if ({alive _x} count crew _x == 0) then {
					deleteVehicle _x;
				};
			} foreach((getpos player) nearObjects [_x, _distance]);
		} forEach (A_main_var_inv_droppableitems + ["LandVehicle", "Air", "Car", "Motorcycle", "Bicycle", "UAV", "Wreck", "Wreck_Base", 
					"HelicopterWreck", "UH1Wreck", "UH1_Base", "UH1H_base", "AH6_Base_EP1","CraterLong", "Ka60_Base_PMC", 
					"Ka137_Base_PMC", "A10"]);
	}],
	["Remove player weapons", {
		ARGV(0,_player);
		ARGV(1,_target);
		if (not([_target] call A_player_fnc_human)) exitWith {null};
		
		[format["removed %1-%2 (%3)'s weapons", _target, (name _target), (getPlayerUID _target)]] call A_admin_menu_fnc_logAdmin;
		
		format['
			[] spawn {
				liafu = true;
				if (player != %1) exitWith {null};
				[player] call A_player_fnc_reset_gear;
			};
		', _target] call A_broadcast_fnc_broadcast;
	}],
	["Kill player", {
		ARGV(0,_player);
		ARGV(1,_target);
		if (not([_target] call A_player_fnc_human)) exitWith {null};
		
		[format["killed %1-%2 (%3)", _target, (name _target), (getPlayerUID _target)]] call A_admin_menu_fnc_logAdmin;
		
		format['
			[] spawn {
				liafu = true;
				if (player != %1) exitWith {null};
				(player) setDamage 1; 
			};
		', _target] call A_broadcast_fnc_broadcast;
	}],
	["Destroy player vehicle", {
		ARGV(0,_player);
		ARGV(1,_target);
		if (not([_target] call A_player_fnc_human)) exitWith {null};
		

		[format["destroyed %1-%2 (%3)'s vehicle", _target, (name _target), (getPlayerUID _target)]] call A_admin_menu_fnc_logAdmin;
		
		format['
			[] spawn {
				liafu = true;
				if (player != %1) exitWith {null};
				(vehicle player) setDamage 1; 
			};
		', _target] call A_broadcast_fnc_broadcast;
	}],
	["Wipe player stats", {
		ARGV(0,_player);
		ARGV(1,_target);
		if (not([_target] call A_player_fnc_human)) exitWith {null};

		[format["wiped %1-%2 (%3)'s stats", _target, (name _target), (getPlayerUID _target)]] call A_admin_menu_fnc_logAdmin;
		
		format['if (isServer) then {["%1"] call A_stats_fnc_server_wipe_player_data;};', _target] call A_broadcast_fnc_broadcast;
		player groupChat format["Request to wipe %1's stats sent", (name _target)];
	}],
	["Reset time(40m dy, 20m nt)", {
		player groupChat "Time reset (40-min day, 20-min night), please wait for synchronization to complete";
		[40,20] call A_time_functions_fnc_reset;
	}],
	["MOTD (use input field)", {
		custom_motd = _inputText;
		publicVariable "custom_motd";
	}],
	["Delete Target (Man)", {
		private["_target"];
		_target = cursorTarget;
		if (not(undefined(_target))) then {
			if (typeName _target == "OBJECT") then {
				if (_target isKindOf "Man" && not([_target] call A_object_fnc_shop)) then {
					[_target] call A_bis_expected_fnc_unitDelete;
				};
			};
		};
	}],
	["Teleport", {
		ARGV(0,_player);
		ARGV(1,_target);
		if (not(undefined(_target))) then {
			[_target] call A_interaction_fnc_teleport_player;
		}
		else {
			[_player] call A_interaction_fnc_teleport_player;
		};
	}],
	["Kick to lobby", {
		ARGV(0,_player);
		ARGV(1,_target);
		if (not([_target] call A_player_fnc_human)) exitWith {null};

		[format["kicked %1-%2 (%3) to lobby", _target, (name _target), (getPlayerUID _target)]] call A_admin_menu_fnc_logAdmin;
		format['[%1] call A_interaction_fnc_kick_to_lobby;', _target] call A_broadcast_fnc_broadcast;
		player groupChat format["%1-%2 was kicked to lobby", _target, (name _target)];
	}],
	["------ White / Black Lists ------", {}],
	["Cop Black List", {
		[player] call A_interaction_fnc_cop_blacklist_menu;
	}],
	["BLANK", {}]
])
