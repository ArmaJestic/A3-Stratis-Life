// A_voting_menu_fnc_init_pre

#include "header.h"


A_voting_menu_var_police_election_data = [];
A_voting_menu_var_president_election_data = [];

A_voting_menu_var_police_election_data set [INDEX_DATA_ELEC_ID, "police_chief"];
A_voting_menu_var_police_election_data set [INDEX_DATA_ELEC_TITLE, "Police Chief"];
A_voting_menu_var_police_election_data set [INDEX_DATA_ELEC_ROLE, "police chief"];
A_voting_menu_var_police_election_data set [INDEX_DATA_ELEC_NOMI_PERIOD, 60];
A_voting_menu_var_police_election_data set [INDEX_DATA_ELEC_ELEC_PERIOD, 60];
A_voting_menu_var_police_election_data set [INDEX_DATA_ELEC_OVER_CALLBACK, "A_voting_menu_fnc_election_police_over"];
A_voting_menu_var_police_election_data set [INDEX_DATA_ELEC_NOMI_FILTER, "A_voting_menu_fnc_nomination_police_filter"];

A_voting_menu_var_president_election_data set [INDEX_DATA_ELEC_ID, "president"];
A_voting_menu_var_president_election_data set [INDEX_DATA_ELEC_TITLE, "Presidential"];
A_voting_menu_var_president_election_data set [INDEX_DATA_ELEC_ROLE, "president"];
A_voting_menu_var_president_election_data set [INDEX_DATA_ELEC_NOMI_PERIOD, 10];
A_voting_menu_var_president_election_data set [INDEX_DATA_ELEC_ELEC_PERIOD, 10];
A_voting_menu_var_president_election_data set [INDEX_DATA_ELEC_OVER_CALLBACK, "A_voting_menu_fnc_election_president_over"];
A_voting_menu_var_president_election_data set [INDEX_DATA_ELEC_NOMI_FILTER, ""];