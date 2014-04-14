#include "dikcodes.h"
#include "macro.h"

if (not(undefined(oil_derrick_functions_defined))) exitWith {};

#define OIL_DERRICK_BARREL(id,index) (missionNamespace getVariable [format["barrel%1_%2", index, id], objNull])

oil_derrick_setup_structure = {
	player groupChat format["oil_derrick_setup_structure %1", _this];
	ARGV(0,_id);
	ARGV(1,_offset);
	ARGV(2,_heading);

	private["_cv"];
	//generic function for placing composition objects
	_cv = object_editor_create;
	
	
	private["_ref"];
	_ref = object_attach_reference;
	_ref = ["FlagSmall_F",_offset,_heading,true,true,true,"flag_",false,_id,true,_ref] call _cv;


	//composition objects
	["Land_New_WiredFence_pole_F",[5.79468,-0.883789,0.529249],[272.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_5m_F",[5.29321,-3.44727,0.529249],[272.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_5m_F",[5.53333,3.021,0.529249],[272.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_5m_F",[3.00012,-5.36719,0.529249],[362.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_5m_F",[3.63477,5.32129,0.539249],[182.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_IndPipe2_big_support_F",[0.0639648,-2.07471,1.61247],[0,-18.1232,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_ClutterCutter_large_F",[0.0639648,-2.07471,1.61247],[0,-18.1232,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_IndPipe1_valve_F",[0.2323,0.392578,0.472053],[0,90,0],false,false,true,"pump_",false,_id,false,_ref] call _cv;
	["BlockConcrete_F",[-0.0444336,-0.0917969,-1.66448],[92.4294,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
	["Land_Can_V3_F",[-0.0205078,0.162109,4.22316],[359.889,0,0],false,false,true,"gusher_",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_pole_F",[-0.649414,-5.63525,0.529249],[182.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_IndPipe2_big_support_F",[0.0793457,2.24219,1.56911],[180,-18.1232,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_BarrelSand_F",[0.741943,3.53906,-0.0221791],[359.836,0,0],true,false,true,"barrel1_",false,_id,false,_ref] call _cv;
	["Land_BarrelSand_F",[0.0263672,3.51465,-0.0221791],[359.836,0,0],false,false,true,"barrel2_",false,_id,false,_ref] call _cv;
	["Land_BarrelSand_F",[-0.798218,3.49658,-0.0221791],[359.836,0,0],true,false,true,"barrel3_",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_pole_F",[1.04736,5.81787,0.539249],[182.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_5m_F",[-3.23633,-5.13232,0.529249],[362.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_5m_F",[-2.63098,5.57471,0.529249],[182.429,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_5m_F",[-5.18103,-2.80518,0.529249],[92.4294,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_pole_F",[-5.4093,1.07666,0.539249],[272.429,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
	["Land_New_WiredFence_5m_F",[-4.91797,3.66309,0.539249],[92.4294,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
	["Land_LampShabby_F",[-4.68762,5.55371,3.2109],[122.822,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
	//["Land_dp_smallTank_F",[-3.49194,10.4995,3.99183],[186.01,0,0],true,true,true,"",false,_id,false,_ref] call _cv;
	

	[OIL_DERRICK_BARREL(_id,1)] call oil_derrick_barrel_setup;
	[OIL_DERRICK_BARREL(_id,2)] call oil_derrick_barrel_setup;
	[OIL_DERRICK_BARREL(_id,3)] call oil_derrick_barrel_setup;
};

oil_derrick_barrels = [];
oil_derrick_barrel_setup = {
	ARGV(0,_barrel);
	if (typeName _barrel != "OBJECT") exitWith {};
	
	[_barrel, "isPumpBarrel", true, true] call object_setVariable;
	[_barrel, "icon", "icons\crude_oil.paa", true] call object_setVariable;
	[_barrel, "label_template", format["Crude Oil (%1 pumped)", "%1", "%"], true] call object_setVariable;
	[_barrel, "draggable", false, true] call object_setVariable;
	[_barrel, 0] call oil_derrick_barrel_update;
	[_barrel, "item", "crudeoil", true] call object_setVariable;
	oil_derrick_barrels = oil_derrick_barrels + [_barrel];
};

oil_derrick_barrel_update = {
	//player groupChat format["oil_derrick_barrel_update %1", _this];
	ARGV(0,_barrel);
	ARGV(1,_amount);
	if (undefined(_barrel)) exitWith {};
	if (typeName _barrel != "OBJECT") exitWith {};
	if (not([_barrel, "isPumpBarrel", false] call object_getVariable)) exitWith {};
	if (undefined(_amount)) exitWith {};
	
	private["_label_template"];
	_label_template = [_barrel, "label_template", ""] call object_getVariable;
	[_barrel, "label", format[_label_template, _amount], true] call object_setVariable;
	[_barrel, "amount", _amount, true] call object_setVariable;
};


oil_derrick_barrel_loop = {
	if (not(isServer)) exitWith {};
	waitUntil {
		private["_time"];
		_time = floor(serverTime);
		//player groupChat format["_time = %1", _time];
		if ((_time % 30) == 0) then {
			{
				private["_barrel", "_amount"];
				_barrel = _x;
				_amount = [_barrel, "amount", 0] call object_getVariable;
				if (_amount < 50) then {
					_amount = _amount + ceil(random(9));
					[_barrel, _amount] call oil_derrick_barrel_update;
				};
			} forEach oil_derrick_barrels;
		};
		sleep 1;
		false
	};
};

oil_derrick_sound_loop = {
	ARGV(0,_object);
	playSound3D [MISSION_ROOT + "sounds\oil_derrick.ogg", _object, false, getPosASL _object, 1,1,100];
	sleep 20;
	_this spawn oil_derrick_sound_loop;
};

oil_derrick_setup_effects = {
	player groupChat format["oil_derrick_setup_effects %1", _this];
	ARGV(0,_id);
	
	private["_gusher", "_pump"];
	_gusher = missionNamespace getVariable ["gusher_" + _id, objNull];
	_pump = missionNamespace getVariable ["pump_" + _id, objNull];
	if (isNull _gusher || {isNull _pump}) exitWith {};
	
	private["_ps1"];
	_ps1 = "#particlesource" createVehicle getPos _gusher;
	_ps1 setParticleCircle [0, [0, 0, 0]];
	_ps1 setParticleRandom [0, [0.05, 0.05, 0], [0.2, 0.2, 3], 1,  1, [0, 0, 0, 0], 0, 0];
	_ps1 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 14, 1, 0], "", "Billboard", 1, 1.5, [0, 0, 0], [0, 0, 0], 1, 2, 1, 0.2, [0.12, 0.12], [[0.168, 0.125, 0.054 ,1], [0.168, 0.125, 0.054 ,0.5], [0.168, 0.125, 0.054 ,0.3]], [1000], 1, 0, "", "", _gusher];
	_ps1 setDropInterval 0.001;


	private["_ps2"];
	_ps2 = "#particlesource" createVehicle getPos _gusher;
	_ps2 setParticleCircle [0, [0, 0, 0]];
	_ps2 setParticleRandom [0, [0.05, 0.05, 0], [0.07, 0.07, 2], 1,  1.5, [0, 0, 0, 0], 0, 0];
	_ps2 setParticleParams [["\A3\data_f\ParticleEffects\Universal\Universal", 16, 7, 2, 0], "", "Billboard", 1, 0.4, [0, 0, 0], [0, 0, 0], 1, 2, 1, 0.2, [0.05, 0.05], [[0.168, 0.125, 0.054 ,1], [0.168, 0.125, 0.054 ,0.5], [0.168, 0.125, 0.054 ,0.3]], [1000], 1, 0, "", "", _gusher];
	_ps2 setDropInterval 0.001;
	
	[_pump] spawn oil_derrick_sound_loop;
};


if (isServer) then {
	["oil1", [4164.67,3300.88,0.6],[250.826,-2.68511,5.76279]] call oil_derrick_setup_structure;
	["oil2", [2578.17,4910.64,0.607201],[334.668,1.85061,12.6592]] call oil_derrick_setup_structure;
	[] spawn oil_derrick_barrel_loop;
	
	oil_derrick_setup_complete = true;
	publicVariable "oil_derrick_setup_complete";
};

if (isClient) then {
	waitUntil {(not(isNil "oil_derrick_setup_complete") && {oil_derrick_setup_complete})};
	
	["oil1"] call oil_derrick_setup_effects;
	["oil2"] call oil_derrick_setup_effects;
};



oil_derrick_functions_defined = true;