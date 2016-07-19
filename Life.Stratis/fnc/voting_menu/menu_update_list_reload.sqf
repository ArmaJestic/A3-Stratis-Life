// A_voting_menu_fnc_menu_update_list_reload

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_election_id);

if (undefined(_election_id)) exitWith {};

private["_candidates"];
_candidates = [_election_id] call A_voting_menu_fnc_get_candidates;
if (undefined(_candidates)) exitWith {};


private["_candidates_data"];
_candidates_data = _candidates select A_voting_menu_var_election_candidates_data;

private["_display"];
_display = (uiNamespace getVariable 'VOTING_MENU');
_voting_menu_list = _display displayCtrl voting_menu_list_idc;

lnbClear _voting_menu_list;
_voting_menu_list lnbAddRow ["","Nominee", "Votes", ""];

{
	private["_candidates_cdata"];
	_candidates_cdata = _x;
	private["_candidate_name", "_candidate_uid", "_candidate_votes"];
	_candidate_name = _candidates_cdata select A_voting_menu_var_election_candidates_data_entry_name;
	_candidate_uid = _candidates_cdata select A_voting_menu_var_election_candidates_data_entry_uid;
	_candidate_votes = [_candidates_cdata] call A_voting_menu_fnc_count_candidate_votes;
	
	private["_index"];
	_index = _voting_menu_list lnbAddRow ["",_candidate_name, str(_candidate_votes), ""];
	_voting_menu_list lnbSetData [[_index, 0], _candidate_uid];
	
} forEach _candidates_data
