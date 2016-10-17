// A_object_fnc_init

#include "..\..\includes\macro.h"


A_object_var_atm_classes = ["Man","Land_CargoBox_V1_F","BarrelBase","Barrels","Land_Laptop_unfolded_F","Land_CampingTable_F","Land_CampingTable_small_F"];
if (isServer) then {
	call A_object_fnc_create_attach_reference;
}else{
	[player] call A_object_fnc_createStorage;
};