#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Initialize NOS framework functions and variables
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call compile preProcessFileLineNumbers "nos_preInit.sqf"
 *
 * Public: No
 */
  
GVAR(onPlayerConnectEventHandlers) = [];
GVAR(lastTickTime) = diag_tickTime;
NOS_missionTime = 0;
GVAR(lastTime) = time;
GVAR(waitUntilAndExecArray) = [];

PREP(waitUntilAndExecute);

[QGVAR(hideObject), {
    PARAMS_2(_object,_hidden);
    _object hideObject _hidden;
}] call CBA_fnc_addEventHandler;

FUNC(addPlayerConnectEventHandler) = {
    PARAMS_1(_code);
    private "_uid";
    _uid = count GVAR(onPlayerConnectEventHandlers);
    GVAR(onPlayerConnectEventHandlers) set [_uid, _code];
    _uid
};

FUNC(removePlayerConnectEventHandler) = {
    PARAMS_1(_uid);
    if (_uid < count GVAR(onPlayerConnectEventHandlers) then {
        GVAR(onPlayerConnectEventHandlers) set [_uid, nil];
    };
};

onPlayerConnected = {
    {
        if !(isNil "_x") then {
            [_id, _uid, _name] call _x;
        };
    } forEach GVAR(onPlayerConnectEventHandlers);
};
/*
// increase NOS_missionTime variable every frame
if (isMultiplayer) then {
    // multiplayer - no accTime in MP
    if (isServer) then {
        // multiplayer server
        [QFUNC(missionTimePFH), {
            SCRIPT(missionTimePFH_server);
            if (time != GVAR(lastTime)) then {
                NOS_missionTime = NOS_missionTime + (_tickTime - GVAR(lastTickTime));
                GVAR(lastTime) = time; // used to detect paused game
            };

            GVAR(lastTickTime) = _tickTime;
        }] call CBA_fnc_compileFinal;

        [{
            (owner (_this select 4)) publicVariableClient "NOS_missionTime";
        }] call FUNC(addPlayerConnectEventHandler);
    } else {
        NOS_missionTime = -1;

        // multiplayer client
        0 spawn {
            isNil {
                private "_fnc_init";
                _fnc_init = {
                    NOS_missionTime = _this select 1;

                    GVAR(lastTickTime) = diag_tickTime; // prevent time skip on clients

                    [QFUNC(missionTimePFH), {
                        SCRIPT(missionTimePFH_client);
                        if (time != GVAR(lastTime)) then {
                            NOS_missionTime = NOS_missionTime + (_tickTime - GVAR(lastTickTime));
                            GVAR(lastTime) = time; // used to detect paused game
                        };

                        GVAR(lastTickTime) = _tickTime;
                    }] call CBA_fnc_compileFinal;

                };

                "NOS_missionTime" addPublicVariableEventHandler _fnc_init;

                if (NOS_missionTime != -1) then {
                    WARNING_1("NOS_missionTime packet arrived prematurely. Installing update handler manually. Transferred value was %1.",NOS_missionTime);
                    [nil, NOS_missionTime] call _fnc_init;
                };
            };
        };
    };
} else {
    // single player
    [QFUNC(missionTimePFH), {
        SCRIPT(missionTimePFH_sp);
        if (time != GVAR(lastTime)) then {
            NOS_missionTime = NOS_missionTime + (_tickTime - GVAR(lastTickTime)) * accTime;
            GVAR(lastTime) = time; // used to detect paused game
        };

        GVAR(lastTickTime) = _tickTime;
    }] call CBA_fnc_compileFinal;
}; */

// set up waitUntilAndExecute
[{
    private "_delete";
    _delete = false;
    {
        // if condition is satisfied call statement
        if ((_x select 2) call (_x select 0)) then {
            (_x select 2) call (_x select 1);

            // Mark the element for deletion so it's not executed ever again
            GVAR(waitUntilAndExecArray) set [_forEachIndex, objNull];
            _delete = true;
        };
    } forEach GVAR(waitUntilAndExecArray);
    if (_delete) then {
        GVAR(waitUntilAndExecArray) = GVAR(waitUntilAndExecArray) - [objNull];
    };
}, 0] call CBA_fnc_addPerFrameHandler;

