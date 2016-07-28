// A_client_fnc_check_armed_stunning

#include "..\..\includes\macro.h"


ARGV(0,_player);

if (undefined(was_stunning_count)) then { was_stunning_count = 0; };
if (undefined(A_stun_var_A_stun_var_stunning) ) then { A_stun_var_A_stun_var_stunning = false;};
if (undefined(was_stunning)) then { was_stunning = false;};

private["_delay"];
_delay = 30;
//Delayed check for player A_stun_var_stunning within the last X seconds
if (A_stun_var_stunning) then 	{ 
	was_stunning = true; 
	was_stunning_count = 0;
}
else { if ( !A_stun_var_stunning && was_A_stun_var_stunning) then {
	if (was_stunning_count < _delay) then { was_stunning_count = was_stunning_count + 1;};
	if (was_stunning_count >= _delay) then { was_stunning = false; was_stunning_count = 0;};
};};

//player groupChat format["A_stun_var_A_stun_var_stunning: %1, WAS A_stun_var_A_stun_var_stunning: %2", A_stun_var_stunning, was_A_stun_var_stunning];
was_stunning
