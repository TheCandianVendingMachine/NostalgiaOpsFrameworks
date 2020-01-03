#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Executes a code once in unscheduled environment after a condition is true.
 * It's also possible to add a timeout >= 0, in which case a different code is executed.
 * Then it will be waited until _timeout time has elapsed or _condition evaluates to true.
 *
 * Arguments:
 * 0: condition <CODE>
 * 1: statement <CODE>
 * 2: args (optional) <ANY>
 *
 * Return Value:
 * this - Parameters passed by this function. Same as '_args' above. <ANY>
 *
 * Example:
 * [{(_this select 0) == vehicle (_this select 0)}, {(_this select 0) setDamage 1;}, [player]] call nos_main_fnc_waitUntilAndExecute;
 *
 * Public: Yes
 */
PARAMS_2(_condition,_statement);
DEFAULT_PARAM(2,_args,[]);

GVAR(waitUntilAndExecArray) set [count GVAR(waitUntilAndExecArray), [_condition, _statement, _args]];
_args

