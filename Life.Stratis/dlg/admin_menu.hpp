#include "..\includes\constants.h"

class admin_menu {
	idd=-1;
	movingEnable=1;
	
	name = "ADMIN_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable['ADMIN_MENU', _this select 0]";
	
	controlsBackground[] = {
		background
	};
	
	objects[] = {};
	
	controls[] = {
		header,
		player_label, player_field,
		input_label, input_field,
		command_label, command_field,
		execute_button,
		close_button
	};
	
	class header: RscMenuTitle {
		idc = admin_menu_header_idc;
		text="";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};
	
	class player_label: RscText {
		idc = admin_menu_player_label_idc;
		text="";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class player_field: RscCombo {
		idc = admin_menu_player_field_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	
	class input_label: RscText {
		idc = admin_menu_input_label_idc;
		text="";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class input_field: RscEdit {
		idc = admin_menu_input_field_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class command_label: RscText {
		idc = admin_menu_command_label_idc;
		text="";
		x = 0; y = 0;
		w = 0.01; h = 0.01;
	};
	
	class command_field: RscCombo {
		idc = admin_menu_command_field_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		text = "";
		moving = 1;
	};

	class execute_button: RscMenuButton {
		idc = admin_menu_execute_button_idc;
		text = "";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class close_button: RscMenuButton {
		idc = admin_menu_close_button_idc;
		text = "";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};

	class background: RscBackground {
		idc = admin_menu_background_idc;
		moving = 1;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
};
