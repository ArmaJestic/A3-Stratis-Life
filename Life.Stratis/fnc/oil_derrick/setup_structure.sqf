// A_oil_derrick_fnc_setup_structure

#include "..\..\includes\dikcodes.h"
#include "..\..\includes\macro.h"


player groupChat format["A_oil_derrick_fnc_setup_structure %1", _this];
ARGV(0,_id);
ARGV(1,_offset);
ARGV(2,_heading);

private["_cv"];
//generic function for placing composition objects
_cv = A_object_fnc_editor_create;


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

#define OIL_DERRICK_BARREL(id,index) (missionNamespace getVariable [format["barrel%1_%2", index, id], objNull])


[OIL_DERRICK_BARREL(_id,1)] call A_oil_derrick_fnc_barrel_setup;
[OIL_DERRICK_BARREL(_id,2)] call A_oil_derrick_fnc_barrel_setup;
[OIL_DERRICK_BARREL(_id,3)] call A_oil_derrick_fnc_barrel_setup;
