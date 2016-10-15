// A_bombs_fnc_init_pre

#include "..\..\includes\macro.h"


if (isServer) then {
	missionNamespace setVariable["A_bombs_var_serverbombarray",[],true];
}else{
	A_bombs_var_localbombarray = [];
};