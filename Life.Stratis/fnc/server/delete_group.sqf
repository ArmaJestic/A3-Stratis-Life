// A_server_fnc_delete_group

#include "header.h"


if (!isServer) exitWith {};

params[["_group",grpNull,[grpNull]]];
if (isNull _group) exitWith {};

//join a ranmdom unit into the group, and then make it leave 
//(not sure why this is needed, in order to be able to delete the groups)
[civ_logicunit] joinSilent _group;
[civ_logicunit] joinSilent (group server);

deleteGroup _group;