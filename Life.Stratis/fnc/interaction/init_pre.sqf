// A_interaction_fnc_init_pre

#include "header.h"


if (isServer) exitwith {};

A_interaction_var_animation_list = [
	["", "Return to normal", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY],
	["DeadState", "Play dead (face down)", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY],
	["UnaErcPoslechVelitele4", "Hands Behind Back", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY],
	["AmovPercMstpSnonWnonDnon_Salute", "Salute (no weapon)", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY],
	["InBaseMoves_table1", "Lean on Table", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY],
	["KIA_gunner_standup01", "Play dead (on side)", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY],
	["KIA_passenger_flatground", "Relaxed Prayer", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY],
	["InBaseMoves_SittingRifle2", "Sit on chair", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY],
	["passenger_flatground_crosslegs", "Sit Cross Legs", "switchMove", INTERACT_INDEX_ANIM_HANDS_ANY]
];

A_interaction_var_rob_active = false;
A_interaction_var_gang_animation = false;
A_interaction_var_object_put_active = false;
A_interaction_var_item_put_active = false;
A_interaction_var_buy_item_active = false;

A_interaction_var_use_knife_active = false;
A_interaction_var_use_axe_active = false;
A_interaction_var_stone_hits = 0;
A_interaction_var_use_bucket_active = false;
A_interaction_var_crude_oil_barrel_hit_max = 50;
A_interaction_var_pump_barrel_hits_max = 5;
A_interaction_var_pump_barrel_hits = 0;