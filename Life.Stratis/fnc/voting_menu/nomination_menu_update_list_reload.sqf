// A_voting_menu_fnc_nomination_menu_update_list_reload

#include "..\..\includes\constants.h"
#include "..\..\includes\macro.h"


ARGV(0,_election_id);
if (undefined(_election_id)) exitWith {};

private["_nominations"];
_nominations = [_election_id] call A_voting_menu_fnc_get_nominations;
if (undefined(_nominations)) exitWith {};




private["_nominations_data"];
_nominations_data = _nominations select A_voting_menu_var_election_nominations_data;

private["_display"];
_display = (uiNamespace getVariable 'VOTING_NOMINATION_MENU');
_voting_nomination_menu_list = _display displayCtrl voting_nomination_menu_list_idc;

lbClear _voting_nomination_menu_list;

private["_incumbent_candidate_data"];
_incumbent_candidate_data = [_election_id] call A_voting_menu_fnc_get_incumbent_candidate;

if (not(undefined(_incumbent_candidate_data))) then {
	private["_incumbent_candidate_name", "_incumbent_candidate_uid"];
	_inclumbent_candidate_name = _incumbent_candidate_data select A_voting_menu_var_election_candidates_data_entry_name;
	_inclumbent_candidate_uid = _incumbent_candidate_data select A_voting_menu_var_election_candidates_data_entry_uid;
	private["_index"];
	_index = _voting_nomination_menu_list lbAdd format["%1 (incumbent)", _inclumbent_candidate_name];
	_voting_nomination_menu_list lbSetData [_index, _inclumbent_candidate_uid];
};

{
	private["_nomination_cdata"];
	_nomination_cdata = _x;
	private["_nomination_name", "_nomination_uid"];
	_nomination_name = _nomination_cdata select A_voting_menu_var_election_nominations_data_entry_name;
	_nomination_uid = _nomination_cdata select A_voting_menu_var_election_nominations_data_entry_uid;

	private["_index"];
	_index = _voting_nomination_menu_list lbAdd _nomination_name;
	_voting_nomination_menu_list lbSetData [_index, _nomination_uid];
} forEach _nominations_data
