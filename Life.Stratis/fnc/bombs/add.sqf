// A_bombs_fnc_add

#include "..\..\includes\macro.h"


A_bombs_var_inv_serverbombarray = A_bombs_var_inv_serverbombarray + [[ (_this select 1), (_this select 2), (_this select 3), (_this select 4), (_this select 5) ]];
if (player == (_this select 0)) then {
	A_bombs_var_inv_localbombarray = A_bombs_var_inv_localbombarray + [[ (_this select 1), (_this select 2), (_this select 3), [] ]];
};
