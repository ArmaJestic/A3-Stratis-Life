// A_home_fnc_homelogic


    
_home = _this select 0;

_x = _home select home_x;
_y = _home select home_y;
_z = _home select home_z;

_A_home_var_object = _home select A_home_var_object;
_home set [A_home_var_object, _A_home_var_object];

_A_home_var_walls = _home select A_home_var_walls;

{
	_home_wall = _x;
	_A_home_var_wall_type  = _home_wall select A_home_var_wall_type;

	_home_wall_pos = _home_wall select A_home_var_wall_position;
	_home_wall_dir = _home_wall select A_home_var_wall_direction;

	_home_object_pos = getPosATL _home_object;
	_home_object_dir = getDir _home_object;
	_wall = createVehicle [_home_wall_type,  [_home_object_pos, _home_wall_pos] call A_home_fnc_addpositions, [], 0, "CAN_COLLIDE"];
	_wall setDir ([_home_object_dir, _home_wall_dir] call A_home_fnc_adddirections)
}forEach _home_walls;

while {true} do {  
	_locked = [_home] call A_home_fnc_islocked;
	_opening = [_home] call A_home_fnc_isdooropening;

	if(_locked and _opening) then 
	{
	[_home] call A_home_fnc_closedoor;
	};
	sleep 0.1;
};
