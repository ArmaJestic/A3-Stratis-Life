// A_doors_fnc_doors_KeyDownHandler

#include "header.h"


params["_displ","_key","_shift","_ctrl","_alt"];

if (_key == DIK_LSHIFT && !(A_doors_var_doors_lcontrol_state)) then {
	A_doors_var_doors_lcontrol_state = true;
};