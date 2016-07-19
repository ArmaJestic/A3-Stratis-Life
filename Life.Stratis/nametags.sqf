#include "includes\macro.h"
#include "Awesome\Functions\constants.h"

call disableserialization;

A_object_fnc_atm = {
	private["_object"];
	_object = _this select 0;
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	(_object in bankflagarray)
};


A_object_fnc_shop = {
	private["_object"];
	_object = _this select 0;
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	(_object in A_farming_var_shopusearray)
};

A_object_fnc_vendor = {
	private["_object"];
	_object = _this select 0;
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
		
	(_object in vendors_list)
};

A_object_fnc_item = {
	private["_object"];
	_object = _this select 0;
	if (undefined(_object)) exitWith {false};
	if (typeName _object != "OBJECT") exitWith {false};
	if (isNull _object) exitWith {false};
	
	private["_item"];
	_item = _object getVariable ["item", ""];
	not(_item == "")
};



name_tags_driver_string = {
	ARGV(0,_vehicle);
	private["_default"];
	_default = "Empty";
	
	private["_crew"];
	_crew = crew _vehicle;
	if (count(_crew) == 0) exitWith {_default};
	
	private["_crew_str"];
	_crew_str = "";
	{
		if (_forEachIndex == 0) then { 
			_crew_str = (name _x);
		}
		else {
			_crew_str = _crew_str + "," + (name _x);
		};
	} forEach _crew;
	
	(_crew_str)
};

name_tags_vehicle = {
	ARGV(0,_target);
	if (undefined(_target)) exitWith {false};

	
	(
		not(_target isKindOf "Man") && {
		_target isKindOf "Car" ||
		_target isKindOf "Tank" ||
		_target isKindOf "Motorcycle" ||
		_target isKindOf "Air" ||
		_target isKindOf "Ship_F" ||
		_target isKindOf "LocalBasicWeaponsBox"}
	)
};


name_tags_head_position = {
	private["_target", "_pos", "_pos_x", "_pos_y", "_pos_z"];
	_target = _this select 0;

	private["_distance"];
	_distance = player distance _target;
	

	private["_pos", "_pos_x", "_pos_y", "_pos_z"];
	_pos = (_target selectionPosition "neck");
	
	_pos_x = (_pos select 0);
	_pos_y = (_pos select 1);
	_pos_z = (_pos select 2) + 0.2;
	
	_pos_z = if (_pos_z > 1.6) then { 1.9 } else {_pos_z};
	_pos =  [_pos_x, _pos_y, _pos_z];

	(_target modelToWorld _pos)
};


name_tags_max_z = {
	private["_target"];
	_target = _this select 0;
	
	private["_bbox"];
	_bbox = boundingBox _target;
	_maxZ = (_bbox select 1) select 2;
	_maxZ = if (_maxZ > 2) then { 1 } else {_maxZ};
	_maxZ = _maxZ + 0.3;
	(_target modelToWorld ([0,0,_maxZ]))
};


name_tags_position = {
	//player groupChat format["name_tags_position %1", _this];
	ARGV(0,_target);
	

	if (_target isKindOf "Man") exitWith {
		([_target] call name_tags_head_position)
	};
	
	private["_parts", "_pos", "_part"];
	_parts = ["rotorShaft", "velka osa", "rotor_axis", "trup", "aimPoint", "zamerny", "pos driver", "pos cargo", ""];
	_part = "";
	
	_pos = [0,0,0];
	{
		private["_cpart", "_cpos"];
		_cpart = _x;
		_cpos = _target selectionPosition _cpart;
		if (not(((_cpos select 0) == 0) && { ((_cpos select 1) == 0) && {((_cpos select 2) == 0)}})) exitWith {
			_pos = _cpos;
			_part = _cpart;
		};
	} forEach _parts;
	
	//player groupChat format["_part = %1, _pos = %2", _part, _pos];
	
	if (_part == "" || ((_pos select 2) > 2)) exitWith {
		([_target] call name_tags_max_z)
	};
	
	
	//(_target modelToWorld (_pos))
	visiblePosition _target
};





name_tags_draw = {
	
	//player groupChat format["name_tags_draw %1", _this];
	
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
	_control = call name_tags_control;

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
		_head_pos = ([_target] call name_tags_position);
		//drawIcon3D ["", [0,1,0,1], _head_pos, 0,0, 0, _label, 2, _font_size, _font];
		_head_pos set [2, ((_head_pos select 2) + 0.15)];
		[_head_pos, [0.3, 0.14],"<t size=""1.2"" align=""center"" color=""#ffffffff"" >"+ _label + "</t><br />" + "<img  align=""center"" size=""4"" image=""" + _icon + """/><br />"] call A_hud_fnc_drawIcon3d__;

		true
	};

	drawicon3d_text_field ctrlShow false;
	
	
	

	if (([_target] call A_object_fnc_atm) && _distance < 3) exitWith {
		private["_head_pos"];
		_head_pos = ([_target] call name_tags_position);
		
		drawIcon3D ["", [0,1,0,1], _head_pos, 0,0, 0, "ATM (E)", 2, _font_size, _font];
		true
	};
	
	if ([_target] call A_object_fnc_shop && _distance < 3) exitWith {
		private["_text"];
		if(([_player] call A_player_fnc_blufor) and _target in drugsellarray) then { 
			_text = "Drug Search (E)";
		}
		else {
			private["_shop_name", "_action_key"];
			_action_key = if (_target in gangareas) then {"Scroll"} else {"E"};
			_shop_name = (_target call A_inventory_fnc_get_shop_array) select 1;
			_text = format["%1 (%2)", _shop_name, _action_key];
		};
		private["_head_pos"];
		_head_pos = ([_target] call name_tags_position);
		//player groupChat format["_head_pos = %1", _head_pos];
		
		drawIcon3D ["", [1,1,0,1], _head_pos, 0,0, 0, _text, 2, _font_size, _font];
		
		true
	};
	
	if ([_target] call A_object_fnc_vendor && _distance < 3) exitWith {
		private["_vendor_name", "_vendor_data", "_text", "_head_pos"];
		_vendor_data = ([_target] call vendor_data);
		if (undefined(_vendor_data)) exitWith {true};
		_vendor_name = _vendor_data select vendor_name;
		
		_head_pos = ([_target] call name_tags_position);
		
		drawIcon3D ["", [1,1,0,1], _head_pos, 0,0, 0, format["%1 (Scroll)", _vendor_name], 2, _font_size, _font];
		true
	};
	
	
	if ([_target] call name_tags_vehicle && _distance >= 5 && _distance < 25) exitWith {
		private["_owner", "_inside_vehicle", "_is_box"];	

		private["_text1", "_text2"];
		_text1 = "(" + ([_target] call name_tags_driver_string) + ")";
		_text2 = "(" + str(_target) + ")";

		
		private["_center_pos"];
		_center_pos = [_target] call name_tags_position;
		private["_sep"];
		_sep = 0.06 + _distance/50;
		
		drawIcon3D ["", [1,1,0,1], [(_center_pos select 0), (_center_pos select 1), ((_center_pos select 2) + 0.7)], 0,0, 0, _text1, 2, _font_size, _font];
		drawIcon3D ["", [1,1,0,1], [(_center_pos select 0), (_center_pos select 1), ((_center_pos select 2) + 0.7 + _sep)], 0,0, 0, _text2, 2, _font_size, _font];
		true
	};
	

	if ([_target] call name_tags_vehicle && _distance < 5) exitWith {
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
			_text1 = "(" + ([_target] call name_tags_driver_string) + ")";
			_text2 = "Enter (E)";
		}
		else { if (not(_owner) && (locked _target) == 2) then {
			_text1 = "(" + ([_target] call name_tags_driver_string) + ")";
			_text2 = "(" + str(_target) + ")";
		};};};};
		
		private["_center_pos"];
		_center_pos = [_target] call name_tags_position;
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
		_head_pos = ([_target] call name_tags_position);
		drawIcon3D ["", _color, _head_pos, 0,0, 0, _text, 2, _font_size, _font];
		
		true
	};

	false
};





name_3d_tags_draw = {
	//player groupChat format["name_3d_tags_draw %1", _this];
	private["_player", "_side"];

	if( undefined(name_tags_side_units)) exitWith {null};
	
	disableSerialization;
	_player = _this select 0;
	_side = _this select 1;
	
	//put tags on players
	{
		
		if (not(INV_shortcuts)  || [_player] call A_player_fnc_civilian ||
			not(alive _player) || visibleMap) exitWith {};
			
		if (true) then {
			private["_target", "_cside", "_vehicle"];
			_target = _x;
			_cside = ([_target] call A_player_fnc_side);
			_vehicle = (vehicle player);
			
			if (not(_side == _cside) ||  not(alive _vehicle) || not(isPlayer _target) ||
				not(alive _target) || _target == _player ) exitWith {};
			
			private["_distance", "_has_admin_camera", "_under_base"];
			_has_admin_camera = [_target, "has_admin_camera"] call A_player_fnc_get_bool;
			_A_underwater_base_fnc_under_base = [_target] call A_underwater_base_fnc_under_base;
			_distance = _target distance _player;
			if (_distance <  5 || _has_admin_camera || _under_base) exitWith {};

			private["_part", "_pos", "_pos3d", "_pos2d"];
			_part = if ((vehicle _target) == _target) then {"neck" } else {"engine"};
			_pos = (_target selectionPosition _part);
			//player groupChat format["_pos = %1", _pos];
			_pos = [(_pos select 0), (_pos select 1), (_pos select 2) + 0.3];
			_pos3d = ((vehicle _target) modelToWorld (_pos));
			if (not(count _pos3d == 3)) exitWith {};
		
			private["_size", "_font"];
			_size = 0.025;
			_font = "PuristaMedium";
			
			private["_text", "_icon"];
			_icon = "\A3\ui_f\data\map\markers\military\triangle_CA.paa";
			
			_pos2d = worldToScreen((vehicle _target) modelToWorld (_pos));
			if (not(count (_pos2d) == 2)) exitWith {};
			
			private["_x", "_y"];
			_x = abs((_pos2d select 0) - 0.5);
			_y = abs((_pos2d select 1) - 0.5);
			private["_aimin_at_center"];
			_aimin_at_center = (_x < 0.01 && _y < 0.01);
			
			//player groupChat format["_distance = %1, _x = %2, _y = %3", _distance, _x, _y];
			
			_text = "";
			if ((_aimin_at_center || _target == cursorTarget) && _distance > 25) then {
				_text = format["%1 (%2) [%3]", (_target), (name _target), round(_distance)];
			};
		
			drawIcon3D [_icon, [0.71,0.28,0,0.8], _pos3d, 0.45,0.45, 180, _text, 2, _size, _font];	
		};
	} forEach name_tags_side_units;
};

name_tags_control = {
	( (uiNamespace getVariable 'TAGS_HUD') displayCtrl tags_name_id)
};


loading_check_stance = {
	private["_player"];
	_player = player;
	
	if (not(loading_active)) exitWith {};
	if ([_player] call A_object_fnc_in_water) exitWith {};
	_player switchMove "amovpercmstpsnonwnondnon";
};


watter_edge_effect = objNull;
water_edge_colorized = false;
water_edge_check_effects = {
	private["_z"];
	_z = (positionCameraToWorld [0,0,0] select 2);

	private["_in_water_edge"];
	_in_water_edge = (_z > -0.1 && _z < 0.09);
	if (not(water_edge_colorized) && _in_water_edge) then {
		1 setFog 1;
		_hndl = ppEffectCreate ["WetDistortion", 300];
		_hndl ppEffectEnable true;
		_hndl ppEffectAdjust [
			0, //blurriness
			1.0, //effect strength top
			1.0, //effect strength bottom
			
			//Wave Speed
			1.0, 
			0.0, 
			0.0, 
			1.0, 
			//Wave Amplitues
			0.03, 
			0.01, 
			0.01,
			0.01,
			//Wave Coeficients
			0.08, 
			0.08, 
 			0.0, 
			1.0 
		];
		if (sunOrMoon > 0)  then {
			_hndl ppEffectCommit 0;
		};
		watter_edge_effect = _hndl;
		water_edge_colorized = true;
	};
	
	if (water_edge_colorized && not(_in_water_edge)) then {
		1 setFog 0;
		ppEffectDestroy watter_edge_effect;
		water_edge_colorized = false;
	};
};


cursorTarget__ = objNull;
heldTarget__ = objNull;
firstTarget__ = objNull;
secondTarget__ = objNull;
#define cursorTarget_calculate \
	cTarget = cursorTarget; \
	if (not(isNull cTarget)) exitWith {cursorTarget__ = cTarget;}; \
	cTargets = nearestObjects [(player modelToWorld (player selectionPosition "RightHand")), ["Man", "Car", "Air", "Ship", "Land_CargoBox_V1_F", "ReammoBox_F", "Items_base_F", "Cargo_base_F"], 25]; \
	if (count(cTargets) > 0) exitWith { \
		heldTarget__ = [player, "held_target", objNull] call A_object_fnc_getVariable; \
		firstTarget__ = (cTargets select 1); \
		secondTarget__ = if (count(cTargets) > 2) then {(cTargets select 2)} else {objNull}; \
		if (not(isNull heldTarget__) && {firstTarget__ == heldTarget__}) then { \
			cursorTarget__ = secondTarget__; \
		} \
		else { \
			cursorTarget__ = firstTarget__; \
		}; \
	};\
	cursorTarget__ = objNull;
	
onEachFrame {
	call A_camera_fnc_draw_helpers;
	call water_edge_check_effects;
	call loading_check_stance;
	call A_bunker_fnc_underground_base_check_animation;
	call A_underwater_base_fnc_underwater_base_check_transition;
	call A_underwater_base_fnc_under_base_check_effects;
	
	if (not(INV_shortcuts)) exitWith {
		drawicon3d_text_field ctrlShow false;
	};
	
	
	[player, ([player] call A_player_fnc_side)] call name_3d_tags_draw;
	if (not([player] call name_tags_draw)) then {
		drawicon3d_text_field ctrlShow false;
	};
	
	[] call A_vehicle_fnc_tuning_handler;
	
	[] call A_camera_fnc_loop;
	cursorTarget_calculate;
};

//loop for making list of units in your own side 
//(this is needed so that we dont go through the full player list each time per frame)
name_tags_side_units = [];
name_tags_loop = {
	//player groupChat format["name_tags_loop"];
	private["_player"];
	_player = player;
	if (alive _player) then {
		private["_side"];
		_side = [_player] call A_player_fnc_side;
		name_tags_side_units = name_tags_side_units - [objNull];
		
		private["_cplayer", "_cside"];
		{
			_cplayer = _x;
			if (true) then {
				if (undefined(_cplayer)) exitWith {null};
				if (typeName _cplayer != "OBJECT") exitWith {null};
				if (isNull _cplayer) exitWith {null};
				_cside = side _cplayer;
				if (not(_cside == _side)) exitWith {null};
				if (_cplayer in name_tags_side_units) exitWith {null};
				name_tags_side_units set [count(name_tags_side_units), _cplayer];
			};
		} forEach playableUnits;
	};
	
	[] spawn name_tags_loop;
};

[] spawn name_tags_loop;
