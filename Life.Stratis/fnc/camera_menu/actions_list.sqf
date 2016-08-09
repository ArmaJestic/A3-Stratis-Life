// A_camera_menu_fnc_camera_actions_list

#include "..\..\includes\macro.h"
#include "..\..\includes\constants.h"


([
	["------ Editor Commands ------", {}],
	["Set Object Name", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		[_object, "name", _text, true] call A_object_fnc_setVariable;
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
		_attached = [_object, "attached", false] call A_object_fnc_getVariable;
		_damage = [_object, "damage", true] call A_object_fnc_getVariable;
		_hidden = [_object, "hidden", false] call A_object_fnc_getVariable;
		
		_nobject enableSimulation _simulation;
		_nobject setVariable ["damage", _damage, true];
		_nobject allowDamage _damage;
		_nobject setVariable ["attached", _attached, true];
		_nobject setVariable ["hidden", _hidden, true];
		_nobject setVariable ["tracked", true, true];
		
		private["_o", "_h"];
		
		_o = [_object, "offset", [0,0,0]] call A_object_fnc_getVariable;
		_h = [_object, "heading", [0,0,0]] call A_object_fnc_getVariable;
		[_nobject, [(_o select 0), (_o select 1), (_o select 2)], [(_h select 0), (_h select 1), (_h select 2)]] call A_camera_menu_fnc_set_offset_heading;
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
		_source = call A_camera_menu_fnc_clipboard_objectFromNetId;
		_o = [_source, "offset", [0,0,0]] call A_object_fnc_getVariable;
		_h = [_source, "heading", [0,0,0]] call A_object_fnc_getVariable;
		[_object, [(_o select 0), (_o select 1), (_o select 2)], [(_h select 0), (_h select 1), (_h select 2)]] call A_camera_menu_fnc_set_offset_heading;
	}],
	["Set heading from netId (clipboard)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		
		private["_source"];
		_source = call A_camera_menu_fnc_clipboard_objectFromNetId;

		private["_heading", "_offset"];
		_heading = [_source, "heading", [(getDir _object),0,0]] call A_object_fnc_getVariable;
		_offset = [_object, "offset", (_object modelToWorld [0,0,0])] call A_object_fnc_getVariable;
		
		private["_nheading"];
		_nheading = [(_heading select 0), (_heading select 1), (_heading select 2)];
		
		[_object, _offset, _nheading] call A_camera_menu_fnc_set_offset_heading;
	}],
	["Set offset from netId (Z axis)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		
		private["_source", "_offset", "_coffset"];
		_source = call A_camera_menu_fnc_clipboard_objectFromNetId;
		_coffset = [_object, "offset", [0,0,0]] call A_object_fnc_getVariable;
		_offset = [_source, "offset", [0,0,(_coffset select 2)]] call A_object_fnc_getVariable;
		[_object, CAMERA_OFFSET_AXIS_Z, CAMERA_OFFSET_OP_SET,(_offset select 2)] call A_camera_menu_fnc_modify_offset;
	}],
	["Add to object heading (direction)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		[_object, CAMERA_HEADING_AXIS_DIRECTION, CAMERA_HEADING_OP_ADD, ([_text] call A_misc_fnc_parse_number)] call A_camera_menu_fnc_modify_heading;
	}],
	["Add to object heading (angle)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		[_object, CAMERA_HEADING_AXIS_ANGLE, CAMERA_HEADING_OP_ADD, ([_text] call A_misc_fnc_parse_number)] call A_camera_menu_fnc_modify_heading;
	}],
	["Add to object heading (pitch)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		[_object, CAMERA_HEADING_AXIS_PITCH, CAMERA_HEADING_OP_ADD, ([_text] call A_misc_fnc_parse_number)] call A_camera_menu_fnc_modify_heading;
	}],
	["Set object heading (direction)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		[_object, CAMERA_HEADING_AXIS_DIRECTION, CAMERA_HEADING_OP_SET, ([_text] call A_misc_fnc_parse_number)] call A_camera_menu_fnc_modify_heading;
	}],
	["Set object heading (angle)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		[_object, CAMERA_HEADING_AXIS_ANGLE, CAMERA_HEADING_OP_SET, ([_text] call A_misc_fnc_parse_number)] call A_camera_menu_fnc_modify_heading;
	}],
	["Set object heading (pitch)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		[_object, CAMERA_HEADING_AXIS_PITCH, CAMERA_HEADING_OP_SET,([_text] call A_misc_fnc_parse_number)] call A_camera_menu_fnc_modify_heading;
	}],
	["Add to offset (Z axis)", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		[_object, CAMERA_OFFSET_AXIS_Z, CAMERA_OFFSET_OP_ADD,([_text] call A_misc_fnc_parse_number)] call A_camera_menu_fnc_modify_offset;
	}],
	["Toggle Attached", {
		ARGV(0,_player);
		ARGV(1,_object);
		ARGV(2,_text);
		private["_attached"];
		_attached = _object getVariable ["attached", false];
		player groupChat format["_attached = %1", _attached];
		_attached = !(_attached);
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
