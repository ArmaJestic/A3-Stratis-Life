// A_drag_fnc_init

#include "header.h"


A_drag_var_attach_data = [
	["Skeet_Clay_F", [["Left Hand", "LeftHandMiddle1", [0,0,-0.05], [90,90,0]]]],
	["Land_HandyCam_F", [["Left Hand", "LeftHandMiddle1", [0,0,-0.05], [180,0,0]]]],
	["CatShark_F", [["Left Hand", "LeftHandMiddle1", [0.1,0.3,-0.25], [10,-35,0]]]],
	["Rabbit_F", [["Left Hand", "LeftHandMiddle1", [0,-0.1,0.35], [-10,-45,90]]]],
	["Tuna_F", [["Left Hand", "LeftHandMiddle1", [0.1,0.45,-0.32], [10,-35,0]]]],
	["Mackerel_F", [["Left Hand", "LeftHandMiddle1", [0.02,0.1,-0.1], [5,-35,0]]]],
	["Salema_F", [["Left Hand", "LeftHandMiddle1", [-0.01,-0.05,-0.1], [0,0,0]]]],
	["Land_Bucket_F", [["Left Hand", "LeftHandMiddle1", [-0.115,0,-0.15], [0,0,0]]]],
	["Land_File2_F", [["Left Hand", "LeftHandMiddle1", [-0.01,-0.05,-0.1], [0,0,-90]]]],
	["Land_Axe_fire_F", [["Left Hand", "LeftHandMiddle1", [0,0.2,-0.1], [90,-90,0]]]],
	["Land_Shovel_F", [["Left Hand", "LeftHandMiddle1", [0,0.2,-0.15], [0,-30,0]]]],
	["Land_Axe_F", [["Left Hand", "LeftHandMiddle1", [0,0.2,0], [90,90,0]]]],
	["Land_Money_F", [["Left Hand", "LeftHandMiddle1", [-0.01,-0.05,0], [0,0,-90]]]],
	["Land_Suitcase_F", [["Left Hand", "LeftHandMiddle1", [-0.01,-0.05,-0.18], [90,0,0]]]],
	["Land_CanisterFuel_F", [["Right Hand", "LeftHandMiddle1", [-0.01,-0.05,-0.28], [-90,0,0]]]],
	["Land_Grinder_F", [["Right Hand", "LeftHandMiddle1", [-0.05,0,0], [180,0,0]]]],
	["Land_File_F", [["Right Hand", "LeftHandMiddle1", [0,0.1,0], [180,0,0]]]],
	["Land_CanisterPlastic_F", [["Left Hand", "LeftHandMiddle1", [-0.3,-0.05,-0.27], [0,0,25]]]]
];

A_drag_var_weightless_classes = ["Land_WoodPile_F", "Animal", "Land_MetalBarrel_F"];

A_drag_var_attach_index = [];

{
	private _entry = _x;
	private _class = _entry select INDEX_ATTACH_CLASS;
	A_drag_var_attach_index pushBack _class;
} forEach A_drag_var_attach_data;