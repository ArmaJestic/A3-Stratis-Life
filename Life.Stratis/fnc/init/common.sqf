// A_init_fnc_common
// runs init for shared systems for client/server
// get rid of, too useless/restrictive

call A_inv_fnc_init_pre;
call A_object_fnc_init;
call A_drag_fnc_init;
call A_bombs_fnc_init;
call A_gang_fnc_init;
call A_factory_fnc_init;
call A_actions_fnc_init;
call A_wbl_fnc_init;
call A_client_fnc_init;
//tree init after tree set is redone