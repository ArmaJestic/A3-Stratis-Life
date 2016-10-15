#include "..\includes\constants.h"

class camera_menu {
	idd= camera_menu_idd;
	movingEnable=1;
	
	name = "CAMERA_MENU";
	onUnload = "";
	onLoad="uiNamespace setVariable['CAMERA_MENU', _this select 0]";
	
	controlsBackground[] = {
		camera_menu_background
	};
	
	objects[] = {};
	
	controls[] = {
		camera_menu_header,
		camera_menu_object_label, 
		camera_menu_object_field,
		camera_menu_input_label,
		camera_menu_input_field,
		camera_menu_command_label, 
		camera_menu_command_field,
		camera_menu_execute_button,
		camera_menu_close_button
	};
	
	class camera_menu_header: RscMenuTitle {
		idc = camera_menu_header_idc;
		text="";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		moving = 1;
	};
	
	class camera_menu_object_label: RscText {
		idc = camera_menu_object_label_idc;
		text="";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class camera_menu_object_field: RscCombo {
		idc = camera_menu_object_field_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	
	class camera_menu_input_label: RscText {
		idc = camera_menu_input_label_idc;
		text="";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class camera_menu_input_field: RscEdit {
		idc = camera_menu_input_field_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class camera_menu_command_label: RscText {
		idc = camera_menu_command_label_idc;
		text="";
		x = 0; y = 0;
		w = 0.01; h = 0.01;
	};
	
	class camera_menu_command_field: RscCombo {
		idc = camera_menu_command_field_idc;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
		text = "";
		moving = 1;
	};

	class camera_menu_execute_button: RscMenuButton {
		idc = camera_menu_execute_button_idc;
		text = "";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
	
	class camera_menu_close_button: RscMenuButton {
		idc = camera_menu_close_button_idc;
		text = "";
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};

	class camera_menu_background: RscBackground {
		idc = camera_menu_background_idc;
		moving = 1;
		x = -10; y = -10;
		w = 0.05; h = 0.05;
	};
};
