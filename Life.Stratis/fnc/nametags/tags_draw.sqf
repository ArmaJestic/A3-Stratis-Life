// A_nametags_fnc_tags_draw

#include "..\..\includes\macro.h"
#include "..\..\constants.h"



//player groupChat format["A_nametags_fnc_tags_draw %1", _this];

private["_player", "_target", "_camera"];
_player = _this select 0;
_camera = [_player, "camera"] call A_object_fnc_getVariable;
_target = if (undefined(_camera)) then {nearCursorTarget} else {call A_camera_fnc_target};

private["_font"];
_font = "PuristaMedium";
_font_size = 0.025;

//player groupChat format["_target = %1", _target];
if (not([_player] call A_player_fnc_human)) exitWith {false};
if (undefined(_target)) exitWith {false};
if (typeName _target != "OBJECT") exitWith {false};
if (isNull _target) exitWith {false};

if (not(INV_shortcuts)) exitWith {false};

if (visibleMap) exitWith {false};


//don't draw tags while being inside a vehicle 
private["_inside_vehicle"];
_inside_vehicle = not((vehicle _player) == _player);
if (_inside_vehicle) exitWith {false};


//player groupChat format["_target = %1", _target];
private["_control"];
_control = call A_nametags_fnc_tags_control;

private["_distance", "_is_near", "_is_far"];;
_distance = if (undefined(_camera)) then {_player distance _target} else {_camera distance _target};

if (not(isNull _target) && {(_distance < 20)}) then {
	_player reveal _target;
};

if (_target isKindOf "Animal") then {
	[_target] call A_object_fnc_baptize;
};

if ([_target] call A_object_fnc_item && {(_distance < 5)} ) exitWith {
	if (_target == ([_player, "held_target", objNull] call A_object_fnc_getVariable)) exitWith {false};
	private["_label", "_icon"];
	_label = [_target, "label"] call A_object_fnc_getVariable;
	_icon = [_target, "icon"] call A_object_fnc_getVariable;
	private["_head_pos"];
	_head_pos = ([_target] call A_nametags_fnc_tags_position);
	//drawIcon3D ["", [0,1,0,1], _head_pos, 0,0, 0, _label, 2, _font_size, _font];
	_head_pos set [2, ((_head_pos select 2) + 0.15)];
	[_head_pos, [0.3, 0.14],"<t size=""1.2"" align=""center"" color=""#ffffffff"" >"+ _label + "</t><br />" + "<img  align=""center"" size=""4"" image=""" + _icon + """/><br />"] call A_hud_fnc_drawIcon3d__;

	true
};

drawicon3d_text_field ctrlShow false;




if (([_target] call A_object_fnc_atm) && _distance < 3) exitWith {
	private["_head_pos"];
	_head_pos = ([_target] call A_nametags_fnc_tags_position);
	
	drawIcon3D ["", [0,1,0,1], _head_pos, 0,0, 0, "ATM (E)", 2, _font_size, _font];
	true
};

if ([_target] call A_object_fnc_shop && _distance < 3) exitWith {
	private["_text"];
	if(([_player] call A_player_fnc_blufor) and _target in A_bank_var_drugsellarray) then { 
		_text = "Drug A_missions_fnc_search (E)";
	}
	else {
		private["_shop_name", "_action_key"];
		_action_key = if (_target in A_main_var_gangareas) then {"Scroll"} else {"E"};
		_shop_name = (_target call A_inventory_fnc_get_shop_array) select 1;
		_text = format["%1 (%2)", _shop_name, _action_key];
	};
	private["_head_pos"];
	_head_pos = ([_target] call A_nametags_fnc_tags_position);
	//player groupChat format["_head_pos = %1", _head_pos];
	
	drawIcon3D ["", [1,1,0,1], _head_pos, 0,0, 0, _text, 2, _font_size, _font];
	
	true
};

if ([_target] call A_object_fnc_vendor && _distance < 3) exitWith {
	private["_vendor_name", "_vendor_data", "_text", "_head_pos"];
	_A_inv_fnc_vendor_data = ([_target] call A_inv_fnc_vendor_data);
	if (undefined(_vendor_data)) exitWith {true};
	_A_inv_var_vendor_name = _vendor_data select A_inv_var_vendor_name;
	
	_head_pos = ([_target] call A_nametags_fnc_tags_position);
	
	drawIcon3D ["", [1,1,0,1], _head_pos, 0,0, 0, format["%1 (Scroll)", _vendor_name], 2, _font_size, _font];
	true
};


if ([_target] call A_nametags_fnc_tags_vehicle && _distance >= 5 && _distance < 25) exitWith {
	private["_owner", "_inside_vehicle", "_is_box"];	

	private["_text1", "_text2"];
	_text1 = "(" + ([_target] call A_nametags_fnc_tags_driver_string) + ")";
	_text2 = "(" + str(_target) + ")";

	
	private["_center_pos"];
	_center_pos = [_target] call A_nametags_fnc_tags_position;
	private["_sep"];
	_sep = 0.06 + _distance/50;
	
	drawIcon3D ["", [1,1,0,1], [(_center_pos select 0), (_center_pos select 1), ((_center_pos select 2) + 0.7)], 0,0, 0, _text1, 2, _font_size, _font];
	drawIcon3D ["", [1,1,0,1], [(_center_pos select 0), (_center_pos select 1), ((_center_pos select 2) + 0.7 + _sep)], 0,0, 0, _text2, 2, _font_size, _font];
	true
};


if ([_target] call A_nametags_fnc_tags_vehicle && _distance < 5) exitWith {
	private["_owner", "_inside_vehicle", "_is_box", "_is_boat"];
	_owner = ([player, _target] call A_vehicle_fnc_owner);
	_inside_vehicle = ([player, _target] call A_mounted_fnc_player_inside);

	if (_inside_vehicle) exitWith {false};
	
	_is_box = _target isKindOf "LocalBasicWeaponsBox";
		
	private["_text1", "_text2"];
	if (_owner && not((locked _target) == 2)) then {
		_text1 = "Trunk (T)";
		_text2 = "Enter (E)";
	}
	else { if (_owner && ((locked _target) == 2)) then {
		_text1 = "Trunk (T)";
		_text2 = "Unlock (Control+Space)";
	}
	else { if ( not(_owner) && not((locked _target) == 2)) then {
		_text1 = "(" + ([_target] call A_nametags_fnc_tags_driver_string) + ")";
		_text2 = "Enter (E)";
	}
	else { if (not(_owner) && (locked _target) == 2) then {
		_text1 = "(" + ([_target] call A_nametags_fnc_tags_driver_string) + ")";
		_text2 = "(" + str(_target) + ")";
	};};};};
	
	private["_center_pos"];
	_center_pos = [_target] call A_nametags_fnc_tags_position;
	private["_sep"];
	
	_sep = 0.06 + _distance/50;
	
	drawIcon3D ["", [1,1,0,1], [(_center_pos select 0), (_center_pos select 1), ((_center_pos select 2) + 0.7)], 0,0, 0, _text1, 2, _font_size, _font];
	drawIcon3D ["", [1,1,0,1], [(_center_pos select 0), (_center_pos select 1), ((_center_pos select 2) + 0.7 + _sep)], 0,0, 0, _text2, 2, _font_size, _font];

	true
};

if ([_target] call A_player_fnc_human &&  _distance < 25) exitWith {
	private["_text", "_color"];
	if ([_target, "has_admin_camera"] call A_player_fnc_get_bool) exitWith {false};

	if ([_target] call A_player_fnc_blufor) then{ 
		_text = format["%1 (%2)", _target, (name _target)];
		_color = [0.67,0.91,0.36,1];
	}
	else { if (([_target] call A_player_fnc_civilian) && ([_target] call A_player_fnc_get_bounty) > 0) then {
		_text = format["%1 (%2)", _target, (name _target)];
		_color = [1,0,0,1];
	}
	else {
		_text = format["%1 (%2)", _target, (name _target)];
		_color = [0.67,0.91,0.36,1];
	};};
	
	private["_head_pos"];
	_head_pos = ([_target] call A_nametags_fnc_tags_position);
	drawIcon3D ["", _color, _head_pos, 0,0, 0, _text, 2, _font_size, _font];
	
	true
};

false
