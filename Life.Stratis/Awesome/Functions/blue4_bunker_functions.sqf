#include "constants.h"
#include "macro.h"

if (not(undefined(blue4_bunker_functions_defined))) exitWith {};


blue4_bunker_create_underground = {
	ARGV(0,_bunker_data);
	ARGV(1,_offset);
	ARGV(2,_heading);
	
	private["_ref"];
	_ref = createVehicle ["Sign_Sphere10cm_F", [0,0,0], [], 0, "NONE"];
	[_ref, object_attach_reference,  _offset, _heading, false] call object_fake_attach;
	[[_ref, true], "remote_hideObject", true, true, _ref] call jip_register;


	private["_id"];
	_id = "";
	
	private["_cv"];
	//generic function for placing composition objects
	_cv = object_editor_create;

["Land_TacticalBacon_F",[10.6708,22.5977,1.75268],[378.445,0,0],true,true,true,"respawn_blue4_proxy",false,_id,false,_ref] call _cv;
["Land_TacticalBacon_F",[-0.838013,28.7397,0.0232203],[378.445,0,0],false,true,true,"blue4vehshopspawn",false,_id,false,_ref] call _cv;
["B_Soldier_lite_F",[4.57117,28.9165,-0.0301452],[-84.2676,0,0],false,true,true,"blue4vehshop",false,_id,false,_ref] call _cv;
["Land_Cargo_HQ_V1_F",[9.27026,23.8369,4.86906],[12.5241,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[11.0869,28.7988,14.9774],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[10.6243,25.2554,-4.65609],[12.5241,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Box_NATO_Wps_F",[7.65332,18.1108,1.8979],[-167.476,0,0],false,false,false,"blue4criminalshopbox",false,_id,false,_ref] call _cv;
["Box_NATO_Wps_F",[14.1763,28.3086,1.9879],[-167.476,0,0],true,false,false,"blue4patrolshopbox",false,_id,false,_ref] call _cv;
["Land_Pier_F",[8.09766,14.6885,14.9772],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Box_NATO_Support_F",[16.1135,27.8359,1.9879],[-77.4759,0,0],false,true,true,"blue4basicshopbox",false,_id,false,_ref] call _cv;
["Land_Pier_F",[13.7781,39.5781,-4.67609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Laptop_unfolded_F",[16.1495,23.2334,2.54302],[282.691,0,0],false,true,true,"blue4atm",false,_id,false,_ref] call _cv;
["Land_CampingTable_small_F",[16.1974,23.2349,1.98723],[-77.4759,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["B_supplyCrate_F",[17.9314,25.3027,1.69687],[-77.4759,0,0],false,true,true,"blue4clothesbox",false,_id,false,_ref] call _cv;
["Land_Pier_F",[7.31555,10.8154,5.80379],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[14.2178,42.8823,14.9364],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["B_soldier_repair_F",[19.3652,25.4795,-0.0208225],[103.019,0,0],false,true,true,"blue4swatvehshop",false,_id,false,_ref] call _cv;
["Box_NATO_WpsSpecial_F",[5.70776,18.5591,1.8979],[-167.476,0,0],false,false,false,"blue4swatshopbox",false,_id,false,_ref] call _cv;
["Land_Pier_F",[5.9563,6.04785,31.2946],[102.448,0.51025,-90.5746],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_TacticalBacon_F",[22.1146,20.7114,0.00852656],[381.253,0,0],false,true,true,"blue4swatvehshopspawn",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-27.2495,37.2759,14.9765],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["TapeSign_F",[-0.781738,0.708984,13.381],[41.015,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[5.28125,1.30811,-4.66185],[372.599,0.0314226,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-29.0646,36.9849,-4.67509],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["TapeSign_F",[-2.23157,0.219238,13.3868],[100.838,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_CncWall1_F",[-1.28687,0.0551758,14.8877],[102.208,0,0],false,true,false,"",true,_id,false,_ref] call _cv;
["Land_Pier_F",[-20.4025,6.78174,-4.66863],[102.617,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-30.3267,23.373,14.9764],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["TapeSign_F",[-1.07141,-0.79248,13.386],[-18.8109,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[16.9945,54.0415,-4.67609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-26.4745,48.5454,-4.68609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-24.1383,51.4072,14.9464],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Cargo_Tower_V1_F",[1.45361,-2.74414,10.5818],[12.3179,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-9.01379,-2.56543,15.8253],[101.817,-90.4154,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[17.2919,56.5156,14.9164],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-9.50928,-3.9917,20.1375],[14.3909,-179.718,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-24.8052,3.23291,14.9968],[12.0012,-180.01,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-34.1115,11.0229,-4.66637],[102.617,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-33.4143,9.43555,14.9864],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_LampHalogen_F",[-8.06433,67.5532,3.05732],[-76.3884,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-2.19824,-11.1665,31.1086],[282.633,-0.200537,-89.938],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-23.3047,63.0293,-4.68609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-21.0826,65.0723,14.9264],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[1.89905,-12.6826,5.80809],[192.518,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[20.4843,67.8843,-4.69609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[9.703,-14.4502,15.8261],[-77.3569,-90.4177,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_TentHangar_V1_F",[17.7159,71.1699,3.97296],[372.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[28.4268,-7.1875,14.9964],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-46.366,12.5581,-4.65627],[102.617,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-36.4651,-4.51221,14.9964],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_LampHalogen_F",[39.9581,56.1274,3.05732],[-70.4303,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[34.2081,-6.78174,-4.66711],[102.608,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-20.1952,76.9097,-4.70609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-52.484,38.6294,5.80379],[102.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[49.9829,20.1196,14.9564],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_TentHangar_V1_F",[-35.0996,69.6099,3.97296],[343.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[46.8983,6.28418,14.9664],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_ToiletBox_F",[-51.9419,9.90479,1.11697],[281.521,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[51.9863,20.0908,-4.68609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Bench_F",[49.1029,8.96924,0.221539],[12.7533,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Cargo_House_V1_F",[27.6365,-17.1104,1.51973],[-167.476,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[53.0841,34.1445,14.9464],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Bench_F",[48.4946,6.17236,0.202075],[11.8823,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_FieldToilet_F",[-52.3608,8.03174,1.18466],[281.802,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[54.2813,30.5737,-4.69608],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_CampingChair_V2_F",[50.963,9.19287,0.445099],[283.646,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_CampingChair_V2_F",[50.6465,7.94824,0.445771],[283.493,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_CampingChair_V2_F",[50.3165,6.60791,0.444754],[282.684,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_CampingChair_V2_F",[50.019,5.24805,0.450917],[284.049,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_CampingChair_V2_F",[52.7101,8.8042,0.463907],[284.919,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-39.6879,-14.499,5.80379],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_CampingChair_V2_F",[52.415,7.51953,0.462125],[284.681,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[12.6895,85.3091,-4.71609],[102.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_CampingChair_V2_F",[52.0464,6.18701,0.450422],[-78.6294,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[4.85669,87.0923,5.80379],[102.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Cargo40_brick_red_F",[54.291,11.5586,1.25729],[373.068,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[43.7009,-8.04053,14.9764],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[16.5992,84.6221,14.9064],[282.524,-180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_CampingChair_V2_F",[51.8364,4.86377,0.446065],[282.716,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[22.1553,83.3901,-4.70609],[282.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[24.9097,82.5825,14.8764],[102.524,-180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[56.0232,47.8804,14.9364],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[57.4214,44.7129,-4.70609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Cargo_House_V1_F",[36.048,-19.0313,1.51973],[-167.476,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-23.3048,86.0527,5.7948],[253.488,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_CampingTable_F",[54.7047,4.68066,0.36336],[464.019,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_SatellitePhone_F",[54.6019,4.13525,0.952152],[272.367,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["MapBoard_stratis_F",[55.9714,6.77197,0.921291],[449.667,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_LampHalogen_F",[-54.5795,-3.80127,3.05732],[142.558,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-32.2795,83.437,-4.67609],[253.488,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-34.5134,82.7729,14.9164],[433.488,-180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[48.2045,-9.90625,-4.67609],[102.608,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_TentHangar_V1_F",[21.4603,87.9878,3.97296],[372.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[36.1321,80.3491,5.80379],[282.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Cargo_House_V1_F",[51.9563,-6.10742,1.51973],[-257.476,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-41.3876,80.5869,-4.66609],[433.488,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-60.7471,1.48975,5.80379],[102.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-42.0369,80.7104,14.8964],[613.488,-180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_FieldToilet_F",[57.772,-0.138184,1.10683],[102.549,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[40.5526,-22.1914,14.9864],[12.5241,180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_ToiletBox_F",[57.2349,-2.52246,1.16745],[102.81,0,0],false,true,true,"",false,_id,false,_ref] call _cv;
["Land_Cargo_House_V1_F",[50.2039,-14.5469,1.51973],[-257.476,0,0],true,true,false,"",false,_id,false,_ref] call _cv;
["Land_Cargo_House_V1_F",[44.6304,-20.8711,1.51973],[-167.476,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_TentHangar_V1_F",[-40.0101,86.1309,3.97296],[343.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[60.5935,58.9858,-4.71609],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_TentHangar_V1_F",[65.9811,47.187,3.97296],[221.687,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-53.7538,76.2349,5.7948],[433.488,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_LampShabby_F",[23.4232,95.5444,0.529593],[-175.214,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[36.3279,-31.333,5.80379],[12.5241,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[68.7029,12.0142,5.80379],[-77.4759,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[62.0645,66.835,5.79601],[131.687,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[60.4092,-12.6606,-4.68579],[102.608,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_LampShabby_F",[-41.77,93.7656,0.529593],[-202.975,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_LampHalogen_F",[52.7385,-28.0029,3.05732],[66.2111,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[72.0831,58.2026,14.9323],[-48.3131,-180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[72.865,57.2134,-4.68608],[131.687,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[27.3126,105.506,5.80379],[192.524,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[60.416,-25.2275,5.80379],[-77.4759,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[78.6211,52.1309,14.9223],[131.687,-180,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_TentHangar_V1_F",[77.4526,60.0576,3.97296],[221.687,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[80.6012,50.5898,-4.69608],[311.687,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[-44.8907,103.837,5.7948],[163.488,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_Pier_F",[85.9042,45.457,5.79601],[311.687,0,0],false,false,false,"",false,_id,false,_ref] call _cv;
["Land_LampShabby_F",[83.4088,65.9858,0.529593],[-143.7,0,0],false,true,false,"",false,_id,false,_ref] call _cv;
["Land_Bunker_F",[84.2905,66.9741,0.898366],[41.6869,0,0],false,false,false,"blue4_bunker_door_l_u",false,_id,false,_ref] call _cv;
["Land_Bunker_F",[23.6367,96.8154,0.898366],[12.5241,0,0],false,false,false,"blue4_bunker_door_m_u",false,_id,false,_ref] call _cv;
["Land_Bunker_F",[-42.2218,94.9961,0.898366],[-16.5118,0,0],false,false,false,"blue4_bunker_door_r_u",false,_id,false,_ref] call _cv;
["Land_Pier_F",[89.4382,73.8325,5.79601],[221.687,0,0],false,false,false,"",false,_id,false,_ref] call _cv;

	private["_doors"];
	_doors = [blue4_bunker_door_l_u,blue4_bunker_door_m_u,blue4_bunker_door_r_u];
	
	{
		private["_door_data"];
		_door_data = [];
		_door_data set [bunker_door_data_action_label, format["Exit %1", (_bunker_data select bunker_data_name)]];
		_door_data set [bunker_door_data_action_callback, "bunker_exit"];
		_door_data set [bunker_door_data_offset, [0,-2,0]];
		_door_data set [bunker_door_data_distance, 3];
		_door_data set [bunker_door_data_target_heading, [180, 0,0]];
		_door_data set [bunker_door_data_target_offset_human, [0,-2,-1]];
		_door_data set [bunker_door_data_target_offset_vehicle, [0,-8,0.5]];
		_door_data set [bunker_door_data_source_netid, (netId _x)];
	
		[_x, "bunker_door_data", _door_data, true] call object_setVariable;
	}  forEach(_doors);
	
	_doors
};

blue4_bunker_create_entrance = {
	ARGV(0,_bunker_data);

	if (undefined(_bunker_data)) exitWith {};
	
	private["_ref"];
	_ref = object_attach_reference;
	
	private["_cv"];
	//generic function for placing composition objects
	_cv = object_editor_create;

	private["_id"];
	_id = "";
	
	
	["Land_Bunker_F",[2255.8,5645.79,0.917077],[85.2553,0,0],true,true,true,"blue4_bunker_door_m",true,_id,true,_ref] call _cv;
	["Land_Bunker_F",[2259.95,5688.95,1.03708],[461.732,0,0],false,true,true,"blue4_bunker_door_l",true,_id,true,_ref] call _cv;
	["Land_Bunker_F",[2260.66,5589.62,0.997076],[61.3999,0,0],true,true,true,"blue4_bunker_door_r",true,_id,true,_ref] call _cv;

	
	private["_objects"];
	_objects = [];



	private["_doors"];
	_doors = [blue4_bunker_door_l, blue4_bunker_door_m, blue4_bunker_door_r];
	
	{
		private["_door_data"];
		_door_data = [];
		_door_data set [bunker_door_data_action_label, format["Enter %1", (_bunker_data select bunker_data_name)]];
		_door_data set [bunker_door_data_action_callback, "bunker_enter"];
		_door_data set [bunker_door_data_offset, [0,-2,0]];
		_door_data set [bunker_door_data_distance, 3];
		_door_data set [bunker_door_data_target_heading, [180, 0,0]];
		_door_data set [bunker_door_data_target_offset_human, [0,-2,-1]];
		_door_data set [bunker_door_data_target_offset_vehicle, [0,-8,0.5]];
		_door_data set [bunker_door_data_source_netid, (netId _x)];
	
		[_x, "bunker_door_data", _door_data, true] call object_setVariable;
	}  forEach(_doors);
	
	{ detach _x; } forEach _objects;
	_doors
};


blue4_bunker_create = {
	ARGV(0,_name);
	ARGV(1,_offset);
	if (undefined(_name)) exitWith {};
	if (undefined(_offset)) exitWith {};
	
	
	private["_bunker_data"];
	_bunker_data = [];
	_bunker_data set [bunker_data_name, _name];
	
	private["_doors1", "_doors2"];
	_doors1 = [_bunker_data] call blue4_bunker_create_entrance;
	_doors2 = [_bunker_data, _offset, [-120,0,0]] call blue4_bunker_create_underground;
	[_doors1, _doors2] call bunker_match_doors;
};

if (isServer) then {
	["Blue4 Bunker", [2446.85,5686.52,8000]] call blue4_bunker_create;
	[west,"respawn_blue4"] call BIS_fnc_addRespawnPosition;
	blue4_bunker_setup_complete = true;
	publicVariable "blue4_bunker_setup_complete";
};

if (isClient) then {
	waitUntil {(not(isNil "blue4_bunker_setup_complete") && {blue4_bunker_setup_complete})};
	respawn_blue4_proxy setVariable ["respawn", true];
	respawn_blue4_proxy setVariable ["radius", 5];
};


blue4_bunker_functions_defined = true;