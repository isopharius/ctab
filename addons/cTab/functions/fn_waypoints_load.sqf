			params ["_unit"];
			private _pgroup = group player;

			for [{_i=0},{_i<10},{_i=_i+1}] do
			{
				[format["mk_wp_lnk%1", _i], [0,0], "RECTANGLE", [0,0], "COLOR:", "ColorWhite"] call CBA_fnc_createMarker;
			};

			for [{_i=0},{_i<10},{_i=_i+1}] do
			{
				[format["mk_wp_cir%1", _i], [0,0,0], "ICON", [0,0], "COLOR:", "ColorWhite", "TYPE:", "mil_circle"] call CBA_fnc_createMarker;
			};

			//["mk_wp_dir", (getPosWorld _unit), "ICON", [0.65,0.65], "COLOR:", "ColorWhite", "TYPE:", "waypoint"] call CBA_fnc_createMarker;
            //"mk_wp_dir" setMarkerDirLocal (getDir _unit)-90;

      		Sleep 0.5;
			call cTab_fnc_waypoints_on;
