/*
	old attempt, useless
*/
#define compSQF(FILE) compile preprocessFileLineNumbers FILE;

#define ExecSQFpass(PASS, FILE) PASS call compSQF(FILE)
#define ExecSQF(FILE) ExecSQFpass([], FILE)

#define ExecSQFspawnpass(PASS, FILE) PASS spawn compSQF(FILE)
#define ExecSQFspawn(FILE) ExecSQFspawnpass([], FILE)

#define ExecSQFwaitpass(PASS, FILE) private _handler = ExecSQFspawnpass(PASS, FILE) waitUntil{scriptDone _handler};
#define ExecSQFwait(FILE) ExecSQFwaitpass([], FILE)

#define SleepWait(X) private _waittt = time + X; waitUntil {time >= _waittt};
