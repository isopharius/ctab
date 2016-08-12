if (((_this select 1) select 1) == 0) then
	{
		_pgroup = group player;
		if (leader _pgroup == player) then
		{
			if ((_this select 1) select 5) then
			{
				_pos = ((_this select 1) select 0) ctrlMapScreenToWorld [(_this select 1) select 2, (_this select 1) select 3];
				_wp = _pgroup addWaypoint [_pos, 0];
				_wp setWaypointType "MOVE";
				_wp showWaypoint "NEVER";
			};
			if ((_this select 1) select 6) then
			{
				_pos = ((_this select 1) select 0) ctrlMapScreenToWorld [(_this select 1) select 2, (_this select 1) select 3];
				_closer = 0;
				_min_dst = 100000;
				_wps = waypoints _pgroup;
				for [{_i=0},{_i < (count _wps)},{_i=_i+1}] do
				{
					_dist = _pos distance getWPPos [_pgroup, _i];
					if ((_dist < _min_dst) && (_dist < 100)) then
					{
						_min_dst = _dist;
						_closer = _i;
					};
				};

				if (_closer != 0) then
				{
					deleteWaypoint [_pgroup, _closer];
				};
			};
		}
		else
		{
			titleText ["\n\nYou need to be group leader to modify waypoints", "PLAIN DOWN"];
		};
	};