#include "macro.h"
#include "constants.h"

if (not(undefined(weapon_functions_defined))) exitWith {null};



weapon_compatible_with_attachment = {
	ARGV(0,_weapon_id);
	ARGV(1,_item_id);
	
	if (undefined(_weapon_id)) exitWith {false};
	if (typeName _weapon_id != "STRING") exitWith {false};
	if (_weapon_id == "") exitWith {false};
	if (undefined(_item_id)) exitWith {false};
	if (typeName _item_id != "STRING") exitWith {false};
	if (_item_id == "") exitWith {false};
	
	private["_compatible"];
	_compatible = [_weapon_id] call weapon_compatible_attachments;
	_compatible = (_compatible select weapon_slot_side_rail) + 
				(_compatible select weapon_slot_top_rail) + 
				(_compatible select weapon_slot_muzzle); 
	
	(toLower(_item_id) in _compatible)
};

weapon_compatible_attachments = {
	ARGV(0,_weapon_id);
	
	private["_default"];
	_default = [[],[],[]];
	
	if (undefined(_weapon_id)) exitWith {_default};
	if (typeName _weapon_id != "STRING") exitWith {_default};
	if (_weapon_id == "") exitWith {_default};

	private["_list", "_comaptible_side_rail", "_comaptible_top_rail", "_compatible_muzzle"];
	_comaptible_side_rail = [_weapon_id, "PointerSlot"] call weapon_compatible_slot_attachments;
	_comaptible_top_rail = [_weapon_id, "CowsSlot"] call weapon_compatible_slot_attachments;
	_compatible_muzzle = [_weapon_id, "MuzzleSlot"] call weapon_compatible_slot_attachments;
	
	private["_result"];
	_result = [];
	_result set [weapon_slot_side_rail, _comaptible_side_rail];
	_result set [weapon_slot_top_rail, _comaptible_top_rail];
	_result set [weapon_slot_muzzle, _compatible_muzzle];
	(_result)
};


weapon_attachments_base = {
	ARGV(0,_weapon_id);
	if (undefined(_weapon_id)) exitWith {""};
	if (typeName _weapon_id != "STRING") exitWith {""};
	
	private["_config"];
	_config = (configFile >> "CfgWeapons" >> _weapon_id);
	
	if (not(isClass(_config))) exitWith {""};

	if (isClass(_config >> "LinkedItems")) exitWith {
		([configName(inheritsFrom(_config))] call weapon_attachments_base)
	};
	
	(_weapon_id)
};

weapon_display_name = {
	ARGV(0,_weapon_id);
	if (undefined(_weapon_id)) exitWith {""};
	if (typeName "_weapon_id" != "STRING") exitWith {""};
	if (_weapon_id == "") exitWith {""};
	if (not(isClass(configFile >> "CfgWeapons" >> _weapon_id))) exitWith {""};
	
	(getText(configFile >> "CfgWeapons" >> _weapon_id >> "displayName"))
};

weapon_picture_path = {
	ARGV(0,_weapon_id);
	if (undefined(_weapon_id)) exitWith {""};
	if (typeName "_weapon_id" != "STRING") exitWith {""};
	if (_weapon_id == "") exitWith {""};
	
	if (not(isClass(configFile >> "CfgWeapons" >> _weapon_id))) exitWith {""};
	(getText(configFile >> "CfgWeapons" >> _weapon_id >> "picture"))
};




weapon_attachment_id = 0;
weapon_attachment_name = 1;
weapon_attachment_picture = 2;

weapon_slot_muzzle = 0;
weapon_slot_side_rail = 1;
weapon_slot_top_rail = 2;

weapon_compatible_slot_attachments = {
	ARGV(0,_weapon_id);
	ARGV(1,_slot);
	if (undefined(_weapon_id)) exitWith {[]};
	if (typeName "_weapon_id" != "STRING") exitWith {[]};
	if (_weapon_id == "") exitWith {null};
	
	if (undefined(_slot)) exitWith {[]};
	if (typeName _slot != "STRING") exitWith {[]};
	if (not(_slot in ["CowsSlot", "MuzzleSlot", "PointerSlot"])) exitWith {[]};
	
	private["_slot_ids", "_slot_data"];
	if (not(isClass(configFile >> "CfgWeapons" >> _weapon_id))) exitWith {[]};
	_slot_ids = (getArray(configFile >> "CfgWeapons" >> _weapon_id >> "WeaponSlotsInfo" >> _slot >> "compatibleItems"));
	
	([_slot_ids] call toLowerArray)
};

weapon_compatible_top_rail = {
	ARGV(0,_weapon_id);
	([_weapon_id, "CowsSlot"] call weapon_compatible_slot_attachments) 
};

weapon_compatible_side_rail = {
	ARGV(0,_weapon_id);
	([_weapon_id, "PointerSlot"] call weapon_compatible_slot_attachments) 
};

weapon_compatible_muzzle = {
	ARGV(0,_weapon_id);
	([_weapon_id, "MuzzleSlot"] call weapon_compatible_slot_attachments) 
};


player_swap_weapon_items = {
	ARGV(0,_player);
	ARGV(1,_weapon_id);
	ARGV(2,_attached_item_id);
	ARGV(3,_inventory_item_id);
	
	if (not([_player] call player_human)) exitWith {null};
	if (undefined(_weapon_id)) exitWith {null};
	if (typeName _weapon_id != "STRING") exitWith {null};
	if (undefined(_attached_item_id)) exitWith {null};
	if (typeName _attached_item_id != "STRING") exitWith {null};
	if (undefined(_inventory_item_id)) exitWith {null};
	if (typeName _inventory_item_id != "STRING") exitWith {null};
	
	private["_floorDropNotification"];
	_floorDropNotification = {
		private["_name"];
		ARGV(0,_item_id);
		_name = [_item_id] call weapon_display_name;
		player groupChat format["Attachment ""%1"" did not fit in your inventory. It was placed on the ground.", _name];
	};
	
	//adding attachment to empty weapon slot
	if (_attached_item_id == "" && _inventory_item_id != "") exitWith {
		_player removeItem _inventory_item_id;
		[_player, _weapon_id, _inventory_item_id] call player_add_weapon_item;
	};
	
	//removing attachment from weapon
	if (_attached_item_id != "" && _inventory_item_id == "") exitWith {
		if (not([_player, _attached_item_id] call player_add_item)) then {
			[_attached_item_id] call _floorDropNotification;
		};
		[_player, _weapon_id, _attached_item_id] call player_remove_weapon_item;
	};
	
	//no-op
	if (_attached_item_id == "" && _inventory_item_id == "") exitWith {null};
	
	//actual swapping 
	if (_attached_item_id != "" && _inventory_item_id != "") exitWith {
		[_player, _weapon_id, _attached_item_id] call player_remove_weapon_item;
		_player removeItem _inventory_item_id;
		
		[_player, _weapon_id, _inventory_item_id] call player_add_weapon_item;
		if (not([_player, _attached_item_id] call player_add_item)) then {
			[_attached_item_id] call _floorDropNotification;
		};
	};	
};


weapon_slot_label_changed = {
	//player groupChat format["weapon_muzzle_label_changed %1", _this];
	
	private["_player"];
	_player = player;

	ARGV(0,_control);
	ARGV(1,_index);
	ARGV(2,_slot_id);
	
	private["_item_id"];
	
	_item_id = _control lbData _index;
	_available = _control lbValue _index;
	
	if (_available == 0 ) exitWith {
		private["_item_name"];
		_item_name = [_item_id] call weapon_display_name;
		player groupChat format["Attachment ""%1"" is not in your inventory", _item_name];
	};
	
	private["_weapon_id", "_current_item_id"];
	_weapon_id = (currentWeapon _player);
	_current_item_id = [_player, _weapon_id, _slot_id] call player_get_weapon_slot_item;
	
	if (_current_item_id == _item_id) exitWith {null};
	
	[_player, _weapon_id, _current_item_id, _item_id] call player_swap_weapon_items;
};


weapon_modifications_dialog_setup = {
	//player groupChat format["weapon_modifications_dialog_setup %1", _this];
	ARGV(0,_player);


	private["_weapon_id"];
	_weapon_id = [_player] call player_get_first_weapon;


	private["_weapon_name"];
	_weapon_name = [_weapon_id] call weapon_display_name;
	_weapon_name = if (undefined(_weapon_name)) then {""} else {_weapon_name};

	private["_weapon_picture_path"];
	_weapon_picture_path = [_weapon_id] call weapon_picture_path;

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
			_name = if (_id == "") then {"(Empty)"} else {[_id] call weapon_display_name};
			_picture = if (_id == "") then {""} else {[_id] call weapon_picture_path};

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

	_top_rail_attachments = [_weapon_id] call weapon_compatible_top_rail;
	_side_rail_attachments = [_weapon_id] call weapon_compatible_side_rail;
	_muzzle_attachments = [_weapon_id] call weapon_compatible_muzzle;
	
	private["_all_items"];
	_all_items = [_player] call player_get_all_items;

	private["_weapon_items"];
	_weapon_items = [_player, _weapon_id] call player_weapon_attachments;

	[_weaponMuzzle_control, _muzzle_attachments, _weapon_items, _all_items] call _comboAddAttachments;
	[_weaponSide_control, _side_rail_attachments, _weapon_items, _all_items] call _comboAddAttachments;
	[_weaponTop_control, _top_rail_attachments, _weapon_items, _all_items] call _comboAddAttachments;

	_weaponTop_control ctrlAddEventHandler ["LBSelChanged", "(_this + [weapon_slot_top_rail]) call weapon_slot_label_changed"];
	_weaponSide_control ctrlAddEventHandler ["LBSelChanged", "(_this + [weapon_slot_side_rail]) call weapon_slot_label_changed"];
	_weaponMuzzle_control ctrlAddEventHandler ["LBSelChanged", "(_this + [weapon_slot_muzzle]) call weapon_slot_label_changed"];

	_mainFrame_control ctrlCommit 0;
	_mainBackground_control ctrlCommit 0;
	_weaponPicture_control ctrlCommit 0;
	_weaponMuzzle_control ctrlCommit 0;
	_weaponTop_control ctrlCommit 0;
	_weaponSide_control ctrlCommit 0;
};



weapon_functions_defined = true;