
// You may run pre-core-init scripts here

/**********************************/
/* DO NOT EDIT BELOW THIS COMMENT */
/**********************************/

if (isNil "core_init") then {
	call compile preprocessFileLineNumbers "core\boot.sqf";
} else {
	waitUntil {core_init};
};

/**********************************/
/* DO NOT EDIT ABOVE THIS COMMENT */
/**********************************/

// You may run post-core-init scripts here

if (isServer) then {
    nos_postInit = true;
};

// Prevent Insta-death. If anything but "nil" that will be a "revive time" to allow the player to live a bit longer
ace_wounds_prevtime = nil;
ace_sys_wounds_leftdam = 0; // How much damage left when healed in the field, instead of healed at a medical facility
["ace_sys_interaction_confirmation", { ace_sys_interaction_confirmed = true; false }] call ACE_fnc_addReceiverOnlyEventhandler; // attempt to get around morphine requirement

if (hasInterface) then {
    ["nos_hideObjectGlobal", {
        private ["_object", "_hidden"];
        _object = _this select 0;
        _hidden = _this select 1;
        _object hideObject _hidden;
    }] call CBA_fnc_addEventHandler;

    fnc_createGroupMarkerForPlayer = {
        private ["_uid", "_attached", "_marker", "_currentMarkers", "_type", "_color", "_unitName", "_size"];

        _uid = _this select 0;
        _attached = _this select 1;
        _type = _this select 2;
        _unitName = _this select 3;
        _color = _this select 4;
        _size = _this select 5;

        if ((side _attached) == (side player)) then {
            _currentMarkers = player getVariable ["nos_currentGroupMarkers", []];
        
            _marker = createMarkerLocal [_uid, [0, 0]];
            _marker setMarkerText _unitName;

            if !(_color == "") then {
                _marker setMarkerColor _color;
            };
            
            switch (_type) do {
                case "infantry":    { _type = "b_inf" };
                case "motorized":   { _type = "b_motor_inf"; };
                case "mechanized":  { _type = "b_mech_inf"; };
                case "hq":          { _type = "b_hq"; };
                case "medic":       { _type = "b_med"; };
                case "armor":       { _type = "b_armor"; };
                case "heli":        { _type = "b_air";  };
                case "plane":       { _type = "b_plane"; };
                case "mortar":      { _type = "b_mortar"; };
                case "arty":        { _type = "b_art"; };
                default { _type = ""; };
            };

            _marker setMarkerType _type;
            _marker setMarkerPos getPosASL (if (typeName _attached == typeName objNull) then {
                _attached;
            } else {
                leader _attached;
            });
            _marker setMarkerSize [_size, _size];
            
            _currentMarkers set [count _currentMarkers, [_marker, _attached]];
            
            player setVariable ["nos_currentGroupMarkers", _currentMarkers];
        };
    };

    ["nos_createGroupMarkerLocal", {
        _this call fnc_createGroupMarkerForPlayer;
    }] call CBA_fnc_addEventHandler;
    
    ["nos_createGroupMarkerLocal", {
        private ["_paramArr"];
        _paramArr = [];
        {
            if (_forEachIndex != 0) then {
                _paramArr set [count _paramArr, _x];
            };
        } forEach _this;
        _paramArr call fnc_createGroupMarkerForPlayer;
    }] call CBA_fnc_addLocalEventHandler;
    
    [{
        {
            private ["_marker", "_attached"];
            _marker = _x select 0;
            _attached = _x select 1;
            if !(isNil "_attached" || isNull _attached) then {
                _marker setMarkerPos getPosASL (if (typeName _attached == typeName objNull) then {
                    _attached;
                } else {
                    leader _attached;
                });
            };
        } forEach (player getVariable ["nos_currentGroupMarkers", []]);
    }, 5, []] call CBA_fnc_addPerFrameHandler;
    
    player addEventHandler ["Killed", {
        _this spawn {
            waitUntil { alive player };
            [player] join grpNull;
            player allowDamage false;
            ["nos_hideObjectGlobal", [player, true]] call CBA_fnc_globalEvent;
            [true] call acre_api_fnc_setSpectator;
            [player, _this select 1] call ace_fnc_startSpectator;
            ace_sys_spectator_playable_only = true;
            ace_sys_spectator_can_exit_spectator = false;
            ace_sys_spectator_no_butterfly_mode = true;
            sleep 2;
            player setPos [0, 0, 0];
        };
    }];
    
    ["nos_playerInitialized", [player]] call CBA_fnc_globalEvent;
};

