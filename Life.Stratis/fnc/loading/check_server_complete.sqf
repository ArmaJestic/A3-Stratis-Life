// A_loading_fnc_check_server_complete
// to check if server loading is complete
// just returns true/false

// server will skip over this part, needs to run init2 set before clients do
if (isServer) exitwith {true};

// only needed on client
missionNamespace getVariable[A_loading_var_name_server_done, false]