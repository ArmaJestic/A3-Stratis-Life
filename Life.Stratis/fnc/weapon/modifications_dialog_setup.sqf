// A_weapon_fnc_modifications_dialog_setup

#include "../../includes/macro.h"
#include "../../includes/constants.h"


//player groupChat format["A_weapon_fnc_modifications_dialog_setup %1", _this];
ARGV(0,_player);


private["_weapon_id"];
_weapon_id = [_player] call A_player_fnc_get_first_weapon;


private["_weapon_name"];
_weapon_name = [_weapon_id] call A_weapon_fnc_display_name;
_weapon_name = if (undefined(_weapon_name)) then {""} else {_weapon_name};

private["_weapon_picture_path"];
_A_weapon_fnc_picture_path = [_weapon_id] call A_weapon_fnc_picture_path;

private["_dialog_title"];
_dialog_title = if (_weapon_name == "") then {"Weapon Mofifications"} else {format["%1 Modifications", _weapon_name]};


private["_x", "_y"];
_x = (safezoneX + 0.5 * safezoneW);
_y = (safezoneY + 0.5 * safezoneH);

_display = (uiNamespace getVariable 'WEAPON_MODS');
_mainFrame_control = _display displayCtrl weaponModifications_mainFrame_idc;
_mainBackground_control = _display displayCtrl weaponModifications_mainBackground_idc;

_weaponPicture_control = _display displayCtrl weaponModifications_weaponPicture_idc;
_weaponMuzzle_control = _display displayCtrl weaponModifications_muzzleCombo_idc;
_weaponTop_control = _display displayCtrl weaponModifications_topRailCombo_idc;
_weaponSide_control = _display displayCtrl weaponModifications_sideRailCombo_idc;

//player groupChat format["_weaponMuzzle_control = %1", _weaponMuzzle_control];
_mainFrame_control ctrlSetText _dialog_title;

private["_w", "_h", "_fontHeight"];
_xoff = 0.1; _yoff = -0.7; _ysep = 0.02;

//main background (m)
_mx = _x + _xoff; _my = _y + _yoff;
_mw = 0.7; _mh = 0.45;  

//weapon picture (w)
_wx = _mx + 5 * _ysep; _wy = _my +_ysep;
_ww = _mw - 10* _ysep; _wh = _ww * 0.6;

//muzzle rail (mr)
_mrx = _mx + _ysep; _mry = _wy + _wh + 3 * _ysep;
_mrw = (_mw - (4 * _ysep)) / 3; _mrh = 0.035;

//top rail
_trx = _mrx + _mrw + _ysep; _try = _mry;
_trw = _mrw; _trh = _mrh;

//side rail
_srx = _trx + _trw + _ysep; _sry = _mry;
_srw = _mrw; _srh = _mrh;

_fontHeight = 0.031;

_mainFrame_control ctrlSetFontHeight _fontHeight;
_mainFrame_control ctrlSetPosition [_mx, _my,  _mw, _mh];
_mainBackground_control ctrlSetPosition [_mx, _my,  _mw, _mh];
_weaponMuzzle_control ctrlSetPosition [_mrx, _mry, _mrw, _mrh];
_weaponTop_control ctrlSetPosition [_trx, _try, _trw, _trh];
_weaponSide_control ctrlSetPosition [_srx, _sry, _srw, _srh];

_weaponPicture_control ctrlSetPosition [ _wx, _wy, _ww, _wh];
_weaponPicture_control ctrlSetText _weapon_picture_path;

_weaponSide_control ctrlSetFontHeight _fontHeight;
_weaponTop_control ctrlSetFontHeight _fontHeight;
_weaponMuzzle_control ctrlSetFontHeight _fontHeight;

_comboAddAttachments = {
	ARGV(0,_control);
	ARGV(1,_attachments);
	ARGV(2,_active_attachments);
	ARGV(3,_inventory_items);
		
	_attachments = [""] + _attachments;
	
	private["_selected"];
	_selected = 0;
	
	{
		private["_id", "_name", "_picture"];
		_id = _x;
		_name = if (_id == "") then {"(Empty)"} else {[_id] call A_weapon_fnc_display_name};
		_picture = if (_id == "") then {""} else {[_id] call A_weapon_fnc_picture_path};

		private["_available"];
		_available = if (toLower(_id) in _inventory_items) then {1} else {0};
		
	
		_name = if (_available == 1) then {format[" + %1 ", _name]} else {format["  %1 ", _name]};
		_available = if (_id == "") then {1} else {_available};
	
		private["_index"];
		_index = _control lbAdd _name;
		_control lbSetData [_index, _id];
		_control lbSetPicture [_index, _picture];
		_control lbSetValue [_index, _available];
		
		_selected = if (toLower(_id) in _active_attachments) then { _index } else {_selected};
	} forEach _attachments;
	
	_control lbSetCurSel _selected;
};

_top_rail_attachments = [_weapon_id] call A_weapon_fnc_compatible_top_rail;
_side_rail_attachments = [_weapon_id] call A_weapon_fnc_compatible_side_rail;
_muzzle_attachments = [_weapon_id] call A_weapon_fnc_compatible_muzzle;

private["_all_items"];
_all_items = [_player] call A_player_fnc_get_all_items;

private["_weapon_items"];
_weapon_items = [_player, _weapon_id] call A_player_fnc_weapon_attachments;

[_weaponMuzzle_control, _muzzle_attachments, _weapon_items, _all_items] call _comboAddAttachments;
[_weaponSide_control, _side_rail_attachments, _weapon_items, _all_items] call _comboAddAttachments;
[_weaponTop_control, _top_rail_attachments, _weapon_items, _all_items] call _comboAddAttachments;

_weaponTop_control ctrlAddEventHandler ["LBSelChanged", "(_this + [A_weapon_var_slot_top_rail]) call A_weapon_fnc_slot_label_changed"];
_weaponSide_control ctrlAddEventHandler ["LBSelChanged", "(_this + [A_weapon_var_slot_side_rail]) call A_weapon_fnc_slot_label_changed"];
_weaponMuzzle_control ctrlAddEventHandler ["LBSelChanged", "(_this + [A_weapon_var_slot_muzzle]) call A_weapon_fnc_slot_label_changed"];

_mainFrame_control ctrlCommit 0;
_mainBackground_control ctrlCommit 0;
_weaponPicture_control ctrlCommit 0;
_weaponMuzzle_control ctrlCommit 0;
_weaponTop_control ctrlCommit 0;
_weaponSide_control ctrlCommit 0;
