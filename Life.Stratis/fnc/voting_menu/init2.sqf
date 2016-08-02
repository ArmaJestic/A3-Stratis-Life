// init2

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


A_voting_menu_var_police_election_data set [A_voting_menu_var_election_data_id, "police_chief"];
A_voting_menu_var_police_election_data set [A_voting_menu_var_election_data_title, "Police Chief"];
A_voting_menu_var_police_election_data set [A_voting_menu_var_election_data_role, "police chief"];
A_voting_menu_var_police_election_data set [A_voting_menu_var_election_data_nomination_period, 60];
A_voting_menu_var_police_election_data set [A_voting_menu_var_election_data_election_period, 60];
A_voting_menu_var_police_election_data set [A_voting_menu_var_election_data_over_callback, "A_voting_menu_fnc_election_police_over"];
A_voting_menu_var_police_election_data set [A_voting_menu_var_election_data_nomination_filter, "A_voting_menu_fnc_nomination_police_filter"];

A_voting_menu_var_president_election_data set [A_voting_menu_var_election_data_id, "president"];
A_voting_menu_var_president_election_data set [A_voting_menu_var_election_data_title, "Presidential"];
A_voting_menu_var_president_election_data set [A_voting_menu_var_election_data_role, "president"];
A_voting_menu_var_president_election_data set [A_voting_menu_var_election_data_nomination_period, 10];
A_voting_menu_var_president_election_data set [A_voting_menu_var_election_data_election_period, 10];
A_voting_menu_var_president_election_data set [A_voting_menu_var_election_data_over_callback, "A_voting_menu_fnc_election_president_over"];
A_voting_menu_var_president_election_data set [A_voting_menu_var_election_data_nomination_filter, ""];