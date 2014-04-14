#include "dikcodes.h"
#include "macro.h"

if (not(undefined(camera_functions_defined))) exitWith {null};


camera_get_target = {
	//player groupChat format["camera_get_target %1"];
	ARGV(0,_player);

	private["_pos1", "_pos2"];
	_pos1 = [_player] call camera_get_position;
	_pos2 = screenToWorld [(safezoneX + 0.5 * safezoneW), (safezoneY + 0.5 * safezoneH)];
	_object_intersect = lineIntersectsWith [ATLtoASL(_pos1), ATLtoASL(_pos2), objNull, objNull, true];
	
	private["_target_marker_pos", "_current_target", "_target_marker"];
	_target_marker_pos = _pos2;
	
	_target_marker = ([_player] call camera_get_target_marker);
	_target_marker setPos _target_marker_pos;
	
	if (isNil "camera_rabbit" || {typeName camera_rabbit != "OBJECT" || {isNull camera_rabbit}}) exitWith {objNull};
	_current_target = cursorTarget;
	if (not(isNull(_current_target))) then {
		private["_tracked", "_offset", "_heading", "_damage", "_simulation", "_hidden", "_attached"];
		_tracked = _current_target getVariable ["tracked", false];
		_offset = [_current_target, "offset", []] call object_getVariable;
		_heading = [_current_target, "heading", []] call object_getVariable;
		_reference = (camera_export_reference_object == _current_target);
		_damage = [_current_target, "damage", false] call object_getVariable;
		_simulation = simulationEnabled _current_target;
		_hidden = [_current_target, "hidden", false] call object_getVariable;
		_attached = [_current_target, "attached", false] call object_getVariable;
		hintSilent format["%1\n(%2)\ntracked: %3\noffset: %4\n heading: %5\nreference: %6\ndamage: %7\nsimulation: %8\nhidden: %9\nattached: %10", 
			_current_target,
			typeOf _current_target,
			_tracked, 
			_offset,
			_heading,
			_reference,
			_damage,
			_simulation,
			_hidden,
			_attached];
	}
	else {
		hintSilent str(_current_target);
	};
	_current_target
};


camera_tracked_objects = [];
camera_export_reference_object = objNull;


camera_keyUpHandler = {
	//player groupChat format["camera_keyUpHandler %1", _this];
	ARGV(0,_this);
	
	ARGV(0,_display);
	ARGV(1,_key);
	ARGV(2,_shift);
	ARGV(3,_control);
	ARGV(4,_alt);
	
	private["_player", "_left_click_target"];
	_player = camera_unit;
	_left_click_target = [_player] call camera_get_left_click_target;
	
	[false, _key] call camera_update_key_tracker;
	
	if (_shift) then {
		camera_shift_held = false;
		[_left_click_target] call camera_reset_target_offsets;
	};
	
	if (_control) then {
		camera_control_held = false;
	};
	
	if (_alt) then {
		camera_alt_held = false;
		[_left_click_target] call camera_reset_target_offsets;
	};
	
	if (_key == DIK_LWIN) then {
		[_left_click_target] call camera_reset_target_offsets;
		camera_lwin_held = false;
	};
	
	if (_key == DIK_SPACE) then {
		camera_space_held = false;
		camera_space_hold_reset = false;
	};
	
	if (_key == DIK_T && {not(isNull _left_click_target)}) then {
		private["_tracked"];
		_tracked = _left_click_target getVariable ["tracked", false];
		_tracked = not(_tracked);
		_left_click_target setVariable ["tracked", _tracked, true];
		
		private["_in_list"];
		_in_list = _left_click_target in camera_tracked_objects;
		if (not(_tracked) && {_in_list}) then {
			camera_tracked_objects = camera_tracked_objects - [_left_click_target];
		};
		
		if (_tracked && {not(_in_list)}) then {
			camera_tracked_objects = camera_tracked_objects + [_left_click_target];
		};
	};
	
	if (_key == DIK_E) then {
		[player] call camera_export_tracked;
	};
	
	if (_key == DIK_R && not(undefined(_left_click_target))) then {
		camera_export_reference_object = _left_click_target;
	};
	
	if (_key == DIK_J) then {
		private["_damage"];
		_damage = _left_click_target getVariable ["damage", false];
		_damage = not(_damage);
		_left_click_target setVariable ["damage", _damage, true];
	};
	
	if (_key == DIK_K) then {
		private["_simulation"];
		_simulation = simulationEnabled _left_click_target;
		_simulation = not(_simulation);
		_left_click_target enableSimulation _simulation;
	};
	
	if (_key == DIK_L) then {
		private["_objects"];
		_objects = [_left_click_target];
		_objects = _objects - [objNull];
		[_player, _objects] call camera_menu_create;
	};
	
	if (_key == DIK_H) then {
		private["_hidden"];
		_hidden = [_left_click_target, "hidden", false] call object_getVariable;
		_hidden = not(_hidden);
		[_left_click_target, "hidden", _hidden, true] call object_setVariable;
	};
	
	if (_key == DIK_G) then {
		private["_attached"];
		_attached = [_left_click_target, "attached", false] call object_getVariable;
		_attached = not(_attached);
		[_left_click_target, "attached", _attached, true] call object_setVariable;
	};
	
	if ((_key in (actionKeys "MoveForward") || 
		_key in (actionKeys "MoveBack") ||
		_key in (actionKeys "TurnLeft") ||
		_key in (actionKeys "TurnRight") ||
		_key in (actionKeys "HeliUp") ||
		_key in (actionKeys "HeliDown")) &&
		(count(camera_key_tracker) == 0)) then {
		[_player, 0] call camera_set_velocity;
	};
	
	false
};

camera_remove_keyUp = {
	disableSerialization;
    _display = findDisplay 46;
	if (not(undefined(camera_keyUpHandler_id))) then {
		_display displayRemoveEventHandler  ["keyUp", camera_keyUpHandler_id];
		camera_keyUpHandler_id = null;
	};
};


camera_setup_keyUp = {
	private["_data"];
	_data = _this;
	
	disableSerialization;
    _display = findDisplay 46;
	if ( undefined(camera_keyUpHandler_id) ) then {
		camera_keyUpHandler_id = _display displayAddEventHandler  ["keyUp", format["[_this, %1] call camera_keyUpHandler", _data]];
	};
};


camera_move_pos_vector = {
	ARGV(0,_pos);
	ARGV(1,_data);
	ARGV(2,_velocity);
	
	private["_direction", "_angle", "_pitch"];
	_direction = _data select 0;
	_angle = _data select 1;
	_pitch = _data select 2;
	
	_vecdx = (sin(_direction) * cos(_angle)) * _velocity;
	_vecdy = (cos(_direction) * cos(_angle)) * _velocity;
	_vecdz = (sin(_angle)) * _velocity;

	_pos = [((_pos select 0) + _vecdx), ((_pos select 1) + _vecdy), ((_pos select 2) + _vecdz)];
	_pos
};


camera_next_target = {
	ARGV(0,_direction);
	ARGV(1,_target);
	
	private["_units"];
	_units = playableUnits;
	_target = if (undefined(_target)) then {_units select 0} else {_target};
	
	private["_index"];
	_index = _units find _target;
	_index = _index + _direction;
	_index = if (_index >= (count(_units))) then {0} else {_index};
	_index = if (_index < 0) then { (count _units) - 1} else {_index};
	_target = _units select _index;
	[_player, "camera_target", _target] call object_setVariable;
	
	(_target)
};

camera_update_target = {
	ARGV(0,_player);
	ARGV(1,_key);
	ARGV(2,_shift);
	
	private["_target", "_previous_target"];
	_target =  [_player, "camera_target"] call object_getVariable;
	_previous_target = _target;
	
	private["_handled"];
	_handled = false;
	if (_shift && _key in (actionKeys "NextChannel")) then {
		_target = [+1, _target] call camera_next_target;
		camera_unit groupChat format["Camera target set to %1-%2", _target, (name _target)];
		private["_pos"];
		_pos = if (undefined(_previous_target)) then {null} else {[_player] call camera_get_position};
		[_player, _pos] call camera_set_position;
		
		private["_heading"];
		_heading = if (undefined(_previous_target)) then {[0,0,0]} else {[_player] call camera_get_heading};
		[_player, _heading] call camera_set_heading;
		
		_handled = true;
	};
	
	if (_shift && _key in (actionKeys "PrevChannel")) then {
		_target = [-1, _target] call camera_next_target;
		camera_unit groupChat format["Camera target set to %1-%2", _target, (name _target)];
		private["_pos"];
		_pos = if (undefined(_previous_target)) then {null} else {[_player] call camera_get_position};
		[_player, _pos] call camera_set_position;
		
		private["_heading"];
		_heading = if (undefined(_previous_target)) then {[0,0,0]} else {[_player] call camera_get_heading};
		[_player, _heading] call camera_set_heading;
		
		_handled = true;
	};
	
	if (_shift && _key in (actionKeys "Chat")) then {
		camera_unit groupChat format["Detaching form camera target"];

		detach _camera;
		[_player, "camera_target", null] call object_setVariable;
		
		private["_heading"];
		_heading = if (undefined(_previous_target)) then {null} else {[_previous_target, ([_player] call camera_get_heading)] call camera_heading_modelToWorld;};
		[_player, _heading] call camera_set_heading;
		
		private["_pos"];
		_pos = if (undefined(_previous_target)) then {null} else {_previous_target modelToWorld ([_player] call camera_get_position)};
		[_player, _pos] call camera_set_position;
		
		_handled = true;
	};
	
	_handled
};

camera_get_map_open = {
	ARGV(0,_player);
	
	private["_map_open"];
	_map_open = [_player, "camera_map_open"] call object_getVariable;
	_map_open = if (undefined(_map_open)) then {false} else {_map_open};
	_map_open
};

camera_set_map_open = {
	ARGV(0,_player);
	ARGV(1,_map_open);
	
	[_player, "camera_map_open", _map_open] call object_setVariable;
};

camera_map_control = {
	((finddisplay 12) displayctrl 51)
};

camera_map_open = {
	ARGV(0,_player);
	
	[_player, true] call camera_set_map_open;
	openMap [true, true];
	
	(call camera_map_control) mapCenterOnCamera false;
	
	private["_pos"];
	_pos = [_player] call camera_get_world_position;
	mapAnimAdd [0, (ctrlMapScale (call camera_map_control)) , _pos];
	mapAnimCommit;
};

camera_map_close = {
	ARGV(0,_player);
	
	[_player, false] call camera_set_map_open;
	openMap [false, false];
	
	private["_pos"];
	_pos = [_player] call camera_get_world_position;
	mapAnimAdd [0, (ctrlMapScale (call camera_map_control)) , _pos];
	mapAnimCommit;
};


camera_update_map = {
	ARGV(0,_player);
	ARGV(1,_key);
	ARGV(2,_shift);
	
	if (not(_key in (actionKeys "ShowMap"))) exitWith {null};
	
	if (not([_player] call camera_get_map_open)) then {
		[_player] call camera_map_open;
	}
	else {
		[_player] call camera_map_close;
	};
};

camera_get_max_velocity = {
	private["_player"];
	ARGV(0,_player);
	
	private["_velocity"];
	_velocity = [_player, "camera_max_velocity"] call object_getVariable;
	_velocity = if (undefined(_velocity)) then {0} else {_velocity};
	_velocity
};

camera_set_max_velocity = {
	ARGV(0,_player);
	ARGV(1,_velocity);
	[_player, "camera_max_velocity", _velocity] call object_setVariable;
	
};

camera_get_velocity = {
	ARGV(0,_player);
	
	private["_velocity"];
	_velocity = [_player, "camera_velocity"] call object_getVariable;
	_velocity = if (undefined(_velocity)) then {0} else {_velocity};
	_velocity
};

camera_set_velocity = {
	ARGV(0,_player);
	ARGV(1,_velocity);
	[_player, "camera_velocity", _velocity] call object_setVariable;
};



camera_calculate_velocity = {
	ARGV(0,_player);
	ARGV(1,_shift);
	
	private["_velocity", "_max_velocity", "_delta"];
	_delta = 0.05;
	
	_velocity = [_player] call camera_get_velocity;
	_max_velocity = [_player] call camera_get_max_velocity;
	
	if (_velocity < _max_velocity) then {
		_velocity = (_velocity + _delta);
		_velocity = (_velocity) min (_max_velocity);
	} 
	else {
		_velocity = (_velocity - _delta);
		_velocity = (_velocity) max (_max_velocity);
	};
	
	[_player, _velocity] call camera_set_velocity;
	private["_left_click_target"];
	_left_click_target = [_player] call camera_get_left_click_target;
	_velocity = if (_shift && {isNull _left_click_target}) then {_velocity + 5} else {_velocity};
	(_velocity)
};

camera_get_position = {
	ARGV(0,_player);
	
	private["_target"];
	_target = [_player, "camera_target"] call object_getVariable;
	
	private["_position", "_relative", "_default"];
	_relative = [0,-3,3];
	_default = if (undefined(_target)) then {_player modelToWorld _relative} else {_relative};
	
	_position = [_player, "camera_pos"] call object_getVariable;
	_position = if (undefined(_position)) then {_default} else {_position};
	_position
};

camera_get_world_position = {
	ARGV(0,_player);
	
	private["_pos"];
	_pos = [_player] call camera_get_position;
	
	private["_target"];
	_target = [_player, "camera_target"] call object_getVariable;
	_pos = if (undefined(_target)) then { _pos } else { _target modelToWorld _pos };
	_pos
};

camera_save_position = {
	ARGV(0,_player);
	ARGV(1,_position);
	[_player, "camera_pos", _position] call object_setVariable;
};


camera_set_position = {
	ARGV(0,_player);
	ARGV(1,_position);
	
	[_player, _position] call camera_save_position;
	_position = [_player] call camera_get_position;

	private["_target"];
	_target = [_player, "camera_target"] call object_getVariable;
	
	private["_camera"];
	_camera = [_player, "camera"] call object_getVariable;
	if (undefined(_camera)) exitWith {null};
	
	if (undefined(_target)) then {
		_camera setPos _position;
		//_camera camSetPos _position;
		//_camera camCommit 0.3;
	}
	else {
		_camera attachTo [(vehicle _target), _position];
	};
	
	if (undefined(camera_rabbit)) exitWith {};
	camera_rabbit attachTo [_camera, [0,0,0]];
};




camera_update_position = {
	//player groupChat format["camera_update_position %1", _this];
	ARGV(0,_player);
	ARGV(1,_key);
	ARGV(2,_shift);
	
	private["_posistion"];
	_position = [_player] call camera_get_position;
		
	private["_velocity"];
	_velocity = [_player, _shift] call camera_calculate_velocity;
	
	private["_heading", "_direction", "_angle", "_bank"];
	_heading = [_player] call camera_get_heading;
	_direction = _heading select 0;
	_angle = _heading select 1;
	_bank = _heading select 2;
	
	if (_key in (actionKeys "MoveForward")) then {
		_position = [_position, [_direction, _angle, _bank], _velocity] call camera_move_pos_vector;
	};
	
	if (_key in (actionKeys "MoveBack")) then {
		_angle = _angle + 180;
		_angle = if (_angle > 360) then { _angle - 360 } else {_angle};
		_position = [_position, [_direction, _angle, _bank], _velocity] call camera_move_pos_vector;
	};
	
	if (_key in (actionKeys "TurnLeft") || _key in (actionKeys "MoveLeft")) then {
		_direction = _direction - 90;
		_direction = if (_direction < 0) then { 360 - abs(_direction) } else {_direction};
		_position = [_position, [_direction, 0, _bank], _velocity] call camera_move_pos_vector;
	};
	
	if (_key in (actionKeys "TurnRight") || _key in (actionKeys "MoveRight")) then {
		_direction = _direction + 90;
		_direction = if (_direction > 360) then {_direction - 360} else {_direction};
		_position = [_position, [_direction, 0, _bank], _velocity] call camera_move_pos_vector;
	};
	
	
	if (_key == DIK_Q) then {
		_angle = _angle + 90;
		_angle = if (_angle > 360) then { _angle - 360 } else {_angle};
		_position = [_position, [_direction, _angle, _bank], _velocity] call camera_move_pos_vector;
	};
	
	
	if (_key == DIK_Z)  then {
		_angle = _angle - 90;
		_angle = if (_angle < 0) then { 360 - abs(_angle) } else {_angle};
		_position = [_position, [_direction, _angle, _bank], _velocity] call camera_move_pos_vector;
	};

	[_player, _position] call camera_set_position;
};



camera_MouseZChanged_handler = {
	//player groupChat format["camera_MouseZChanged_handler %1", _this];
	ARGV(0,_this);
	private["_player"];
	_player = camera_unit;
	
	ARGV(1,_zc);
	
	private["_left_click_target"];
	_left_click_target = [_player] call camera_get_left_click_target;
	if (not(isNull _left_click_target)) exitWith {
		_zc = _zc / (abs(_zc));
		[_player, 0,0,_zc] call camera_update_left_click_target;
	};
	
	private["_velocity"]; 
	_velocity = [_player] call camera_get_max_velocity;
	_velocity = if (_zc > 0) then {_velocity + 0.1} else {_velocity - 0.1};
	_velocity = (_velocity) min (5);
	_velocity = (_velocity) max (0);
	_velocity = (round(_velocity * 100) / 100);
	//player groupChat format["Camera max velocity set at %1", _velocity];
	[_player, _velocity] call camera_set_max_velocity;

	true
};

camera_remove_MouseZChanged = {
	disableSerialization;
	private["_control"];
    _control = findDisplay 46;
	if (not(undefined(camera_MouseZChanged_id))) then {
		_control displayRemovEeventHandler  ["MouseZChanged", camera_MouseZChanged_id];
		camera_MouseZChanged_id = null;
	};
};
 
camera_setup_MouseZChanged = {
	private["_data"];
	_data = _this;
	disableSerialization;
	private["_control"];
    _control = findDisplay 46;
	if ( undefined(camera_MouseZChanged_id) ) then {
		camera_MouseZChanged_id = _control displayAddEventHandler  ["MouseZChanged", format["[_this, %1] call camera_MouseZChanged_handler", _data]];
		//player groupChat format["camera_MouseZChanged_id = %1",camera_MouseZChanged_id];
	};
};

camera_get_nightvision = {
	ARGV(0,_player);
	
	private["_nightvision"];
	_nightvision = [_player, "camera_nightvision"] call object_getVariable;
	_nightvision = if (undefined(_nightvision)) then {0} else {_nightvision};
	_nightvision
};

camera_set_nightvision = {
	ARGV(0,_player);
	ARGV(1,_nightvision);
	
	[_player, "camera_nightvision", _nightvision] call object_setVariable;
	(_nightvision)
};

camera_update_nightvision = {
	ARGV(0,_player);
	ARGV(1,_key);
	
	if (not(_key in actionKeys "NightVision")) exitWith {null};
	
	private["_nightvision"];
	_nightvision = [_player] call camera_get_nightvision;
	_nightvision = ((_nightvision + 1) % 10);
	//player groupChat format["_nightvision = %1", _nightvision];
	switch (_nightvision) do {
		case 0: {
			camera_unit groupChat format["Setting camera default mode"];
			camUseNVG false;
			false SetCamUseTi 0;
		};
		case 1: {
			camera_unit groupChat format["Setting camera NV "];
			camUseNVG true;
			false SetCamUseTi 0;
		};
		case 2: {
			camera_unit groupChat format["Setting camera thermal white-hot"];
			camUseNVG false;
			true SetCamUseTi 0;
		};
		case 3: {
			camera_unit groupChat format["Setting camera thermal black-hot"];
			camUseNVG false;
			true SetCamUseTi 1;
		};
		case 4: {
			camera_unit groupChat format["Setting camera thermal light-green-hot"];
			camUseNVG false;
			true SetCamUseTi 2;
		};
		case 5: {
			camera_unit groupChat format["Setting camera thermal dark-green-hot"];
			camUseNVG false;
			true SetCamUseTi 3;
		};
		case 6: {
			camera_unit groupChat format["Setting camera light-orange-hot "];
			camUseNVG false;
			true SetCamUseTi 4;
		};
		case 7: {
			camera_unit groupChat format["Setting camera dark-orange-hot "];
			camUseNVG false;
			true SetCamUseTi 5;
		};
		case 8: {
			camera_unit groupChat format["Setting camera orange body-heat "];
			camUseNVG false;
			true SetCamUseTi 6;
		};
		case 9: {
			camera_unit groupChat format["Setting camera colored body-heat "];
			camUseNVG false;
			true SetCamUseTi 7;
		};
	};
	
	[_player, _nightvision] call camera_set_nightvision;
};

camera_target = {
	private["_objects"];
	_objects = nearestObjects [(screenToWorld [(safezoneX + 0.5 * safezoneW),(safezoneY + 0.5 * safezoneH)]), ["LandVehicle", "Man"], 2];
	if (count _objects == 0) exitWith {null};
	(_objects select 0)
};

camera_enabled = {
	private["_player"];
	ARGV(0,_player);
	
	private["_camera"];
	_camera = [_player, "camera"] call object_getVariable;
	not(undefined(_camera))
};


camera_space_hold_reset = false;
camera_keyDownHandler = {
	//player groupChat format["camera_keyDownHandler = %1", _this];
	private["_player"];
	_player = camera_unit;

	ARGV(0,_this);
	ARGV(1,_key);
	ARGV(2,_shift);
	ARGV(3,_control);
	ARGV(4,_alt);
	
	private["_left_click_target"];
	_left_click_target = [_player] call camera_get_left_click_target;
		
	[true, _key] call camera_update_key_tracker;
	//player groupChat format["_key = %1", _key];
	
	if (_shift) then {
		camera_shift_held = true;
	};
	
	if (_control) then {
		camera_control_held = true;
	};
	
	if (_alt) then {
		camera_alt_held = true;
	};
	
	if (_key == DIK_LWIN) then {
		camera_lwin_held = true;
	};
	
	if (_key == DIK_SPACE) then {
		camera_space_held = true;
		
	
		if (not(isNull _left_click_target) && not(camera_space_hold_reset)) then {
			[_left_click_target] call camera_reset_target_offsets;
			camera_space_hold_reset = true;
		};
	};
	

	if (_key == DIK_DELETE) then {
		if (isNull _left_click_target) exitWith {};
		deleteVehicle _left_click_target;
	};
	
	private["_camera"];
	_camera = [_player, "camera"] call object_getVariable;
	if (undefined(_camera)) exitWith {null};
	
	[_player, _key, _shift] call camera_update_map;
	if ([_player] call camera_get_map_open) exitWith {false};
	
	[_player, _key] call camera_update_nightvision;
	
	private["_handled"];
	_handled = [_player, _key, _shift] call camera_update_target;	


	[_player, _key, _shift] call camera_update_position;
	
	
	_handled
};

camera_remove_keyDown = {
	disableSerialization;
    _display = findDisplay 46;
	if (not(undefined(camera_keyDownHandler_id))) then {
		_display displayRemoveEventHandler  ["keyDown", camera_keyDownHandler_id];
		camera_keyDownHandler_id = null;
	};
};

camera_setup_keyDown = {
	private["_data"];
	_data = _this;
	
	disableSerialization;
    _display = findDisplay 46;
	if ( undefined(camera_keyDownHandler_id) ) then {
		camera_keyDownHandler_id = _display displayAddEventHandler  ["keyDown", format["[_this, %1] call camera_keyDownHandler", _data]];
	};
};



camera_mouseMoving_handler = {
	//player groupChat format["camera_mouseMoving_handler %1", _this];	

	ARGV(0,_this);
	ARGV(1,_xc);
	ARGV(2,_yc);
	

	private["_player"];
	_player = camera_unit;
	
	if (dialog) exitWith {false};
	if ([_player, _xc,_yc, 0] call camera_update_left_click_target) exitWith {false};
	
	
	if ([_player] call camera_get_map_open) exitWith {false};
	
	
	[_player, _xc, _yc] call camera_update_heading;
	false
};

camera_remove_mouseMoving = {
	disableSerialization;
    _display = findDisplay 46;
	if (not(undefined(camera_mouseMoving_id))) then {
		_display displayRemoveEventHandler  ["mouseMoving", camera_mouseMoving_id];
		camera_mouseMoving_id = null;
	};
};
 
camera_setup_mouseMoving = {
	private["_data"];
	_data = _this;
	disableSerialization;
    _display = findDisplay 46;
	if ( undefined(camera_mouseMoving_id) ) then {
		camera_mouseMoving_id = _display displayAddEventHandler  ["mouseMoving", format["[_this, %1] call camera_mouseMoving_handler", _data]];
	};
};


camera_heading2vectors = {
	ARGV(0,_heading);
	
	private["_direction", "_angle", "_bank"];
	_direction = _heading select 0;
	_angle = _heading select 1;
	_bank = _heading select 2;
	
	_vecdx = sin(_direction) * cos(_angle);
	_vecdy = cos(_direction) * cos(_angle);
	_vecdz = sin(_angle);

	_vecux = cos(_direction) * cos(_angle) * sin(_bank);
	_vecuy = sin(_direction) * cos(_angle) * sin(_bank);
	_vecuz = cos(_angle) * cos(_bank);
	
	([ [_vecdx,_vecdy,_vecdz], [_vecux,_vecuy,_vecuz] ])
};

camera_vectorDir2heading = {
	//player groupChat format["camera_vectorDir2heading %1", _this];
	ARGV(0,_vectorDir);
	
	private["_vecdz", "_vecdy", "_vecdx"];
	_vecdx = _vectorDir select 0;
	_vecdy = _vectorDir select 1;
	_vecdz = _vectorDir select 2;
	
	private["_angle"];
	_angle = asin(_vecdz);
	_direction = asin(_vecdx / cos(_angle)); 
	
	_angle = if (_angle < 0) then {360 - abs(_angle)} else {_angle};
	_direction = if (_direction < 0) then {360 - abs(_direction)} else {_direction};
	
	private["_heading"];
	_heading = [_direction, _angle, 0];
	
	//player groupChat format["_convert = %1", _heading];
	_heading	
};

camera_save_heading = {
	ARGV(0,_player);
	ARGV(1,_heading);
	[_player, "camera_heading", _heading] call object_setVariable;
};

camera_get_heading = {
	ARGV(0,_player);
	
	private["_camera"];
	_camera = [_player, "camera"] call object_getVariable;
	
	private["_heading"];
	_heading = [_player, "camera_heading"] call object_getVariable;
	_heading = if (undefined(_heading)) then {[_player, [0,0,0]] call camera_heading_modelToWorld} else {_heading};
	_heading
};

camera_update_heading = {
	ARGV(0,_player);
	ARGV(1,_xc);
	ARGV(2,_yc);;
	
	private["_heading"];
	_heading = [_player] call camera_get_heading;
	
	private["_dir"];
	_dir = _heading select 0;
	_dir = _dir + _xc;
	_dir = if (_dir > 360) then { _dir - 360 } else { _dir };
	_dir = if (_dir < 0) then { 360 - abs(_dir) } else { _dir};

	private["_angle"];
	_angle = _heading select 1;
	_angle = if (undefined(_angle)) then {0} else {_angle};
	_angle =  _angle - _yc;
	_angle = if (_angle > 360) then { _angle - 360 } else { _angle };
	_angle = if (_angle < 0) then { 360 - abs(_angle) } else { _angle};
	
	private["_bank"];
	_bank = _heading select 2;
	
	_heading = [_dir, _angle, _bank];
	//player groupChat format["_update_heading = %1", _heading];
	[_player, _heading] call camera_set_heading;
};


camera_set_heading = {
	ARGV(0,_player);
	ARGV(1,_heading);
	
	private["_camera"];
	_camera = [_player, "camera"] call object_getVariable;
	if (undefined(_camera)) exitWith {null};

	//player groupChat format["_heading_before = %1", _heading];	
	[_player, _heading] call camera_save_heading;
	_heading = [_player] call camera_get_heading;

	//player groupChat format["_heading_last = %1", _heading];
	private["_vectors"];
	_vectors = [_heading] call camera_heading2vectors;
	_camera setVectorDirAndUp _vectors;
	
	if (undefined(camera_rabbit)) exitWith {};
	camera_rabbit attachTo [_camera, [0,0,0]];
};

camera_heading_modelToWorld = {
	ARGV(0,_target);
	ARGV(1,_heading);
	
	//player groupChat format["_heading2_before = %1", _heading];
	private["_tdir"];
	_tdir = getDir _target;
	
	private["_dir"];
	_dir = _heading select 0;
	_dir = _dir + _tdir;
	_dir = if (_dir > 360) then { _dir - 360 } else { _dir };
	_heading set [0, _dir];
	//player groupChat format["_heading2_after = %1", _heading];
	_heading
};

camera_destroy = {
	camera_unit globalChat format["camera_destroy %1", _this];
	ARGV(0,_player);
	if (not([_player] call player_exists)) exitWith {};
	
	private["_camera"];
	_camera = [_player, "camera"] call object_getVariable;
	if (undefined(_camera)) exitWith {};
	
	[_player, "camera", null] call object_setVariable;
	[_player] call camera_map_close;
	
	_camera cameraEffect ["terminate","back"];
	camera_unit globalChat format["destroying camera! %1", _camera];
	camDestroy _camera;
};




camera_create_rabbit = {
	ARGV(0,_camera);
	camera_rabbit = (group player) createUnit ["B_UAV_AI",  (getPos _camera), [], 0, "FORM"];
	camera_rabbit attachTo [_camera, [0,0,0]];
	camera_rabbit setVehicleVarName "camera_rabbit";
};


camere_allowDamage = {
	ARGV(0,_object);
	ARGV(1,_state);
	
	if (isNil "_object" || {typeName _object != "OBJECT" || {isNull _object}}) exitWith {};
	if (isNil "_state" || {typeName _state != "BOOL"}) exitWith {};
	_object allowDamage _state;
};

camera_create = {
	ARGV(0,_player);
	if (not([_player] call player_human)) exitWith {};
	
	private["_pos"];
	_pos = (getPosATL _player);
	_camera = "camera" camCreate [(_pos select 0), (_pos select 1), ((_pos select 2) + 3)];
	_camera cameraEffect ["Internal", "LEFT"];
	_camera setPos _pos;
	_camera camSetFoV 1;
	_camera camPrepareFocus [-1,-1];
	_camera camCommitPrepared 0;
	
	showCinemaBorder false;
	cameraEffectEnableHUD true;
	clearRadio;
	enableRadio true;
	//_camera camCommand "MANUAL ON";
	_camera camCommand "INERTIA OFF";

	[_player, "camera", _camera] call object_setVariable;
	[_player, "camera_target", null] call object_setVariable;
	[_player, null] call camera_set_heading;
	[_player, null] call camera_set_position;
	[_player] call camera_map_close;
	[_player, 0] call camera_set_velocity;
	[_player, 1] call camera_set_max_velocity;
	
	

	//hook for disabling camera when player dies
	[_camera,_player] spawn {
		ARGV(0,_camera);
		ARGV(1,_player);
		
		[[_player, false], "camere_allowDamage", true, false] call BIS_fnc_MP;
		[_camera] call camera_create_rabbit;
		selectPlayer camera_rabbit;
		camera_unit globalChat format["waiting!"];
		waitUntil {
			(not(alive _player) || (isNull ([_player, "camera", objNull] call object_getVariable)))
		};
		selectPlayer _player;
		[[_player, true], "camere_allowDamage", true, false] call BIS_fnc_MP;
		camera_rabbit setDamage 1;
		[camera_rabbit] call player_despawn;
		[_player] call camera_destroy;
	};
	
	_camera
};

camera_mouseButtonClick_handler = {
	//player groupChat format["camera_mouseButtonClick_handler %1", _this];
	ARGV(0,_this);
	
	private["_player"];
	_player = camera_unit;
	
	if (not([_player] call camera_get_map_open)) exitWith {false};
	
	ARGV(0,_display);
	ARGV(1,_button);
	ARGV(2,_x);
	ARGV(3,_y);
	ARGV(5,_control);
	
	if (not(_button == 0)) exitWith {null};
	
	private["_target"];
	_target = [_player, "camera_target"] call object_getVariable;
	if (not(undefined(_target))) exitWith {
		player groupChat format["Cannot teleport while camera is attached to a target"];
		false
	};
	
	private["_world_pos"];
	_world_pos = _display posScreenToWorld [_x,_y];

	private["_pos"];
	_pos = [_player] call camera_get_position;
	_world_pos set [2, (_pos select 2)];
	
	[_player, _world_pos] call camera_set_position;
	mapAnimAdd [0, (ctrlMapScale _display), _world_pos];
	mapAnimCommit;
	
	[_player] call camera_map_close;
	
	true
};


camera_remove_mouseButtonClick = {
	disableSerialization;
	private["_control"];
    _control = call camera_map_control;
	if (not(undefined(camera_mouseButtonClick_id))) then {
		_control ctrlRemovEeventHandler  ["MouseButtonClick", camera_mouseButtonClick_id];
		camera_mouseButtonClick_id = null;
	};
};
 
camera_setup_mouseButtonClick = {
	private["_data"];
	_data = _this;
	disableSerialization;
	private["_control"];
    _control = call camera_map_control;
	if ( undefined(camera_mouseButtonClick_id) ) then {
		camera_mouseButtonClick_id = _control ctrlAddEventHandler  ["MouseButtonClick", format["[_this, %1] call camera_mouseButtonClick_handler", _data]];
		//player groupChat format["camera_mouseButtonClick_id = %1",camera_mouseButtonClick_id];
	};
};



camera_MouseButtonDown_handler = {
	//player groupChat format["camera_MouseButtonDown_handler %1", _this];
	ARGV(0,_this);
	
	private["_player"];
	_player = camera_unit;
	
	
	ARGV(0,_display);
	ARGV(1,_button);
	ARGV(2,_x);
	ARGV(3,_y);
	ARGV(4,_shift);
	ARGV(5,_control);
	
	
	if (_button == 0) then {
	
		[_player] spawn {
			ARGV(0,_player);
			private["_current_target"];
			_current_target = [_player] call camera_get_current_target;
			[_current_target] call camera_reset_target_offsets;
			[_player, _current_target] call camera_set_left_click_target;
		};
	};
	
	true
};

camera_remove_MouseButtonDown = {
	disableSerialization;
	private["_display"];
    _display = findDisplay 46;
	if (not(undefined(camera_MouseButtonDown_id))) then {
		_display displayRemoveEventHandler  ["MouseButtonDown", camera_MouseButtonDown_id];
		camera_MouseButtonDown_id = null;
	};
};

camera_setup_MouseButtonDown = {
	private["_data"];
	_data = _this;
	disableSerialization;
	private["_display"];
    _display = findDisplay 46;
	if ( undefined(camera_MouseButtonDown_id) ) then {
		camera_MouseButtonDown_id = _display displayAddEventHandler  ["MouseButtonDown", format["[_this, %1] call camera_MouseButtonDown_handler", _data]];
		//player groupChat format["camera_MouseButtonDown_id = %1",camera_MouseButtonDown_id];
	};
};









camera_MouseButtonUp_handler = {
	//player groupChat format["camera_MouseButtonUp_handler %1", _this];
	ARGV(0,_this);
	
	private["_player"];
	_player = camera_unit;

	ARGV(0,_display);
	ARGV(1,_button);
	ARGV(2,_x);
	ARGV(3,_y);
	ARGV(5,_control);
	
	if (_button == 0) then {
		
		private["_left_click_target"];
		_left_click_target = [_player] call camera_get_left_click_target;
		
		if (not(isNull _left_click_target)) then {
			offset_x = 0;
			offset_y = 0;
			offset_z = 0;
		};
		
		camera_space_hold_reset = false;
	
		[_player, null] call camera_set_left_click_target;
	};

	true
};


camera_remove_MouseButtonUp = {
	disableSerialization;
	private["_display"];
    _display = findDisplay 46;
	if (not(undefined(camera_MouseButtonUp_id))) then {
		_display displayRemoveEventHandler  ["MouseButtonUp", camera_MouseButtonUp_id];
		camera_MouseButtonUp_id = null;
	};
};

camera_setup_MouseButtonUp = {
	private["_data"];
	_data = _this;
	disableSerialization;
	private["_display"];
    _display = findDisplay 46;
	if ( undefined(camera_MouseButtonUp_id) ) then {
		camera_MouseButtonUp_id = _display displayAddEventHandler  ["MouseButtonUp", format["[_this, %1] call camera_MouseButtonUp_handler", _data]];
		//player groupChat format["camera_MouseButtonUp_id = %1",camera_MouseButtonUp_id];
	};
};

camera_set_current_target = {
	//player groupChat format["camera_set_current_target %1", _this];
	ARGV(0,_player);
	ARGV(1,_target);
	[_player, "camera_current_target", _target] call object_setVariable;
};

camera_get_current_target = {
	private["_player"];
	ARGV(0,_player);
	([_player, "camera_current_target"] call object_getVariable)
};


camera_set_left_click_target = {
	camera_unit groupChat format["camera_set_left_click_target %1", _this];
	ARGV(0,_player);
	ARGV(1,_target);
	
	[_player, "camera_left_click_target", _target] call object_setVariable;
	[[_target, _player], "object_set_owner", true, false] call BIS_fnc_MP;
};

camera_get_left_click_target = {
	ARGV(0,_player);
	([_player, "camera_left_click_target", objNull] call object_getVariable)
};

camera_start_loop = {
	//player groupChat format["camera_start_loop %1"];
	camera_loop_active =  true;
};

camera_stop_loop = {
	//player groupChat format["camera_stop_loop %1"];
	camera_loop_active = false;
};



camera_loop = {
	if (not(camera_loop_active)) exitWith {};
	if (isNil "camera_unit" || {typeName camera_unit != "OBJECT" || {isNull camera_unit}}) exitWith {};
	
	
	private["_target", "_player"];
	_player = camera_unit;
	if (not([_player] call camera_enabled)) exitWith {};
	_target = [_player] call camera_get_target;
	[_player, _target] call camera_set_current_target;	
	
};


camera_toggle = {
	ARGV(0,_player)
	private["_player"];
	if (isNil "camera_unit" || {typeName camera_unit != "OBJECT" || {isNull camera_unit}}) then {
		camera_unit = player;
	};
	_player = camera_unit;
	
	private["_camera"];
	
	_camera = [_player, "camera"] call object_getVariable;
	_camera = if (undefined(_camera)) then {objNull} else {_camera};
	
	
	if (isNull _camera) then {
		camera_unit groupChat format["Enabling camera!"];
		[] call camera_setup_targetMarker;
		[] call camera_setup_mouseMoving;
		[] call camera_setup_keyDown;
		[] call camera_setup_keyUp;
		[] call camera_setup_mouseButtonClick;
		[] call camera_setup_MouseZChanged;
		[] call camera_setup_MouseButtonDown;
		[] call camera_setup_MouseButtonUp;
		[_player] call camera_create;
		
		[] call camera_start_loop;

	}
	else {
		camera_unit groupChat format["Disabling camera!"];
		[] call camera_remove_targetMarker;
		[] call camera_remove_mouseMoving;
		[] call camera_remove_keyDown;
		[] call camera_remove_keyUp;
		[] call camera_remove_mouseButtonClick;
		[] call camera_remove_MouseZChanged;
		[] call camera_remove_MouseButtonDown;
		[] call camera_remove_MouseButtonUp;
		
		[] call camera_stop_loop;
				
		[_player] call camera_destroy;
		
	};
};






camera_shift_held = false;
camera_control_held = false;
camera_alt_held = false;
camera_lwin_held = false;
camera_space_held = false;


camera_reset_target_offsets = {
	ARGV(0,_current_target);
	if (undefined(_current_target)) exitWith {};
	if (isNull _current_target) exitWith {};
	
	private["_player"];
	_player = camera_unit;
	
	private["_target_marker"];
	
	_target_marker = ([_player] call camera_get_target_marker);
	if (undefined(_target_marker)) exitWith {};
			
	private["_current_target_pos", "_target_marker_pos"];
	_current_target_pos = [_current_target, "offset", null] call object_getVariable;
	if (undefined(_current_target_pos)) then {
		_current_target_pos = _current_target modelToWorld [0,0,0];
	};
	
	_target_marker_pos = [_current_target] call camera_plane_intersect;
	offset_x = ((_target_marker_pos select 0) - (_current_target_pos select 0));
	offset_y = ((_target_marker_pos select 1) - (_current_target_pos select 1));
	offset_z = ((_target_marker_pos select 2) - (_current_target_pos select 2));
	
	//player groupChat format["offset_x = %1, offset_y = %2,offset_z = %3", offset_x, offset_y, offset_z];
};

camera_setup_targetMarker = {
	private["_player"];
	_player = camera_unit;
	private["_target_marker"];
	_target_marker = "Sign_Sphere10cm_F" createVehicleLocal  (getPos _player); 
	[_player, _target_marker] call camera_set_target_marker;
};


camera_remove_targetMarker = {
	private["_player"];
	_player = camera_unit;
	private["_target_marker"];
	_target_marker = [_player] call camera_get_target_marker;
	if (undefined(_target_marker)) exitWith {};
	deleteVehicle _target_marker;
};



camera_key_tracker = [];
camera_update_key_tracker = {
	ARGV(0,_down);
	ARGV(1,_key);
	
	if (not(_key in (actionKeys "MoveForward") || 
		_key in (actionKeys "MoveBack") ||
		_key in (actionKeys "TurnLeft") ||
		_key in (actionKeys "TurnRight") ||
		_key in (actionKeys "HeliUp") ||
		_key in (actionKeys "HeliDown"))) exitWith {};
	
	if (_down && {(camera_key_tracker find _key) == -1}) then {
		camera_key_tracker set [count(camera_key_tracker), _key];
	};
	
	if (not(_down) && {(camera_key_tracker find _key) >= 0}) then {
		camera_key_tracker = camera_key_tracker - [_key];
	};
};


camera_set_target_marker = {
	//player groupChat format["camera_set_target_marker %1", _this];
	ARGV(0,_player);
	ARGV(1,_marker);
	[_player, "camera_target_marker", _marker] call object_setVariable;
};

camera_get_target_marker = {
	private["_player"];
	ARGV(0,_player);
	([_player, "camera_target_marker"] call object_getVariable)
};




camera_update_left_click_target = {
	ARGV(0,_player);
	ARGV(1,_xc);
	ARGV(2,_yc);
	ARGV(3,_zc);
	

	private["_left_click_target"];
	_left_click_target = [_player] call camera_get_left_click_target;
	if (isNull(_left_click_target)) exitWith {false};
	
	if (camera_control_held) exitWith {	
		private["_offset"];
		_offset = [_left_click_target, "offset"] call object_getVariable;
		if (undefined(_offset)) then {
			_offset = _left_click_target modelToWorld [0,0,0];
		};
		
		private["_heading"];
		_heading = [_left_click_target, "heading"] call object_getVariable;
		if (undefined(_heading)) then {
			_heading = [(getDir _left_click_target),0,0];
		};
		
		private["_angle"];
		_angle = (_heading select 1) + _yc;
		_heading set [1, _angle];
		
		[_left_click_target, _offset, _heading] call camera_fake_setPos;
		[_left_click_target, "offset", _offset] call object_setVariable;
		[_left_click_target, "heading", _heading] call object_setVariable;
		
		true
	};
	
	
	if (camera_lwin_held) exitWith {
		private["_offset"];
		_offset = [_left_click_target, "offset"] call object_getVariable;
		if (undefined(_offset)) then {
			_offset = _left_click_target modelToWorld [0,0,0];
		};
		
		
		private["_heading"];
		_heading = [_left_click_target, "heading"] call object_getVariable;
		if (undefined(_heading)) then {
			_heading = [(getDir _left_click_target),0,0];
		};
		
		private["_angle"];
		_angle = (_heading select 2) + _yc;
		_heading set [2, _angle];
		
	
		[_left_click_target, _offset, _heading] call camera_fake_setPos;
		[_left_click_target, "offset", _offset] call object_setVariable;
		[_left_click_target, "heading", _heading] call object_setVariable;
		
		
		true
	};
	
	if (camera_alt_held) exitWith {
		private["_offset"];
		_offset = [_left_click_target, "offset"] call object_getVariable;
		if (undefined(_offset)) then {
			_offset = _left_click_target modelToWorld [0,0,0];
		};
		
		private["_heading"];
		_heading = [_left_click_target, "heading"] call object_getVariable;
		if (undefined(_heading)) then {
			_heading = [(getDir _left_click_target),0,0];
		};
		
		
		private["_direction"];
		_direction = (_heading select 0) + _yc;
		_heading set [0, _direction];
		

		[_left_click_target, _offset, _heading] call camera_fake_setPos;
		[_left_click_target, "offset", _offset] call object_setVariable;
		[_left_click_target, "heading", _heading] call object_setVariable;
		
		
		true
	};
	
	if (camera_shift_held) exitWith {
		private["_offset"];
		_offset = [_left_click_target, "offset"] call object_getVariable;
		if (undefined(_offset)) then {
			_offset = _left_click_target modelToWorld [0,0,0];
		};
	
		//player groupChat format["_zc = %1", _zc];
		_offset = [(_offset select 0), (_offset select 1), ((_offset select 2) - _yc - (_zc / 100))];
		[_left_click_target, "offset", _offset] call object_setVariable;
		//_left_click_target setPos _offset;
		
		
		private["_heading"];
		_heading = [_left_click_target, "heading"] call object_getVariable;
		if (undefined(_heading)) then {
			_heading = [(getDir _left_click_target),0,0];
		};
		

		[_left_click_target, _offset, _heading] call camera_fake_setPos;
		[_left_click_target, "offset", _offset] call object_setVariable;
		[_left_click_target, "heading", _heading] call object_setVariable;
		
		true
	};
	
	
	if (_zc != 0) exitWith {
		private["_offset"];
		_offset = [_left_click_target, "offset"] call object_getVariable;
		if (undefined(_offset)) then {
			_offset = _left_click_target modelToWorld [0,0,0];
			player groupChat format["Getting it!"];
		};
	
		//player groupChat format["_zcz = %1", _zc];
		_offset = [(_offset select 0), (_offset select 1), ((_offset select 2) - _yc - (_zc / 100))];
		[_left_click_target, "offset", _offset] call object_setVariable;
		//_left_click_target setPos _offset;
		
		
		private["_heading"];
		_heading = [_left_click_target, "heading"] call object_getVariable;
		if (undefined(_heading)) then {
			_heading = [(getDir _left_click_target),0,0];
		};
		

		[_left_click_target, _offset, _heading] call camera_fake_setPos;
		[_left_click_target, "offset", _offset] call object_setVariable;
		[_left_click_target, "heading", _heading] call object_setVariable;
		
		true
	};
	
	
	if (camera_space_held) exitWIth {
		private["_pos", "_offset"];
		_pos = [_left_click_target] call camera_plane_intersect;
		_offset = [((_pos select 0) - offset_x ), ((_pos select 1) - offset_y), ((_pos select 2) - offset_z)];

		private["_heading"];
		_heading = [_left_click_target, "heading"] call object_getVariable;
		if (undefined(_heading)) then {
			_heading = [(getDir _left_click_target),0,0];
		};
		
		[_left_click_target, _offset, _heading] call camera_fake_setPos;
		[_left_click_target, "offset", _offset] call object_setVariable;
		[_left_click_target, "heading", _heading] call object_setVariable;
		false
	};
	
	false
};




camera_create_setPos_reference = {
	camera_setPos_reference = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
	camera_setPos_reference setPos [0,0,0];
	private["_heading"];
	_heading = [0,0,0];
	[camera_setPos_reference, _heading] call object_set_heading;
	[camera_setPos_reference, "heading", _heading] call object_setVariable;
	camera_export_reference_object = camera_setPos_reference;
};
	

camera_fake_setPos = {
	//player groupChat format["camera_fake_setPos %1", _this];
	ARGV(0,_object);
	ARGV(1,_position);
	ARGV(2,_heading);
	
	[_object, camera_setPos_reference,  (camera_setPos_reference worldToModel _position), _heading, true] call object_fake_attach;
	if ([_object, "attached", false] call object_getVariable) exitWith {};
	if (OBJECT_CHEMLIGHT(_object)) exitWith {};
	
	//player groupchat format["detaching!"];
	//detach _object;

};






camera_export_tracked = {
    //player groupChat format["camera_export_tracked %1", _this];
    ARGV(0,_player);
   
	
	private["_reference", "_roffset"];
	_reference = camera_export_reference_object;
	_roffset = [_reference, "offset", (_reference modelToWorld [0,0,0])] call object_getVariable;;
	private["_objects"];
	_objects = [(getPosASL _player), 500] call camera_near_tracked_objects;
	player grouPChat format["_reference = %1", _reference];
	
    _str = 
"
//reference object 
private[""_ref""];
_ref = createVehicle [""Sign_Sphere10cm_F"", [0,0,0], [], 0, ""NONE""];
_ref setPos [0,0,0];
[_ref, [0,0,0]] call object_set_heading;

private[""_id""];
_id = """";

private[""_cv""];
//generic function for placing composition objects
_cv = object_editor_create;

";

	private["_zref"];
	_zref = (_reference == camera_setPos_reference);
    
    {
        private["_object", "_heading", "_offset", "_damage", "_simulation", "_class", "_attached", "_hidden"];
        _object = _x;
        _heading = [_object, "heading", [-1,-1,-1]] call object_getVariable;
		_offset =  [_object, "offset", [-1,-1,-1]] call object_getVariable;
		_offset = [((_offset select 0) - (_roffset select 0)), ((_offset select 1) - (_roffset select 1)), ((_offset select 2) - (_roffset select 2))];
		_damage  = [_object, "damage", false] call object_getVariable;
		_simulation = simulationEnabled _object;
		_attached = [_object, "attached", false] call object_getVariable;
		_name = [_object, "name", ""] call object_getVariable;
		_hidden = [_object, "hidden", false] call object_getVariable;
		
        _class = typeOf _object;
        _str = _str + '[' + str(_class) + ',' + str(_offset) + ',' + str(_heading) + ',' + str(_damage) + ',' + str(_simulation) + ',' + str(_attached) + ',' + str(_name) + ',' + str(_hidden) + ',_id,' +  str(_zref) + ',_ref] call _cv;' + toString[13,10];        
    } forEach _objects;
	
    "stdio" callExtension ("write(composition.sqf)" + _str);
    player groupChat format["%1 object exported", count(_objects)];
};


camera_near_tracked_objects = {
	ARGV(0,_position);
	ARGV(1,_distance);
	
	private["_default"];
	_default = [];
	
	if (undefined(_position)) exitWith {_default};
	if (undefined(_distance)) exitWith {_default};
	if (typeName _position != "ARRAY") exitWith {_default};
	if (typeName _distance != "SCALAR") exitWith {_default};

	 private["_objects"];
	 _objects = (nearestObjects [_position, [], _distance]);
	 //player groupChat format["_objects = %1", _objects];
	 {
		private["_cobject"];
		_cobject = _x;
		if (not(_cobject getVariable ["tracked", false])) then {
			_objects set [_forEachIndex, objNull];
		};
	 } forEach _objects;
	 _objects = _objects - [objNull];
	_objects
};


camera_plane_intersect = {
	ARGV(0,_current_target);
	if (undefined(_current_target)) exitWith {[]};
	
	private["_offset"];
	_offset = [_current_target, "offset", (_current_target modelToWorld [0,0,0])] call object_getVariable;
		
	//compute the intersection between the camera's direction vector, and the object's X,Y plane
	_camera = [_player, "camera", objNull] call object_getVariable;
	if (isNull _camera) exitWith {[]};
	
	private["_vdir", "_pos"];
	_vdir = vectorDir _camera;
	_pos = _camera modelToWorld [0,0,0];
	_vdir = [_vdir, (((_offset select 2) - (_pos select 2)) /(_vdir select 2))] call BIS_fnc_vectorMultiply;
	_pos = [_pos, _vdir] call BIS_fnc_vectorAdd;
	_pos set [2, (_offset select 2)];
	_pos
};

camera_draw_bounding_box = {
	ARGV(0,_o);
	ARGV(1,_color);
	
	
	if (undefined(_o) || {isNull _o}) exitWith {};
	
	private["_bb"];
	_bb = boundingBoxReal _o;
	
	private["_p1", "_p2", "_p3", "_p4"];
	_p1 = (_bb select 0);
	_p2 = (_bb select 1);
	private["_p1x", "_p1y", "_p1z", "_p2x", "_p2y", "_p2z", "_w", "_h", "_d"];
	_p1x = _p1 select 0;
	_p1y = _p1 select 1;
	_p1z = _p1 select 2;
	_p2x = _p2 select 0;
	_p2y = _p2 select 1;
	_p2z = _p2 select 2;
	_h = _p2z - _p1z;
	_w = _p2y - _p1y;
	_d = _p2x - _p1x;
	
	private["_p3", "_p4", "_p5", "_p6", "_p7", "_p8"];
	_p3 = [_p1x, (_p1y + _w), (_p1z)];
	_p4 = [(_p1x + _d), (_p1y + _w), _p1z];
	_p5 = [_p1x, (_p1y + _w), (_p1z + _h)];
	_p6 = [_p1x, _p1y, (_p1z + _h)];
	_p7 = [(_p1x + _d), _p1y, (_p1z + _h)];
	_p8 = [(_p1x + _d), _p1y, _p1z];
	

	drawLine3D [ (_o modelToWOrld _p3), (_o modelToWorld _p1), _color];
	drawLine3D [ (_o modelToWOrld _p1), (_o modelToWorld _p6), _color];
	drawLine3D [ (_o modelToWOrld _p6), (_o modelToWorld _p7), _color];
	drawLine3D [ (_o modelToWOrld _p7), (_o modelToWorld _p2), _color];
	drawLine3D [ (_o modelToWOrld _p2), (_o modelToWorld _p4), _color];
	drawLine3D [ (_o modelToWOrld _p4), (_o modelToWorld _p3), _color];
	drawLine3D [ (_o modelToWOrld _p3), (_o modelToWorld _p5), _color];
	drawLine3D [ (_o modelToWOrld _p5), (_o modelToWorld _p2), _color];
	drawLine3D [ (_o modelToWOrld _p5), (_o modelToWorld _p6), _color];
	drawLine3D [ (_o modelToWOrld _p1), (_o modelToWorld _p8), _color];
	drawLine3D [ (_o modelToWOrld _p8), (_o modelToWorld _p4), _color];
	drawLine3D [ (_o modelToWOrld _p8), (_o modelToWorld _p7), _color];
};

camera_draw_helpers = {
	if (undefined(camera_unit)) exitWith {};
	if (not([camera_unit] call camera_enabled)) exitWith {};
	private["_target", "_ltarget"];
	_ltarget = [camera_unit] call camera_get_left_click_target;
	_target = cursorTarget;
	
	[_ltarget, [1,0,0,1]] call camera_draw_bounding_box;
	if (_target != _ltarget) then {
		[_target, [0,0,1,1]] call camera_draw_bounding_box;
	};
};

[] call camera_create_setPos_reference;

camera_functions_defined =  true;