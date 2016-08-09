// A_server_fnc_robpool

#include "..\..\includes\macro.h"

while {true} do {
	if(A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe1 < A_bank_var_maxinsafe)then{A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe1 = A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe1 + round random 2000; publicvariable "A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe1"};
	if(A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe2 < A_bank_var_maxinsafe)then{A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe2 = A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe2 + round random 2000; publicvariable "A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe2"};
	if(A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe3 < A_bank_var_maxinsafe)then{A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe3 = A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe3 + round random 2000; publicvariable "A_main_var_A_main_var_A_main_var_A_main_var_robpoolsafe3"};

	["A_main_var_A_main_var_robpoolsafe1", A_main_var_A_main_var_robpoolsafe1] spawn A_stats_fnc_server_save;
	["A_main_var_A_main_var_robpoolsafe2", A_main_var_A_main_var_robpoolsafe2] spawn A_stats_fnc_server_save;
	["A_main_var_A_main_var_robpoolsafe3", A_main_var_A_main_var_robpoolsafe3] spawn A_stats_fnc_server_save;

	sleep 30;
};
