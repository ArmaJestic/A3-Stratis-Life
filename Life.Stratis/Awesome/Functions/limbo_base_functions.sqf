#include "constants.h"
#include "macro.h"

if (not(undefined(limbo_base_functions_defined))) exitWith {};


limbo_base_create = {
	ARGV(0,_offset);
	ARGV(1,_heading);
	
	//reference object 
	private["_ref"];
	_ref = "Sign_Sphere10cm_F" createVehicleLocal [0,0,0];
	_ref setPos [0,0,0];
	[_ref, [0,0,0]] call object_set_heading;
	
	
	private["_cv"];
	//generic function for placing composition objects
	_cv = object_editor_create;

	private["_id"];
	_id = "";
	
	_ref = ["FlagSmall_F",_offset,_heading,true,true,true,"",true,_id,true,_ref] call _cv;

["Land_Pier_F",[-1.59216,18.4985,-1.15247],[16.034,0,0],true,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-3.453,14.7046,21.6222],[16.034,180,0],true,true,false,"",false,_id,false,_ref] call _cv;
["Land_ChairWood_F",[-3.06165,9.73535,3.49343],[466.015,0,0],false,true,true,"respawn_limbo_proxy",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-5.53552,4.74023,-1.14247],[16.034,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[1.12061,27.9595,12.1194],[16.034,90,0],true,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-7.52808,0.670898,21.6322],[16.034,180,0],true,true,false,"",false,_id,false,_ref] call _cv;
["Land_LampHalogen_F",[18.0687,17.4009,9.31382],[-20.7517,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[19.3842,1.92432,12.1194],[-253.966,90,0],true,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-9.59729,-8.72363,12.1194],[196.034,90,0],true,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-28.4384,16.8149,12.1194],[-73.966,90,0],true,true,false,"",false,_id,false,_ref] call _cv;
["Land_LampHalogen_F",[-26.96,1.99902,9.31382],[144.911,0,0],false,true,true,"",false,_id,false,_ref] call _cv;

};

limbo_base_enter = {
	if (not(isClient)) exitWith {};
	ARGV(0,_player);
	
	if (not([_player] call object_exists)) exitWith {};
	
	private["_respawn"];
	_respawn = respawn_limbo_proxy;
	
		
	private["_rad", "_dir"];
	_rad = 8;
	_rad = (random _rad);
	_dir = random(360);
	
	private["_pos"];
	_pos = _respawn modelToWorld [0,0,0];
		
	//convert from polar coordinates to X, Y
	private["_xr", "_yr"];
	_xr = _rad * cos(_dir);
	_yr = _rad * sin(_dir);
	

	detach _player;	
	_player attachTo [_respawn, [_xr,_yr,0.1]];
	detach _player;
	private["_animation"];
	_animation = "amovpercmstpsnonwnondnon";
	
	_player playMoveNow _animation; //(don't do this one inside the loop, because it's sent across the network)
	waitUntil {
		_player switchMove _animation;
		((animationState _player) == _animation)
	};
	

};

if (isServer) then {
	[[3945.04,4400.83,8000],[0,0,0]] call limbo_base_create;
	
	limbo_base_setup_complete = true;
	publicVariable "limbo_base_setup_complete";
};

if (isClient) then {
	waitUntil {(not(isNil "limbo_base_setup_complete") && {limbo_base_setup_complete})};
};


limbo_base_functions_defined = true;