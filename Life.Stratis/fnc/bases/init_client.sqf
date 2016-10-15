// A_bases_fnc_init_client
// runs setup for all the bases

#include "header.h"


// underwater bases
A_bases_var_underwater_transition1_active = false;
A_bases_var_underwater_transition2_active = false;

{
	(_x select 1) call A_bases_fnc_underwater_setup_lights;
	false
} count A_bases_var_underwater;


// oil derrick
A_bases_var_oil_derrick_sound = MISSION_ROOT+"sounds\oil_derrick.ogg";
{
	(_x select 0) call A_bases_fnc_oil_derrick_effects;
	false
} count A_bases_var_oil_derrick;


// bunker
A_bases_var_bunker_actions = [];