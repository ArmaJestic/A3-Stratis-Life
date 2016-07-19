// A_bunker_fnc_create_underground

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_bunker_data);
ARGV(1,_object);
ARGV(2,_offset);
ARGV(3,_heading);

private["_ref"];
_ref = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "NONE"];
[_ref, _object,  _offset, _heading, false] call A_object_fnc_fake_attach;
[[_ref, true], "A_object_fnc_remote_hideObject", true, true, _ref] call A_jip_fnc_register;

bunker_setup_ref = _ref;
publicVariable "bunker_setup_ref";


private["_cv"];
//generic function for placing composition objects
_cv = A_object_fnc_editor_create;

//composition objects
["Land_Bunker_F",[-6.09998,7.00488,324.112],[180,0,0],false,true,false,"bunker_door1",false,"",false,_ref] call _cv;
["Land_LampShabby_F",[-6.19995,8.00488,323.4],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-14,2.00488,328.412],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Bunker_F",[-13.6,7.00488,324.119],[180,0,0],false,true,false,"bunker_door2",false,"",false,_ref] call _cv;
["Land_LampShabby_F",[-13.7,8.00488,323.4],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_TentHangar_V1_F",[-9.69995,20.0049,324.412],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-5,28.0049,318.412],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[6,27.5049,328.405],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-8.5,27.4248,334.397],[270,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-18.5,27.6353,334.39],[90,5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-19.5,28.0049,318.418],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-25.2931,27.5049,328.311],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_TentHangar_V1_F",[-9.69995,36.0049,324.412],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.4,43.0049,328.387],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[20,51.0049,318.387],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.407,53.0049,334.387],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_HQ_V1_F",[10,58.8047,327],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_LampHalogen_F",[39,49.5049,322.4],[60,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[45.3931,44.5,328.4],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[20,65.5049,318.394],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-5,69.0049,318.405],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-8.5,69.0049,334.404],[270,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.407,67.5049,334.38],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-18.5,69.2051,334.397],[90,5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-19.5,69.0049,318.411],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-25.3,69.0049,328.311],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_IndPipe1_90degL_F",[36.8,66.0049,330.33],[181.129,-90,90],false,true,false,"",false,"",false,_ref] call _cv;
["Land_IndPipe1_valve_F",[37,70.0049,329.1],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[20,80.0049,318.4],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_House_V1_F",[6,83.5049,323.9],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_House_V1_F",[14,83.5049,323.9],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.4139,82.0049,334.374],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Sign_Sphere100cm_F",[30,80,300],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_House_V1_F",[22,83.5049,323.9],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Cargo_House_V1_F",[30,83.5049,323.9],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_LampHalogen_F",[-19,88.5049,322.4],[240,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_IndPipe1_20m_F",[37.2,83.0049,329.3],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[15.1,94.7998,328.3],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[54.425,80.02,308],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[45.4,86,328.4],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[-25.9,94.79,328.3],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[21.4199,96.5049,334.369],[180,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[42,92,287.089],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Airport_Tower_F",[42,92,320.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[25.1,100,334.5],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[27.5,103,294.089],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[50.3,95,337.35],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[32.4,102.9,337.35],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[32.2426,103.337,322.299],[-0.546764,90,90],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[27.5,112,294.589],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[52,104,294.089],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[42,111,287.096],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[34.6953,111.79,322.301],[179.758,90,90],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[52.08,112,294.089],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.7,127,305.469],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_LampStreet_F",[9.69995,130.5,310.989],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6791,130.5,318.99],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_MilOffices_V1_F",[27.7,133.5,312.989],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_Box_F",[42,130,287.082],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_LampStreet_F",[43.7,130.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[4.65918,142,315.478],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.693,141,305.476],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.7,144.1,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6791,144.5,318.983],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_spp_Transformer_F",[40.7999,143.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[50.6592,142,315.478],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_New_WiredFence_10m_F",[35.7,147.5,311.389],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_PowLines_Transformer_F",[40.7,146.5,310.989],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.6699,152.4,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_spp_Transformer_F",[40.7999,149.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[16.653,155.4,311.989],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_New_WiredFence_pole_F",[36.0499,152.6,311.389],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.686,155,305.483],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_PowLines_Transformer_F",[40.7,152.7,310.989],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_spp_Transformer_F",[40.7999,155.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6721,158.5,318.978],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.6639,160.4,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_New_WiredFence_10m_F",[35.7,159.3,311.389],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_PowLines_Transformer_F",[40.7,158.9,310.989],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[4.66614,165,315.485],[90,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[14.653,165.4,311.989],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_spp_Transformer_F",[40.7999,161.5,310.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_New_WiredFence_10m_F",[41,164.69,311.389],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.6589,168.4,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[50.6522,162,315.485],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6791,169,305.49],[180,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[21.653,171.4,311.989],[270,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6661,172.5,318.971],[5.00896e-006,-5.00896e-006,180],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Canal_WallSmall_10m_F",[16.653,175.4,311.989],[1.00179e-005,0,0],false,true,false,"",false,"",false,_ref] call _cv;
["Land_Pier_F",[27.6592,183,315.471],[180,1.00179e-005,0],false,true,false,"",false,"",false,_ref] call _cv;



private["_doors"];
_doors = [bunker_door1, bunker_door2];

{
	private["_door_data"];
	_door_data = [];
	_door_data set [A_bunker_var_door_data_action_label, format["Exit %1", (_bunker_data select A_bunker_var_data_name)]];
	_door_data set [A_bunker_var_door_data_action_callback, "A_bunker_fnc_exit"];
	_door_data set [A_bunker_var_door_data_offset, [0,-2,0]];
	_door_data set [A_bunker_var_door_data_distance, 3];
	_door_data set [A_bunker_var_door_data_target_heading, [180, 0,0]];
	_door_data set [A_bunker_var_door_data_target_offset_human, [0,-2,-1]];
	_door_data set [A_bunker_var_door_data_target_offset_vehicle, [0,-8,0.5]];
	_door_data set [A_bunker_var_door_data_source_netid, (netId _x)];

	[_x, "bunker_door_data", _door_data, true] call A_object_fnc_setVariable;
}  forEach(_doors);

_doors
