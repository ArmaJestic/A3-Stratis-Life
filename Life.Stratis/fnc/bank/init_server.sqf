// A_bank_fnc_init_server

#include "header.h"


[{[] remoteExec ["A_bank_fnc_interest",-2]},BANK_INTEREST_DELAY] call A_frame_fnc_perFrame;