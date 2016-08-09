// A_nametags_fnc_3d_tags_draw

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


//player groupChat format["A_nametags_fnc_3d_tags_draw %1", _this];
private["_player", "_side"];

if( undefined(A_nametags_var_name_tags_side_units)) exitWith {null};

disableSerialization;
_player = _this select 0;
_side = _this select 1;

//put tags on players
{
	
	if (!(INV_shortcuts)  || [_player] call A_player_fnc_civilian ||
		!(alive _player) || visibleMap) exitWith {};
		
	if (true) then {
		private["_target", "_cside", "_vehicle"];
		_target = _x;
		_cside = ([_target] call A_player_fnc_side);
		_vehicle = (vehicle player);
		
		if (!(_side == _cside) ||  !(alive _vehicle) || !(isPlayer _target) ||
			!(alive _target) || _target == _player ) exitWith {};
		
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
		if (!(count _pos3d == 3)) exitWith {};
	
		private["_size", "_font"];
		_size = 0.025;
		_font = "PuristaMedium";
		
		private["_text", "_icon"];
		_icon = "\A3\ui_f\data\map\markers\military\triangle_CA.paa";
		
		_pos2d = worldToScreen((vehicle _target) modelToWorld (_pos));
		if (!(count (_pos2d) == 2)) exitWith {};
		
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
} forEach A_nametags_var_name_tags_side_units;
