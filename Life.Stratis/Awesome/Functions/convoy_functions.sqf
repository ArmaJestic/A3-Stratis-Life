#include "macro.h"

#define Spawn_convoy 1
#define Driver_dead 2
#define Damaged_convoy 3
#define Cop_escort 4

convoy_side_msg = {
	ARGV(0,_code);
	
	private ["_msg1","_msg2"];
	_msg1 = "";
	_msg2 = "";
	
	switch(_code) do {
		case Spawn_convoy: {
			_msg1 = "Attention officers, the supply truck has started its journey. Defend it against bandits and terrorists, and escort it to base.";
			_msg2 = "Rumors indicate that a valuable government truck has is passing through.";
		};
		case Driver_dead: {
			_msg1 = "The governemnt truck driver is dead. Save it from the bandits, and escort it to base.";
			_msg2 = "Rumors indicate that a valuable government truck is under attack.";
		};
		case Damaged_convoy: {
			_msg1 = "Attention officers, the governemnt truck is heavily damaged. Protect the truck at all costs!";
		};
		case Cop_escort: {
			_msg1 = format["%1-%2, you received $%3 for escorting the governemnt truck", player, (name player), govconvoybonus];
		};
	};
	
	if ([player] call player_cop) then {
		if (_code == Cop_escort) then {
			[player, govconvoybonus] call bank_transaction;
		};
		player sidechat format [ "%1",_msg1];
	}
	else { if(_msg2 != "") then{ 
		player sidechat format [ "%1",_msg2];}; 
	};
};

convoy_spawns = [convspawn1, convspawn2, convspawn3, convspawn4, convspawn5];
convoy_get_spawn = {
	private["_spawn"];
	_spawn = convoy_spawns select (floor(random(count convoy_spawns)));
	_spawn
};


convoy_init_handler_persistent = {
	ARGV(0,_truck);
	ARGV(1,_truck_name);
	
	if (undefined(_truck)) exitWith {};
	if (typeName _truck != "OBJECT") exitWith {};
	if (isNull _truck) exitWith {};
	if (undefined(_truck_name)) exitWith {};
	if (typeName _truck_name != "STRING") exitWith {};
	
	_truck setVehicleVarName _truck_name; 
	missionNamespace setVariable [_truck_name, _truck_name];
	_truck setAmmoCargo 0; 
	clearweaponcargo _truck;
	clearmagazinecargo _truck;
};

convoy_create_truck = {
	ARGV(0,_location);
	
	private["_class", "_truck"];
	_class = ["B_Hunter_F"] call BIS_fnc_selectRandom;
	_truck = createVehicle [_class, _location, [], 0, "NONE"];
	
	private["_truck_name"];
	_truck_name = "convoy_truck";
	
	//[[_truck, _truck_name], "convoy_init_handler_persistent", true, true] spawn BIS_fnc_MP;
	[[_truck, _truck_name], "convoy_init_handler_persistent", true, true, _truck] spawn jip_register;
	waitUntil {not(isNil _truck_name)};

	[_truck, "tuning", 5, true] call object_setVariable;
	processinitcommands;
	_truck
};

convoy_create_marker = {
	ARGV(0,_location);
	
	// spawn markers truck and soldiers
	private["_marker", "_name"];
	_name = "convoy";
	_marker = createMarker [_name, [0,0]];																				
	_marker setMarkerShape "ICON";								
	_marker setMarkerType "mil_dot";										
	_marker setMarkerColor "ColorRed";																														
	_marker setMarkerText "Government Convoy";
	_marker setMarkerPos [(_location select 0), (_location select 1)];
	_marker
};

convoy_unit_name = 0;
convoy_unit_class = 1;
convoy_unit_weapons = 2;
convoy_unit_magazines = 3;
convoy_unit_commander = 4;

convoy_units = [
	["convoysoldier", "B_soldier_AR_F", ["arifle_MXC_F"], ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag"], true],
	["convoyguard1", "B_soldier_AR_F", ["arifle_MXC_F"], ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag"], false],
	["convoyguard2", "B_soldier_AR_F", ["arifle_MXC_F"], ["30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag", "30Rnd_65x39_caseless_mag"], false],
	["convoyguardmg2", "B_soldier_AR_F", ["LMG_Mk200_F"], ["200Rnd_65x39_cased_Box", "200Rnd_65x39_cased_Box"], false]
];

convoy_create_units = {
	ARGV(0,_truck);
	ARGV(1,_location);
	
	private["_convoy_group"];
	_convoy_group = createGroup west;
	
	{
		private["_data", "_name", "_class", "_weapons", "_magazines", "_commander"];
		_data = _x;
		_name = _data select convoy_unit_name;
		_class = _data select convoy_unit_class;
		_weapons = _data select convoy_unit_weapons;
		_magazines = _data select convoy_unit_magazines;
		_commander = _data select convoy_unit_commander;
	
		private["_unit"];
		_unit = _convoy_group createUnit [_class, _location, [], 0, "FORM"];
		
		/*
		_unit setVehicleInit format[
		'
			liafu = true;
			%1 = this; 
			this setSpeedMode "full"; 
			this allowFleeing 0;
			this setVehicleVarName "%1";
		', _name];
		processInitCommands;
		*/
		removeAllWeapons _unit;
		
		_unit addMPEventHandler ["MPKilled", { _this call player_handle_mpkilled }];
		
		_unit setSkill ["general", 0.86];
		_unit setSkill ["endurance", 1];
		_unit setSkill ["spotDistance", 1];
			
		{ _unit addWeapon _x } forEach _weapons;
		{ _unit addMagazine _x } forEach _magazines;
		
		if (_commander) then {
			_convoy_group selectLeader _unit;
			_unit moveInDriver _truck; 
			_unit assignAsDriver _truck;
			_unit setSkill ["commanding", 1];
		}
		else {
			_unit doFollow _truck;
			_unit moveInCargo _truck; 
			_unit assignAsCargo _truck;
		};
	} forEach convoy_units;
	
	_convoy_group setBehaviour "AWARE";
	_convoy_group setCombatMode "RED";
	
	sleep 2;
	_convoy_group
};

convoy_mission_loop = {
	format["convoy_mission_loop %1", _this] call convoy_debug;
	while {not(convoy_complete)} do {
		 _this call convoy_mission_iteration;
		convoy_running_time = convoy_running_time + 1;
		sleep 1;
	};

	if (convoy_complete) exitWith {null};
	_this spawn convoy_mission_loop;
};

convoy_mission_check_damage = {
	ARGV(0,_truck);
	ARGV(1,_group);
	
	if ((damage _truck) < 0.2) exitWith {null};
	if (not([(driver _truck)] call player_exists)) exitWith {null};

	private["_velocity", "_direction"];
	
	_velocity = velocity _truck ;
	_direction = direction _truck ;		
	_speed = 5; 
	// speed boost when shots hits vehicle, is a permanent max fullspeed for vehicle, as 5 m/s is 180km/h
	_truck setVelocity [
		(_velocity select 0)+((sin _direction) * _speed), 
		(_velocity select 1) + ((cos _direction) * _speed),
		(_velocity select 2)
	];
};

convoy_mission_check_targets = {
	ARGV(0,_truck);
	ARGV(1,_group);
	
	{
		_target = _x;
		if (([_target] call player_human) && not([_target] call player_cop) && (alive _target)) then {
			private["_message"];
			_message = "The Government is operating in this area! Turn back or you will be shot!";
			format['if (player == %1) then { titleText [toString(%2), "PLAIN"];};', _target, toArray(_message)] call broadcast;
			
			if ([_target] call player_armed) then {
				{
					_x doTarget _target;			
					_x doFire _target;
				} foreach (units _group);
			};
		};
	} foreach (nearestObjects [getPos _truck, ["Man"], 150]);
};

convoy_mission_check_state = {
	ARGV(0,_truck);
	ARGV(1,_group);
	

	if (convoy_units_exited) exitWith {null};
	
	if (not(alive driver(_truck))) then { 
		format['[Driver_dead] call convoy_side_msg;'] call broadcast;
		[_truck, _group] call convoy_units_exit;
		convoy_units_exited = true;
	}
	else { if (not(canMove _truck)) then {
		format['[Damaged_convoy] call convoy_side_msg;'] call broadcast;
		[_truck, _group] call convoy_units_exit;
		convoy_units_exited = true;				
	};};
};

convoy_units_exit = {
	ARGV(0,_truck);
	ARGV(1,_group);
	
	_truck setVehicleLock "unlocked";
	_group setBehaviour "COMBAT";
		
	{ 
		if (alive _x) then {
			unassignVehicle _x;
			doGetOut _x;
			_x doWatch getPos _truck;
		};
	} foreach (units _group);
};

convoy_mission_check_complete = {
	ARGV(0,_truck);
	ARGV(1,_group);
	ARGV(2,_time);
	
	//the convoy cash has been stolen
	if (not(convoy_cash)) exitwith { 
		convoy_complete_side = Civilian;
		true
	};

	//exit early if the truck is dead
	if (not(alive _truck)) exitWith {
		private["_message"];
		_message = format["The goverment convoy truck was destroyed. The money has burned"];
		format['server globalChat toString(%1);', toArray(_message)] call broadcast;
		convoy_complete_side = sideUnknown;
		true
	};
	
	//convoy has been running for a while ... lets kill it
	if (_time >= 900) exitWith {
		convoy_complete_side = sideUnknown;
		// if there's a cop nearby and the trucks have the payroll until now, so this cop is well protecting truck :]
		{
			private["_unit"];
			_unit = _x;
			if ([_unit] call player_cop) exitWith {
				convoy_complete_side = west;
			};
		} foreach (nearestObjects [getpos _truck,["Man"], 60]);
		true
	};
	
	//convoy has arrived at its destination
	if (((driver _truck) distance _destination) < 25) exitWith {  		
		format['[Cop_escort] call convoy_side_msg;'] call broadcast;
		convoy_complete_side = west;
		true
	};
	
	false
};


/*
 * Simple state machine that controls the movement of the convoy.
 * UNKNOWN -> INITIAL: Send move command to the destination
 * INITIAL -> STUCK:   Send move command to the half-waypoint between current truck position, and destination
 * STUCK   -> STUCK:   Send move command to the half-waypoint between current truck position, and the pevious half-waypoint
 * STUCK   -> MOVING:  Send move command  to the destination
 * MOVING  -> MOVING:  No action
 * INITIAL -> MOVING:  No action
 */
 
#define UNKNOWN 0
#define INITIAL 1
#define STUCK 2
#define MOVING 3

convoy_state2str = {
	ARGV(0,_state);
	
	if (_state == UNKNOWN) exitWith {"UNKNOWN"};
	if (_state == INITIAL) exitWith {"INITIAL"};
	if (_state == STUCK) exitWith {"STUCK"};
	if (_state == MOVING) exitWith {"MOVING"};
	"INVALID"
};

convoy_get_state = {
	ARGV(0,_truck);
	
	private["_state"];
	_state = [_truck, "state"] call object_getVariable;
	_state = if (undefined(_state)) then {UNKNOWN} else {_state};
	_state
};

convoy_set_state = {
	ARGV(0,_truck);
	ARGV(1,_state);
	[_truck, "state", _state, true] call object_setVariable;
};

convoy_get_current_state = {
	ARGV(0,_truck);
	ARGV(1,_time);
	
	private["_cur_pos", "_las_pos"];
	_cur_pos = getPos _truck;
	_last_pos = [_truck, "last_pos"] call object_getVariable;
	_last_pos = if (undefined(_last_pos)) then {_cur_pos} else {_last_pos};
	
	private["_prev_state", "_cur_state"];
	_prev_state = [_truck] call convoy_get_state;
	_cur_state = if ((_cur_pos distance _last_pos) > 3 ) then {MOVING} else {STUCK};
	
	if (_prev_state == UNKNOWN) then {
		[_truck, "last_pos", _cur_pos] call object_setVariable;
		_cur_state = INITIAL;
	};

	if ((_time % 20) == 0) then {
		[_truck, "last_pos", _cur_pos] call object_setVariable;
	};
	
	_cur_state
};

calculate_half_waypoint = {
	//format["calculate_half_waypoint %1", _this] call convoy_debug;
	ARGV(0,_point_a);
	ARGV(1,_point_b);

	([((_point_b select 0)+(_point_a select 0))/ 2, ((_point_a select 1)+(_point_b select 1))/ 2, 0])
};

convoy_mission_check_position = {
	//format["convoy_mission_check_position %1", _this] call convoy_debug;
	ARGV(0,_truck);
	ARGV(1,_group);
	ARGV(2,_destination);
	ARGV(3,_time);
	
	private["_dst_pos", "_cur_pos"];
	_dst_pos = getPos _destination;
	_cur_pos = getPos _truck;
	
	private["_prev_state", "_cur_state"];
	
	_prev_state = [_truck] call convoy_get_state;
	_cur_state = [_truck, _time] call convoy_get_current_state;

	if (_prev_state == UNKNOWN && _cur_state == INITIAL) then {
		//send initial move command
		format["sending initial move command %1", _dst_pos] call convoy_debug;
		(driver _truck) commandMove _dst_pos;
		[_truck, "next_pos", _dst_pos] call object_setVariable;
	}
	else { if ( (_prev_state == INITIAL && _cur_state == STUCK) ||
				(_prev_state == MOVING && _cur_state == STUCK) ||
				(_prev_state == STUCK && _cur_state == STUCK && (_time % 20) == 0)) then {
		//calculate the halfway point between the current, and the next position
		private["_next_pos", "_half_pos"];
		_next_pos = [_truck, "next_pos"] call object_getVariable;
		_half_pos = [_cur_pos, _next_pos] call calculate_half_waypoint;
		format["sending half-way move command %1", _half_pos] call convoy_debug;
		[_truck, "next_pos", _half_pos, true] call object_setVariable;
		(driver _truck) commandMove _half_pos;
	}
	else { if ((_prev_state == STUCK && _cur_state == MOVING)) then {
		//reset the waypoint for the final destination
		format["sending reset move command %1", _dst_pos] call convoy_debug;
		[_truck, "next_pos", _dst_pos] call object_setVariable;
		(driver _truck) commandMove _dst_pos;
	};};};
	
	[_truck, _cur_state] call convoy_set_state;
	
};

convoy_mission_iteration = {
	//format["convoy_mission_iteration %1, %2", _this, convoy_running_time] call convoy_debug;
	ARGV(0,_convoy_truck);
	ARGV(1,_convoy_group);
	ARGV(2,_convoy_marker);
	ARGV(3,_destination);
	
	[_convoy_truck, _convoy_group] call convoy_mission_check_targets;
	[_convoy_truck, _convoy_group] call convoy_mission_check_state;
	[_convoy_truck, _convoy_group] call convoy_mission_check_damage;
	
	convoy_complete = [_convoy_truck, _convoy_group, convoy_running_time] call convoy_mission_check_complete;
	if (convoy_complete) exitWith {null};
	
	[_convoy_truck, _convoy_group, _destination, convoy_running_time] call convoy_mission_check_position;
	
	//update the convoy marker position
	_convoy_marker setMarkerPos (getPos _convoy_truck);
};

convoy_side2string = {
	ARGV(0,_side);

	if (_side == east) exitWith {"Opfor"};
	if (_side == west) exitWith {"Cop"};
	if (_side == civilian) exitWith {"Civilian"};
	if (_side == resistance) exitWith {"Insurgent"};
	"Neither"
};


convoy_debug = {
	diag_log format["%1", _this];
};


convoy_loop = {
	format["convoy_loop %1", _this] call convoy_debug;
	
	sleep (convoyrespawntime * 3);
	private["_message"];
	_message = "There are rumors that a government convoy is leaving in a few minutes.";
	format["hint toString(%1);", toArray(_message)] call broadcast;
	sleep (convoyrespawntime * 3);

	//Gets position to spawn
	private["_spawn", "_location"];
	_spawn = call convoy_get_spawn;
	_location = getPosATL _spawn;

	private["_convoy_truck", "_convoy_marker", "_convoy_group"];
	_convoy_truck = [_location] call convoy_create_truck;
	_convoy_marker = [_location] call convoy_create_marker;
	_convoy_group = [_convoy_truck, _location] call convoy_create_units;
	
	format['[Spawn_convoy] call convoy_side_msg;'] call broadcast;

	//init convoy globals
	convoy_complete = false;
	convoy_cash = true;
	convoy_complete_side = sideUnknown;
	convoy_running_time = 0;
	convoy_units_exited = false;
	
	publicVariable "convoy_cash";
	
	//start the convoy loop, and wait for it to complete
	[_convoy_truck, _convoy_group, _convoy_marker, copbase1] spawn convoy_mission_loop;	
	waitUntil {convoy_complete};

	//announce who won the convoy
	private["_side_str"];
	_side_str = [convoy_complete_side] call convoy_side2string;
	_message = format["%1 side won the goverment convoy mission. Next truck leaves in %2 minutes", _side_str, convoyrespawntime];
	format['server globalChat toString(%1);', toArray(_message)] call broadcast;
	
	sleep 10;
	
	//cleanup the convoy items
	{deleteVehicle _x;} foreach units _convoy_group;
	deleteVehicle _convoy_truck; 
	deleteGroup _convoy_group;
	deleteMarker _convoy_marker;
	
	//waits for respawn
	sleep (convoyrespawntime * 54);
	
	[] spawn convoy_loop;
};

if (isServer) then {
	//[] spawn convoy_loop;
};

// bla bla bla these people thought it was cool to put their names here
// Convoy ideia by Eddie Vedder for the Chernarus life Revivved mission, code rewrite and improvement by a old beggar working for food :P
// written by Gman, rewrited by aliens
