#define YEAR 2012
#define INIT_DATE [YEAR,01,27,10,30]
#define DAYSYEAR 366
#define SECSDAY 86400 // 24*60*60

#define VAR_PV_RESET A_time_var_pv_reset
#define QVAR_PV_RESET #VAR_PV_RESET

#define VAR_TIME_RISE_TO_SET_MINS A_time_var_sunrise_to_sunset_minutes
#define QVAR_TIME_RISE_TO_SET_MINS #VAR_TIME_RISE_TO_SET_MINS

#define VAR_TIME_SET_TO_RISE_MINS A_time_var_sunset_to_sunrise_minutes
#define QVAR_TIME_SET_TO_RISE_MINS #VAR_TIME_SET_TO_RISE_MINS

#define VAR_TIME_OFFSET time_offset
#define QVAR_TIME_OFFSET #VAR_TIME_OFFSET

#define VAR_TIME_RISE_TO_SET A_time_var_sunrise_to_sunset
#define VAR_TIME_SET_TO_RISE A_time_var_sunset_to_sunrise
#define VAR_TIME_FULL_DAY time_full_day