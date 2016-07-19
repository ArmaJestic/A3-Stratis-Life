/*
	Includes file to use for others/all
	Call with
	[] call compile preprocessFileLineNumbers "includes\includes.h";
	or use
	fnc_includes = compile preprocessFileLineNumbers "includes\includes.h";
	[] call fnc_includes;
	No need for 20 copies of the same .h file
*/
#define compSQF(FILE) compile preprocessFileLineNumbers FILE;

#define ExecSQFpass(PASS, FILE) PASS call compSQF(FILE)
#define ExecSQF(FILE) ExecSQFpass([], FILE)

#define ExecSQFspawnpass(PASS, FILE) PASS spawn compSQF(FILE)
#define ExecSQFspawn(FILE) ExecSQFspawnpass([], FILE)

#define ExecSQFwaitpass(PASS, FILE) private["_handler"]; _handler = ExecSQFspawnpass(PASS, FILE) waitUntil{scriptDone _handler};
#define ExecSQFwait(FILE) ExecSQFwaitpass([], FILE)

#define SleepWait(timeA) private["_waittt"]; _waittt = time + timeA; waitUntil {time >= _waittt};
