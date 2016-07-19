class civcamdialog {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, Background};
	objects[] = { };
	controls[] = {dauer_slider, text1, camlist, text2, seconds, text3, cost, submit, dummybutton};
	class DLG_BACK1: RscBackground {
		x = 0.32; y = 0.23;
		w = 0.38; h = 0.24;
	};

	class background : RscBgRahmen {
		x = 0.32; y = 0.23;
		w = 0.38; h = 0.24;

		text = $STRD_description_civcam_title;
	};

	class dauer_slider : RscSliderH {
		idc = 2;
		x = 0.33; y = 0.31;
		w = 0.35; h = 0.04;
	};

	class text1 : RscText {
		x = 0.28; y = 0.26;
		w = 0.22; h = 0.04;

		style = ST_RIGHT;
		text = $STRD_description_civcam_chooseciv;
	};

	class camlist : RscCombo {
		idc = 1;
		x = 0.50; y = 0.26;
		w = 0.17; h = 0.04;
	};

	class text2 : RscText {
		x = 0.33; y = 0.37;
		w = 0.07; h = 0.04;

		style = ST_RIGHT;
		text = "Time: ";
	};

	class seconds : RscText {
		idc = 5;
		x = 0.40; y = 0.37;
		w = 0.04; h = 0.04;

		text = "s";
	};

	class text3 : RscText {
		x = 0.45; y = 0.37;
		w = 0.12; h = 0.04;

		style = ST_RIGHT;
		text = $STRD_description_civcam_cost;
	};

	class cost : RscText {
		idc = 3;
		x = 0.56; y = 0.37;
		w = 0.10; h = 0.04;
		text = "$";
	};
	
	class submit : RscButton {
		x = 0.41; y = 0.42;
		w = 0.17; h = 0.04;

		text = $STRD_description_civcam_submit;
		action = "[player, (missionNamespace getVariable(lbData [1, lbCurSel 1])), round([(sliderPosition 2)] call A_misc_fnc_parse_number)] call A_interaction_fnc_civilian_camera; closeDialog 0";
	};

	class dummybutton : RscDummy {
		idc = 1002;
	};
};

class wantedrelease {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background, trennlinie1, trennlinie2};
	objects[] = { };
	controls[] = {civlist, kopfgeld_eingabe, cost, header1, submit, header2, cancel, civlist2, submit2, set_unwanted, dummybutton};

	class DLG_BACK1: RscBackground {
		x = 0.16; y = 0.25;
		w = 0.70; h = 0.24;
	};

	class background : RscBgRahmen {
		x = 0.16; y = 0.25;
		w = 0.70; h = 0.24;
	};

	class civlist : RscCombo {
		idc = 1;
		x = 0.17; y = 0.33;
		w = 0.19; h = 0.04;
	};

	class kopfgeld_eingabe : RscEdit {
		idc = 2;
		x = 0.17; y = 0.38;
		w = 0.31; h = 0.04;
		text = "Description of crime";

	};

	class cost : RscText {
		idc = 3;
		x = 0.36; y = 0.33;
		w = 0.16; h = 0.04;
		text = "Reason:";
	};

	class header1 : RscText {
		x = 0.17; y = 0.28;
		w = 0.31; h = 0.04;

		style = ST_CENTER;
		text = $STRD_description_wantedrelease_setwantedmenu;
	};

	class trennlinie1 : RscText {
		x = 0.49; y = 0.25;
		w = 0.02; h = 0.24;
		style = ST_FRAME;
	};

	class submit : RscButton {
		x = 0.17; y = 0.43;
		w = 0.15; h = 0.04;

		text = $STRD_description_submit;
		action = "[player, (missionNamespace getVariable (lbData [1, lbCurSel 1])), (ctrlText 2)] call A_interaction_fnc_want_player; closeDialog 0";
	};

	class header2 : RscText {
		x = 0.52; y = 0.28;
		w = 0.30; h = 0.04;

		style = ST_CENTER;
		text = $STRD_description_wantedrelease_prisonrelease_title;
	};

	class trennlinie2 : RscText {
		x = 0.52; y = 0.39;
		w = 0.33; h = 0.01;

		style = ST_FRAME;
	};

	class cancel : RscButton {
		x = 0.58; y = 0.43;
		w = 0.20; h = 0.04;

		text = $STRD_description_cancel;
		action = "closedialog 0";
	};

	class civlist2 : RscCombo {
		idc = 11;
		x = 0.52; y = 0.33;
		w = 0.14; h = 0.04;
	};

	class submit2 : RscButton {
		x = 0.67; y = 0.33;
		w = 0.15; h = 0.04;

		text = $STRD_description_wantedrelease_submit;
		action = "[player, (missionNamespace getVariable (lbData [11, lbCurSel 11]))] call A_interaction_fnc_release_player; closeDialog 0";
	};

	class set_unwanted : RscButton {
		x = 0.32; y = 0.43;
		w = 0.16; h = 0.04;

		text = $STRD_description_wantedrelease_submit_unwanted;
		action = "[player, (missionNamespace getVariable (lbData [1, lbCurSel 1]))] call A_interaction_fnc_unwant_player; closeDialog 0";
	};

	class dummybutton : RscDummy {
		idc = 1007;
	};
};

class gang_menu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = {};
	controls[] = {
		button_join, 
		button_leave, 
		button_manage, 
		button_create, 
		listbox_gilden, 
		dummybutton
	};

	class DLG_BACK1: RscBackground {
		x = 0.06; y = 0.15;
		w = 0.87; h = 0.27;
	};

	class background : RscBgRahmen {
		x = 0.06; y = 0.15;
		w = 0.87; h = 0.27;
		text = "Gangs";
	};

	class button_join : RscButton {
		x = 0.08; y = 0.19;
		w = 0.20; h = 0.04;

		text = "Join gang";
		action = "[player, (lbData [202, (lbCurSel 202)])] call A_interaction_fnc_gang_join; closedialog 0;";
	};

	class button_leave : RscButton {
		x = 0.50; y = 0.19;
		w = 0.20; h = 0.04;

		text = "Leave gang";
		action = "[player] call A_interaction_fnc_gang_leave; closedialog 0;";
	};

	class button_manage : RscButton {
		x = 0.29; y = 0.19;
		w = 0.20; h = 0.04;

		text = "Manage gang";
		action = "closedialog 0; [player, (lbData [202, (lbCurSel 202)])] call A_interaction_fnc_gang_manage_menu;";
	};

	class button_create : RscButton {
		x = 0.71; y = 0.19;
		w = 0.20; h = 0.04;

		text = "Create gang";
		action = "closedialog 0; [player] call A_interaction_fnc_gang_create_menu;";
	};

	class listbox_gilden : RscListBox {
		idc = 202;
		x = 0.08; y = 0.25;
		w = 0.84; h = 0.15;
	};

	class dummybutton : RscDummy {
		idc = 1018;
	};
};

class gilde_gruenden {
	idd = 2001;
	movingEnable = true;
	controlsBackground[] = {DLG_BACK1, background};
	objects[] = { };
	controls[] = {gildenname, submit, cancel, text_name, dummybutton, hinweis};
	
	class DLG_BACK1: RscBackground {
		x = 0.25; y = 0.32;
		w = 0.49; h = 0.34;
	};

	class background : RscBgRahmen {
		x = 0.25; y = 0.32;
		w = 0.49; h = 0.34;

		text = "Create a new gang";
	};

	class gildenname : RscEdit {
		idc = 1;
		x = 0.29; y = 0.42;
		w = 0.41; h = 0.04;
		
		onChar = "[_this, 1] call KeyPressHandler;";
	};

	class submit : RscButton {
		idc = 11;
		x = 0.29; y = 0.47;
		w = 0.20; h = 0.04;

		text = "Create";
		action = "[player, (ctrlText 1)] call A_interaction_fnc_gang_create; closedialog 0;";
	};

	class cancel : RscButton {
		idc = 3;
		x = 0.50; y = 0.47;
		w = 0.20; h = 0.04;

		text = "Cancel";
		action = "closedialog 0;";
	};

	class text_name : RscText {
		idc = 4;
		x = 0.29; y = 0.37;
		w = 0.20; h = 0.04;

		text = "Gang name:";
	};

	class dummybutton : RscDummy {
		idc = 1019;
	};

	class hinweis : RscText {
		idc = 5;
		x = 0.29; y = 0.52;
		w = 0.41; h = 0.12;
		style = ST_MULTI;
		linespacing = 1;
		text = "";
	};
};

class GCheckBox {
	idc = -1;
	type = 7;
	style = 2;
	
	colorText[] = {1, 1, 1, 1};
	color[] = {0, 1, 0, 1};
	colorTextSelect[] = {0, 0.8, 0, 1};
	colorSelectedBg[] = {1, 1, 1, 0};
	colorSelect[] = {0, 0, 0, 1};
	colorTextDisable[] = {0.4, 0.4, 0.4, 1};
	colorDisable[] = {0.4, 0.4, 0.4, 1};
	font = "PuristaMedium";
	SizeEX=0.025;
	rows = 1;
	columns = 1;
	strings[] = {""};
};

class manage_gang_menu {
	idd = -1;
	movingEnable = true;
	controlsBackground[] = {box_background, box_frame};
	objects[] = {};
	controls[] = {
		members_list, 
		kick_member_button,
		make_leader_button,
		open_checkbox,
		open_checkbox_label,
		close_button, 
		dummybutton
	};

	class box_background : Rscbackground {
		moving = 1;
		x = 0.24; y = 0.11;
		w = 0.42; h = 0.66;
	};

	class box_frame : RscBgRahmen {
		moving = 1;
		idc = 101;
		x = 0.24; y = 0.11;
		w = 0.42; h = 0.66;
		text = "Manage Gang";
	};

	class members_list : RscListBox {
		idc = 102;
		x = 0.26; y = 0.15;
		w = 0.38; h = 0.38;
	};
	
	class open_checkbox_label : RscText {
		idc = 202;
		x = 0.26; y = 0.55;
		w = 0.38; h = 0.04;
		text = "Gang open";
	};
	
	class open_checkbox: GCheckBox {
		x = 0.26; y = 0.55;
		w = 0.38; h = 0.04;
		onCheckBoxesSelChanged = "[player] call A_interaction_fnc_gang_toggle_open; call A_interaction_fnc_gang_update_open_cbox;";
	};

	class kick_member_button : RscButton {
		idc = 103;
		x = 0.26; y = 0.60;
		w = 0.38; h = 0.04;

		text = "Kick";
		action = "[player, (lbData [102, (lbCurSel 102)])] call A_interaction_fnc_gang_kick; closedialog 0;";
	};
	
	class make_leader_button : RscButton {
		idc = 104;
		x = 0.26; y = 0.65;
		w = 0.38; h = 0.04;

		text = "Make Leader";
		action = "[player, (lbData [102, (lbCurSel 102)])] call A_interaction_fnc_gang_make_leader; closedialog 0;";
	};

	class close_button : RscButton {
		x = 0.26; y = 0.70;
		w = 0.38; h = 0.04;

		text = "Close";
		action = "closedialog 0;";
	};
	
	class dummybutton : RscDummy {
		idc = 1022;
	};
};


