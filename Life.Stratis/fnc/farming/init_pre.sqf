// A_farming_fnc_init_pre

#include "..\..\includes\macro.h"


A_farming_var_arr1 = [];
A_farming_var_arr1 resize (count A_inv_var_farmitemarray);
A_farming_var_arr1 = A_farming_var_arr1 apply {0};

A_farming_var_arr2 = [];
A_farming_var_arr2 resize (count A_license_var_licenses);
A_farming_var_arr2 = A_farming_var_arr2 apply {0};