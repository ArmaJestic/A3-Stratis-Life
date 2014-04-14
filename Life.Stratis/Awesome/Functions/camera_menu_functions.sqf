#include "macro.h"
#include "constants.h"

if (not(undefined(camera_menu_functions_defined))) exitWith {};



camera_set_offset_heading = {
	ARGV(0,_object);
	ARGV(1,_offset);
	ARGV(2,_heading);
	
	[_object, _offset, _heading] call camera_fake_setPos;
	[_object, "offset", _offset] call object_setVariable;
	[_object, "heading", _heading] call object_setVariable;
};


#define HEADING_OP_SET 0
#define HEADING_OP_ADD 1
#define HEADING_AXIS_DIRECTION 0
#define HEADING_AXIS_ANGLE 1
#define HEADING_AXIS_PITCH 2

camera_modify_heading = {
	ARGV(0,_object);
	ARGV(1,_axis);
	ARGV(2,_operation);
	ARGV(3,_value);
	
	private["_heading", "_offset"];
	_heading = [_object, "heading", [(getDir _object),0,0]] call object_getVariable;
	_offset = [_object, "offset", (_object modelToWorld [0,0,0])] call object_getVariable;
	
	if (_operation == HEADING_OP_ADD) then {
		_heading set [_axis, ((_heading select _axis) + _value)];
	}
	else {
		_heading set [_axis, _value];
	};
	
	[_object, _offset, _heading] call camera_set_offset_heading;
};


#define OFFSET_OP_SET 0
#define OFFSET_OP_ADD 1
#define OFFSET_AXIS_X 0
#define OFFSET_AXIS_Y 1
#define OFFSET_AXIS_Z 2

camera_modify_offset = {
	ARGV(0,_object);
	ARGV(1,_axis);
	ARGV(2,_operation);
	ARGV(3,_value);
	
	private["_heading", "_offset"];
	_heading = [_object, "heading", [(getDir _object),0,0]] call object_getVariable;
	_offset = [_object, "offset", (_object modelToWorld [0,0,0])] call object_getVariable;
	
	if (_operation == OFFSET_OP_ADD) then {
		_offset set [_axis, ((_offset select _axis) + _value)];
	}
	else {
		_offset set [_axis, _value];
	};
	
	[_object, _offset, _heading] call camera_set_offset_heading;
};

camera_clipboard_objectFromNetId = {
	private["_netId"];
	_netId = camera_clipboard;
	private["_source"];
	_source = objectFromNetId _netId;
	if (isNil "_source" || {typeName _source != "OBJECT" || {isNull _source}}) exitWith {
		player groupChat format["Could not valid a valid object for netId(%1)", _netId];
		objNull
	};
	_source
};


camera_actions_list = {
	([
		["------ Editor Commands ------", {}],
		["Set Object Name", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			[_object, "name", _text, true] call object_setVariable;
			_object setVehicleVarname _text;
			missionNamespace setVariable [_text, _object];
		}],
		["Clone object", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			
			private["_class", "_nobject"];
			_class = typeOf _object;
			_nobject = createVehicle [_class, getPosASL _object, [], 0, "CAN_COLLIDE"];
			_nobject setPosASL getPosASL _object;
		
		
			private["_attached", "_simulation", "_hidden", "_damage"];
			_simulation = simulationEnabled _object;
			_attached = [_object, "attached", false] call object_getVariable;
			_damage = [_object, "damage", true] call object_getVariable;
			_hidden = [_object, "hidden", false] call object_getVariable;
			
			_nobject enableSimulation _simulation;
			_nobject setVariable ["damage", _damage, true];
			_nobject allowDamage _damage;
			_nobject setVariable ["attached", _attached, true];
			_nobject setVariable ["hidden", _hidden, true];
			_nobject setVariable ["tracked", true, true];
			
			private["_o", "_h"];
			
			_o = [_object, "offset", [0,0,0]] call object_getVariable;
			_h = [_object, "heading", [0,0,0]] call object_getVariable;
			[_nobject, [(_o select 0), (_o select 1), (_o select 2)], [(_h select 0), (_h select 1), (_h select 2)]] call camera_set_offset_heading;
		}],
		["Copy netId to clipboard", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			
			private["_netid"];
			_netId = netId _object;
			player groupChat format["netId = %1", _netId];
			camera_clipboard = _netId;
			
		}],
		["Set offset and heading from netId", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			
			private["_source", "_o", "_h"];
			_source = call camera_clipboard_objectFromNetId;
			_o = [_source, "offset", [0,0,0]] call object_getVariable;
			_h = [_source, "heading", [0,0,0]] call object_getVariable;
			[_object, [(_o select 0), (_o select 1), (_o select 2)], [(_h select 0), (_h select 1), (_h select 2)]] call camera_set_offset_heading;
		}],
		["Set heading from netId (clipboard)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			
			private["_source"];
			_source = call camera_clipboard_objectFromNetId;

			private["_heading", "_offset"];
			_heading = [_source, "heading", [(getDir _object),0,0]] call object_getVariable;
			_offset = [_object, "offset", (_object modelToWorld [0,0,0])] call object_getVariable;
			
			private["_nheading"];
			_nheading = [(_heading select 0), (_heading select 1), (_heading select 2)];
			
			[_object, _offset, _nheading] call camera_set_offset_heading;
		}],
		["Set offset from netId (Z axis)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			
			private["_source", "_offset", "_coffset"];
			_source = call camera_clipboard_objectFromNetId;
			_coffset = [_object, "offset", [0,0,0]] call object_getVariable;
			_offset = [_source, "offset", [0,0,(_coffset select 2)]] call object_getVariable;
			[_object, OFFSET_AXIS_Z, OFFSET_OP_SET,(_offset select 2)] call camera_modify_offset;
		}],
		["Add to object heading (direction)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			[_object, HEADING_AXIS_DIRECTION, HEADING_OP_ADD, ([_text] call parse_number)] call camera_modify_heading;
		}],
		["Add to object heading (angle)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			[_object, HEADING_AXIS_ANGLE, HEADING_OP_ADD, ([_text] call parse_number)] call camera_modify_heading;
		}],
		["Add to object heading (pitch)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			[_object, HEADING_AXIS_PITCH, HEADING_OP_ADD, ([_text] call parse_number)] call camera_modify_heading;
		}],
		["Set object heading (direction)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			[_object, HEADING_AXIS_DIRECTION, HEADING_OP_SET, ([_text] call parse_number)] call camera_modify_heading;
		}],
		["Set object heading (angle)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			[_object, HEADING_AXIS_ANGLE, HEADING_OP_SET, ([_text] call parse_number)] call camera_modify_heading;
		}],
		["Set object heading (pitch)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			[_object, HEADING_AXIS_PITCH, HEADING_OP_SET,([_text] call parse_number)] call camera_modify_heading;
		}],
		["Add to offset (Z axis)", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			[_object, OFFSET_AXIS_Z, OFFSET_OP_ADD,([_text] call parse_number)] call camera_modify_offset;
		}],
		["Toggle Attached", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			private["_attached"];
			_attached = _object getVariable ["attached", false];
			player groupChat format["_attached = %1", _attached];
			_attached = not(_attached);
			_object setVariable ["attached", _attached, true];
			player groupChat format["_object = %1, _attached = %2",_object, (_object getVariable "offset")];
		}],
		["Delete Object", {
			ARGV(0,_player);
			ARGV(1,_object);
			ARGV(2,_text);
			deleteVehicle _object;
		}]
	])
};


camera_activate_command = { _this spawn {
	//player groupChat format["camera_activate_command %1", _this];
	ARGV(0,_player);
	ARGV(1,_command);
	ARGV(2,_text);
	ARGV(3,_target);
	

	if (not([_player] call object_exists)) exitWith {null};
	
	player groupChat format["_command = %1", _command];
	if (undefined(_command)) exitWith {null};
	if (typeName _command != "STRING") exitWith {null};
	
	closeDialog 0;
	
	
	_text = if (undefined(_text)) then {""} else {_text};
	_text = if (typeName _text != "STRING") then {""} else {_text};
	
	
	private["_code"];
	_code = compile ( "_this call " + _command);
	diag_log format["%1", _command];
	[_player, _target, _text] spawn _code;
	sleep 1;
	hint "Code Activated";
	
};};


camera_menu_combo_focus = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [0.1,0.1,0.1,1];
};

camera_menu_combo_blur = {
	ARGV(0,_control);
	_control ctrlSetBackgroundColor [1,1,1,0.08];
};


camera_menu_create = {
	ARGV(0,_player);
	ARGV(1,_objects);
	
	if (not([_player] call player_exists)) exitWith {null};
	
	if (not(createDialog "camera_menu")) exitWith {
		player groupChat format["ERROR: cannot create camera menu dialog"];
	};
	
	//populate the object list
	{
		private["_object", "_object_netid"];
		_object = _x;
		_object_netid = netId _object;
		
		private["_index"];
		_index = lbAdd[camera_menu_object_field_idc, format["%1", _object]];
		lbSetData [camera_menu_object_field_idc, _index, _object_netid];
	} forEach _objects;
	
	lbSetCurSel [camera_menu_object_field_idc, 0];
	
	
	
	//populate the list of commands
	private["_actions"];
	_actions = call camera_actions_list;
	
	{
		private["_text", "_code", "_index"];
		_text = _x select 0;
		_code = _x select 1;
		_index = lbAdd [camera_menu_command_field_idc, _text];
		lbSetData [camera_menu_command_field_idc, _index, str(_code)];
	} forEach _actions;
	
	lbSetCurSel [camera_menu_command_field_idc, 0];
	buttonSetAction [camera_menu_execute_button_idc, 
		('[' + str(_player) + ', ' +
		'(call camera_menu_action), ' +
		'(call camera_menu_input_text), ' +
		'(call camera_menu_selected_object)] call camera_activate_command;')];
	[] call camera_menu_setup;
};


camera_menu_action = {
	(lbData[camera_menu_command_field_idc, lbCurSel camera_menu_command_field_idc])
};


camera_menu_input_text = {
	(ctrlText camera_menu_input_field_idc)
};

camera_menu_selected_object = {
	private["_object", "_object_netid"];
	_object_netid = (lbData [camera_menu_object_field_idc, lbCurSel camera_menu_object_field_idc]);
	if (undefined(_object_netid)) exitWith {objNull};
	if (typeName _object_netid != "STRING") exitWith {objNull};
	_object = objectFromNetId(_object_netid);
	_object
};

camera_menu_setup  = {
	disableSerialization;
	
	private["_display"];
	_display = uiNamespace getVariable "CAMERA_MENU";
	player groupChat format["_display = %1", _display];
	
	private["_header", "_background", 
			"_input_label", "_input_field",
			"_object_label", "_object_field",
			"_command_label", "_command_field",
			"_execute_button", 
			"_close_button"];
			
	 _object_label = _display displayCtrl camera_menu_object_label_idc;
	 _object_field = _display displayCtrl camera_menu_object_field_idc;
	 _command_label = _display displayCtrl camera_menu_command_label_idc;
	 _command_field = _display displayCtrl camera_menu_command_field_idc;
	 _input_label = _display displayCtrl camera_menu_input_label_idc;
	 _input_field = _display displayCtrl camera_menu_input_field_idc;
	 _execute_button = _display displayCtrl camera_menu_execute_button_idc;
	 _background = _display displayCtrl camera_menu_background_idc;
	 _header = _display displayCtrl camera_menu_header_idc;
	 _close_button = _display displayCtrl camera_menu_close_button_idc;
 
	private["_ysep", "_sep", "_x", "_y", "_w", "_h"];
	_title = "CAMERA MENU";
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
	
	//object label
	private["_olx", "_oly", "_olh", "_olw"];
	_olx = _bx + _sep * 2;
	_oly = _ily + _ilh + _sep;
	_olw = _ilw;
	_olh = _ilh;
	
	_object_label ctrlSetText "Target object: ";
	_object_label ctrlSetPosition [_olx, _oly, _olw, _olh];
	_object_label ctrlSetFontHeight _button_font_height - 0.003;
	_object_label ctrlCommit 0;
	
	//object field
	private["_ofx", "_ofy", "_ofw", "_ofh"];
	_ofx = _olx + _olw + _sep ;
	_ofy = _oly;
	_ofw = _olw;
	_ofh = _olh;
	
	_object_field ctrlSetFontHeight _button_font_height - 0.003;;
	_object_field ctrlSetFont "PuristaMedium";
	_object_field ctrlSetPosition [_ofx, _ofy, _ofw, _ofh];
	_object_field ctrlSetBackgroundColor [1,1,1,0.08];
	_object_field ctrlCommit 0;
	
	_object_field ctrlAddEventHandler ["SetFocus", "(_this) call camera_menu_combo_focus"];
	_object_field ctrlAddEventHandler ["KillFocus", "(_this) call camera_menu_combo_blur"];
	
	//command label
	private["_clx", "_cly", "_clh", "_clw"];
	_clx = _bx + _sep * 2;
	_cly = _oly + _olh + _sep;
	_clw = _olw;
	_clh = _olh;
	
	_command_label ctrlSetText "Command: ";
	_command_label ctrlSetPosition [_clx, _cly, _clw, _clh];
	_command_label ctrlSetFontHeight _button_font_height - 0.003;
	_command_label ctrlCommit 0;
	
	//command field
	private["_cfx", "_cfy", "_cfw", "_cfh"];
	_cfx = _clx + _clw + _sep ;
	_cfy = _cly;
	_cfw = _clw;
	_cfh = _clh;
	
	_command_field ctrlSetFontHeight _button_font_height - 0.003;;
	_command_field ctrlSetFont "PuristaMedium";
	_command_field ctrlSetPosition [_cfx, _cfy, _cfw, _cfh];
	_command_field ctrlSetBackgroundColor [1,1,1,0.08];
	_command_field ctrlCommit 0;
	
	_command_field ctrlAddEventHandler ["SetFocus", "(_this) call camera_menu_combo_focus"];
	_command_field ctrlAddEventHandler ["KillFocus", "(_this) call camera_menu_combo_blur"];
};



camera_menu_functions_defined = true;