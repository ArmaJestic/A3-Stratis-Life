// init2

#include "..\..\includes\macro.h"

if (isServer) then {
	while {true} do {
		sleep A_bank_var_zinsen_dauer;
		"[] spawn A_bank_fnc_interest;" call A_broadcast_fnc_broadcast;
	};
};

private["_uid"];
_uid = getPlayerUID player;

if (_uid in A_bank_var_donators1) then {
    A_bank_var_startmoneh = A_bank_var_donatormoneh;
}else{
	if (_uid in A_bank_var_donators2) then {
		A_bank_var_startmoneh = A_bank_var_silvermoneh;
	}else{ 
		if (_uid in A_bank_var_donators3) then {
			A_bank_var_startmoneh = A_bank_var_goldmoneh;
		}else{ 
			if (_uid in A_bank_var_donators4) then {
				A_bank_var_startmoneh = A_bank_var_platinummoneh;
			};
		};
	};
};

if ([player] call A_player_fnc_admin) then {
	A_bank_var_A_bank_var_startmoneh = A_bank_var_A_bank_var_startmoneh + A_bank_var_adminmoneh;
};

if (undefined(bankaccount)) then {
	["bankaccount", ([A_bank_var_startmoneh] call A_encoding_fnc_encode_number)] call A_stats_fnc_init_variable;
};