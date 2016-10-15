// A_wbl_fnc_init

#include "..\..\includes\macro.h"


// todo: comments lost

A_wbl_var_active_pmc_1 = 1;
A_wbl_var_active_cop_1 = 2;

A_wbl_var_w_pmc_1 = [];
A_wbl_var_w_cop_1 = [];
A_wbl_var_b_pmc_1 = [];
A_wbl_var_b_cop_1 = [];

A_wbl_var_folder = "LISTS\";

A_wbl_var_wl_pmc_1 = format["%1WBL_white_list_pmc_1.log", A_wbl_var_folder];
A_wbl_var_wl_cop_1 = format["%1WBL_white_list_cop_1.log", A_wbl_var_folder];
A_wbl_var_bl_pmc_1 = format["%1WBL_black_list_pmc_1.log", A_wbl_var_folder];
A_wbl_var_bl_cop_1 = format["%1WBL_black_list_cop_1.log", A_wbl_var_folder];

A_wbl_var_pv_s_w_pmc_1 = [];
A_wbl_var_pv_s_b_pmc_1 = [];
A_wbl_var_pv_s_w_cop_1 = [];
A_wbl_var_pv_s_b_cop_1 = [];

A_wbl_var_pv_c_w_pmc_1 = [];
A_wbl_var_pv_c_b_pmc_1 = [];
A_wbl_var_pv_c_w_cop_1 = [];
A_wbl_var_pv_c_b_cop_1 = [];

A_wbl_var_lists = [
	["A_WBL_WL_PMC1", "A_wbl_var_w_pmc_1", A_wbl_var_wl_pmc_1, "A_wbl_var_pv_s_w_pmc_1", "A_wbl_var_pv_c_w_pmc_1"],
	["A_WBL_BL_PMC1", "A_wbl_var_b_pmc_1", A_wbl_var_bl_pmc_1, "A_wbl_var_pv_s_b_pmc_1", "A_wbl_var_pv_c_b_pmc_1"],
	
	["A_WBL_WL_COP1", "A_wbl_var_w_cop_1", A_wbl_var_wl_cop_1, "A_wbl_var_pv_s_w_cop_1", "A_wbl_var_pv_c_b_pmc_1"],
	["A_WBL_BL_COP1", "A_wbl_var_b_cop_1", A_wbl_var_bl_cop_1, "A_wbl_var_pv_s_b_cop_1", "A_wbl_var_pv_c_b_cop_1"]
];

A_wbl_var_lists_all = [
	["PMC_1", "A_WBL_WL_PMC1", "A_WBL_BL_PMC1", A_wbl_var_active_pmc_1],
	["COP_1", "A_WBL_WL_COP1", "A_WBL_BL_COP1", A_wbl_var_active_cop_1]
];

A_wbl_var_saving = false;

A_wbl_var_a_list_admins = [
	"1039168", 
	"815680",  
	"966656",  
	"146561",  
	"12544",  
	"4160710",  
	"3855360",  
	"8337542",  
	"9828358",  
	"9739718",  
	"4022918",  
	"6125382",  
	"31922886", 
	"35492678", 
	"36142086", 
	"1999302", 
	"11124934", 
	"2069056", 
	"26082630", 
	"24943814", 
	"15457926", 
	"11060102",
	"7547206",
	"33015174",
	"9784838",
	"36557446",
	"76476806",
	"34373126",
	"92317702",
	"4022278",
	"37713478",
	"610753AX",
	"36621830",
	"106972294",
	"21532166",
	"38764742",
	"55485737",
	"125700540",
	"0",
	"76561198085966268"
];

A_wbl_var_a_list_donators = [];

A_wbl_var_isadmin = (getPlayerUID player) in A_wbl_var_a_list_admins;


if (isServer) then {
	[] call A_wbl_fnc_init_s;
}else{
	[] call A_wbl_fnc_init_c;
};