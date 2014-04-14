#include "macro.h"
#include "constants.h"

if (not(undefined(admin_menu_functions_defined))) exitWith {};


logAdmin = {
	ARGV(0,_text);
	if (undefined(_text)) exitWith {null};
	if (typeName _text != "STRING") exitWith {null};
	
	private["_player"];
	_player = player;
	
	_text = (format["ADMIN (%1, %2): ", (name _player), (getPlayerUID _player)] + _text + toString [13,10]);
	[_text] call logThis;
};

admin_actions_list = {
	([
		["------ Admin Commands ------", {}],
		["Camera (Toggle)", {
			[] call camera_toggle;
		}],
		["Carmagedon", {
			ARGV(2,_text);
			_distance = [(_text)] call parse_number;
			
			if (_distance <= 0) exitWith {null};
			
			player groupchat format["Starting Carmagedon at a range of %1 meters", _distance];
			
			{
				{		
					if ({alive _x} count crew _x == 0) then {
						deleteVehicle _x;
					};
				} foreach((getpos player) nearObjects [_x, _distance]);
			} forEach (INV_DroppableItems + ["LandVehicle", "Air", "Car", "Motorcycle", "Bicycle", "UAV", "Wreck", "Wreck_Base", 
						"HelicopterWreck", "UH1Wreck", "UH1_Base", "UH1H_base", "AH6_Base_EP1","CraterLong", "Ka60_Base_PMC", 
						"Ka137_Base_PMC", "A10"]);
		}],
		["Remove player weapons", {
			ARGV(0,_player);
			ARGV(1,_target);
			if (not([_target] call player_human)) exitWith {null};
			
			[format["removed %1-%2 (%3)'s weapons", _target, (name _target), (getPlayerUID _target)]] call logAdmin;
			
			format['
				[] spawn {
					liafu = true;
					if (player != %1) exitWith {null};
					[player] call player_reset_gear;
				};
			', _target] call broadcast;
		}],
		["Kill player", {
			ARGV(0,_player);
			ARGV(1,_target);
			if (not([_target] call player_human)) exitWith {null};
			
			[format["killed %1-%2 (%3)", _target, (name _target), (getPlayerUID _target)]] call logAdmin;
			
			format['
				[] spawn {
					liafu = true;
					if (player != %1) exitWith {null};
					(player) setDamage 1; 
				};
			', _target] call broadcast;
		}],
		["Destroy player vehicle", {
			ARGV(0,_player);
			ARGV(1,_target);
			if (not([_target] call player_human)) exitWith {null};
			
	
			[format["destroyed %1-%2 (%3)'s vehicle", _target, (name _target), (getPlayerUID _target)]] call logAdmin;
			
			format['
				[] spawn {
					liafu = true;
					if (player != %1) exitWith {null};
					(vehicle player) setDamage 1; 
				};
			', _target] call broadcast;
		}],
		["Wipe player stats", {
			ARGV(0,_player);
			ARGV(1,_target);
			if (not([_target] call player_human)) exitWith {null};

			[format["wiped %1-%2 (%3)'s stats", _target, (name _target), (getPlayerUID _target)]] call logAdmin;
			
			format['if (isServer) then {["%1"] call stats_server_wipe_player_data;};', _target] call broadcast;
			player groupChat format["Request to wipe %1's stats sent", (name _target)];
		}],
		["Reset time(40m dy, 20m nt)", {
			player groupChat "Time reset (40-min day, 20-min night), please wait for synchronization to complete";
			[40,20] call time_reset;
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
					if (_target isKindOf "Man" && not([_target] call object_shop)) then {
						[_target] call unitDelete;
					};
				};
			};
		}],
		["Teleport", {
			ARGV(0,_player);
			ARGV(1,_target);
			if (not(undefined(_target))) then {
				[_target] call interact_teleport_player;
			}
			else {
				[_player] call interact_teleport_player;
			};
		}],
		["Kick to lobby", {
			ARGV(0,_player);
			ARGV(1,_target);
			if (not([_target] call player_human)) exitWith {null};

			[format["kicked %1-%2 (%3) to lobby", _target, (name _target), (getPlayerUID _target)]] call logAdmin;
			format['[%1] call interact_kick_to_lobby;', _target] call broadcast;
			player groupChat format["%1-%2 was kicked to lobby", _target, (name _target)];
		}],
		["------ White / Black Lists ------", {}],
		["Cop Black List", {
			[player] call interact_cop_blacklist_menu;
		}],
		["BLANK", {}]
	])
};

admin_activate_command = { _this spawn {
	//player groupChat format["admin_activate_command %1", _this];
	ARGV(0,_player);
	ARGV(1,_command);
	ARGV(2,_text);
	ARGV(3,_target);
	
	if (not([_player] call player_human)) exitWith {null};
	
	if (undefined(_command)) exitWith {null};
	if (typeName _command != "STRING") exitWith {null};
	
	closeDialog 0;
	
	_text = if (undefined(_text)) then {""} else {_text};
	_text = if (typeName _text != "STRING") then {""} else {_text};
	
	private["_code"];
	_code = compile ( "_this call " + _command);
	[_player, _target, _text] spawn _code;
	sleep 1;
	hint "Code Activated";
	
};};

admin_menu_combo_focus = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [0.1,0.1,0.1,1];
};

admin_menu_combo_blur = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [1,1,1,0.08];
};


admin_menu_create = {
	ARGV(0,_player);
	
	if (not([_player] call player_exists)) exitWith {null};
	
	if (not(createDialog "admin_menu")) exitWith {
		player groupChat format["ERROR: cannot create admin menu dialog"];
	};
	
	//populate the list of player
	{
		private["_variable_name", "_variable_value"];
		_variable_name = _x;
		_variable_value = missionNamespace getVariable [_variable_name, null];
		
		if ([_variable_value] call player_exists) then {
			player groupChat format["_variable_value = %1", _variable_value];
			private["_index"];
			_index = lbAdd[admin_menu_player_field_idc, format["%1 - (%2)", _variable_value, (name _variable_value)]];
			lbSetData [admin_menu_player_field_idc, _index, _variable_value];
		};
	} forEach playerstringarray;
	
	lbSetCurSel [admin_menu_player_field_idc, 0];
	
	
	//populate the list of commands
	private["_actions"];
	_actions = call admin_actions_list;
	
	{
		private["_text", "_code", "_index"];
		_text = _x select 0;
		_code = _x select 1;
		_index = lbAdd [admin_menu_command_field_idc, _text];
		lbSetData [admin_menu_command_field_idc, _index, str(_code)];
	} forEach _actions;
	
	lbSetCurSel [admin_menu_command_field_idc, 0];
	

	buttonSetAction [admin_menu_execute_button_idc,  
				"["+str(_player)+"," +
				"(call interact_admin_menu_selected_action)," +
				"(call interact_admin_menu_input_text)," +
				"(call interact_admin_menu_selected_player)" +
				"] call admin_activate_command;"];
				
	[] call admin_menu_setup;
};

admin_menu_setup  = {
	disableSerialization;
	
	private["_display"];
	_display = uiNamespace getVariable "ADMIN_MENU";
	
	private["_header", "_background", 
			"_input_label", "_input_field",
			"_player_label", "_player_field",
			"_command_label", "_command_field",
			"_execute_button", 
			"_close_button"];
			
	 _player_label = _display displayCtrl admin_menu_player_label_idc;
	 _player_field = _display displayCtrl admin_menu_player_field_idc;
	 _command_label = _display displayCtrl admin_menu_command_label_idc;
	 _command_field = _display displayCtrl admin_menu_command_field_idc;
	 _input_label = _display displayCtrl admin_menu_input_label_idc;
	 _input_field = _display displayCtrl admin_menu_input_field_idc;
	 _execute_button = _display displayCtrl admin_menu_execute_button_idc;
	 _background = _display displayCtrl admin_menu_background_idc;
	 _header = _display displayCtrl admin_menu_header_idc;
	 _close_button = _display displayCtrl admin_menu_close_button_idc;
 
	private["_ysep", "_sep", "_x", "_y", "_w", "_h"];
	_title = "ADMIN MENU";
	_x = 0.14;
	_y = 0.14;
	_w = 0.65;
	_h = 0.3;
	_ysep = 0.003;
	_sep = 0.01;
	
	private["_button_font_height"];
	_button_font_height = MENU_TITLE_FONT_HEIGHT;
	
	//header
	private["_hx", "_hy", "_hw", "_hh"];
	_hx = _x;
	_hy = _y;
	_hw = _w;
	_hh = 0.045;
	
	_header ctrlSetPosition [_hx, _hy, _hw, _hh];
	_header ctrlSetFontHeight _button_font_height;
	_header ctrlSetText _title;
	_header ctrlSetFont "PuristaMedium";
	_header ctrlCommit 0;
	
	//close button
	private["_cx", "_cy", "_cw", "_ch"];
	_cw = 0.14;
	_ch = _hh;
	_cx = _x + _w - _cw;
	_cy = _y + _h - _ch;
	
	_close_button ctrlSetText "Close";
	_close_button ctrlSetPosition [_cx, _cy, _cw, _ch];
	buttonSetAction [(ctrlIDC _close_button), "closeDialog 0"];
	_close_button ctrlCommit 0;
	
	//background
	private["_bx", "_by", "_bw", "_bh"];
	_bx = _x;
	_by = _hy + _hh + _ysep;
	_bw = _w;
	_bh = (_cy ) - (_hy ) - _ch - _ysep - _ysep;
	
	_background ctrlSetPosition [_bx, _by, _bw, _bh];
	_background ctrlCommit 0;
	
	//execute button
	private["_ex", "_ey" ,"_ew", "_eh"];
	_ex = _hx;
	_ey = _by + _bh + _ysep;
	_ew = _cw * 1.2;
	_eh = _ch;
	
	_execute_button ctrlSetText "Execute";
	_execute_button ctrlSetPosition [_ex, _ey, _ew, _eh];
	_execute_button ctrlCommit 0;
	
	//input label
	private["_ilx", "_ily", "_ilh", "_ilw"];
	_ilx = _bx + _sep * 2;
	_ily = _by + _sep * 2;
	_ilw = _hh * 6.5;
	_ilh = 0.04;
	
	_input_label ctrlSetText "Command input: ";
	_input_label ctrlSetPosition [_ilx, _ily, _ilw, _ilh];
	_input_label ctrlSetFontHeight _button_font_height - 0.003;
	_input_label ctrlCommit 0;
	
	//input field
	private["_ifx", "_ify", "_ifw", "_ifh"];
	_ifx = _ilx + _ilw + _sep ;
	_ify = _ily;
	_ifw = _ilw;
	_ifh = _ilh;
	
	_input_field ctrlSetFontHeight _button_font_height - 0.003;;
	_input_field ctrlSetFont "PuristaMedium";
	_input_field ctrlSetPosition [_ifx, _ify, _ifw, _ifh];
	_input_field ctrlSetBackgroundColor [1,1,1,0.08];
	_input_field ctrlCommit 0;
	
	//player label
	private["_plx", "_ply", "_plh", "_plw"];
	_plx = _bx + _sep * 2;
	_ply = _ily + _ilh + _sep;
	_plw = _ilw;
	_plh = _ilh;
	
	_player_label ctrlSetText "Target player: ";
	_player_label ctrlSetPosition [_plx, _ply, _plw, _plh];
	_player_label ctrlSetFontHeight _button_font_height - 0.003;
	_player_label ctrlCommit 0;
	
	//player field
	private["_pfx", "_pfy", "_pfw", "_pfh"];
	_pfx = _plx + _plw + _sep ;
	_pfy = _ply;
	_pfw = _plw;
	_pfh = _plh;
	
	_player_field ctrlSetFontHeight _button_font_height - 0.003;;
	_player_field ctrlSetFont "PuristaMedium";
	_player_field ctrlSetPosition [_pfx, _pfy, _pfw, _pfh];
	_player_field ctrlSetBackgroundColor [1,1,1,0.08];
	_player_field ctrlCommit 0;
	
	_player_field ctrlAddEventHandler ["SetFocus", "(_this) call admin_menu_combo_focus"];
	_player_field ctrlAddEventHandler ["KillFocus", "(_this) call admin_menu_combo_blur"];
	
	
	//command label
	private["_plx", "_ply", "_plh", "_plw"];
	_clx = _bx + _sep * 2;
	_cly = _ply + _plh + _sep;
	_clw = _plw;
	_clh = _plh;
	
	_command_label ctrlSetText "Command: ";
	_command_label ctrlSetPosition [_clx, _cly, _clw, _clh];
	_command_label ctrlSetFontHeight _button_font_height - 0.003;
	_command_label ctrlCommit 0;
	
	
	//command field
	private["_pfx", "_pfy", "_pfw", "_pfh"];
	_cfx = _clx + _clw + _sep ;
	_cfy = _cly;
	_cfw = _clw;
	_cfh = _clh;
	
	_command_field ctrlSetFontHeight _button_font_height - 0.003;;
	_command_field ctrlSetFont "PuristaMedium";
	_command_field ctrlSetPosition [_cfx, _cfy, _cfw, _cfh];
	_command_field ctrlSetBackgroundColor [1,1,1,0.08];
	_command_field ctrlCommit 0;
	
	_command_field ctrlAddEventHandler ["SetFocus", "(_this) call admin_menu_combo_focus"];
	_command_field ctrlAddEventHandler ["KillFocus", "(_this) call admin_menu_combo_blur"];
};

admin_menu_functions_defined = true;