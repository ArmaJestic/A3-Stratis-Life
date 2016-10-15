// A_input_fnc_init

#include "..\..\includes\macro.h"
#include "..\..\includes\dikcodes.h"


A_input_var_stunned_allowed_actions = ["Chat", "NextChannel", "PrevChannel", "VoiceOverNet", "ShowMap", "PushToTalkAll", "PushToTalkCommand", "PushToTalkDirect", "PushToTalkGroup", "PushToTalkSide", "PushToTalkVehicle", "PushToTalkAll", "PushToTalk"];
A_input_var_overlapping_actions = ["LeanLeft", "LeanLeftToggle", "LeanRight",  "LeanRightToggle"];
A_input_var_overlapping_keys = [];
A_input_var_lookingaround = false;
A_input_var_lshift_down = false;
A_input_var_w_key_down = false;
A_input_var_w_key_down_count = 0;
A_input_var_s_key_down = false;
A_input_var_s_key_down_count = 0;
A_input_var_mute = false;

{
	private _action = _x;
	A_input_var_overlapping_keys pushBack (actionKeys _action);
} foreach A_input_var_overlapping_actions;

call A_input_fnc_setup;