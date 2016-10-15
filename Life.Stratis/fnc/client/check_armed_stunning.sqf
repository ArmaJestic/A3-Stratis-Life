// A_client_fnc_check_armed_stunning

#include "..\..\includes\macro.h"


ARGV(0,_player);

if (UNDEFINED(was_stunning_count)) then {was_stunning_count = 0;};
if (UNDEFINED(A_stun_var_stunning) ) then {A_stun_var_stunning = false;};
if (UNDEFINED(A_stun_var_was)) then {A_stun_var_was = false;};

private["_delay"];
_delay = 30;
//Delayed check for player A_stun_var_stunning within the last X seconds
if (A_stun_var_stunning) then 	{ 
	A_stun_var_was = true; 
	was_stunning_count = 0;
}else{ 
	if ( !A_stun_var_stunning && A_stun_var_was) then {
		if (was_stunning_count < _delay) then { was_stunning_count = was_stunning_count + 1;};
		if (was_stunning_count >= _delay) then { A_stun_var_was = false; was_stunning_count = 0;};
	};
};

//player groupChat format["A_stun_var_stunning: %1, WAS A_stun_var_stunning: %2", A_stun_var_stunning, A_stun_var_was];
A_stun_var_was