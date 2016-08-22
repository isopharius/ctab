      			if (!isNull (findDisplay 1755424)) then {
					_wps = waypoints _pgroup;
					_wp = currentWaypoint _pgroup;
					_posa = [getPosWorld _unit];
					_types = ["None"];

					if ((count _wps > 1) && (_wp < count _wps)) then
					{
						for [{_i=_wp},{_i < (count _wps)},{_i=_i+1}] do
						{
							_posa = _posa + [getWPPos [_pgroup, _i]];
							_types = _types + [waypointType [_pgroup, _i]];
						};
					};

					for [{_i=0},{_i<10},{_i=_i+1}] do
					{
						if ((_i < (count _wps - 1)) && (count _posa > _i + 1)) then
						{
							_poso = _posa select _i;
							_post = _posa select _i + 1;

							_ang = ((_post select 0)-(_poso select 0)) atan2 ((_post select 1)-(_poso select 1));
							_dist = sqrt (((_post select 0)-(_poso select 0))^2 + ((_post select 1)-(_poso select 1))^2);

							format["mk_wp_lnk%1", _i] setMarkerPosLocal [(_poso select 0)+sin(_ang)*_dist/2, (_poso select 1)+cos(_ang)*_dist/2];
							format["mk_wp_lnk%1", _i] setMarkerDirLocal _ang;
							format["mk_wp_lnk%1", _i] setMarkerSizeLocal [10, _dist/2];

							format["mk_wp_cir%1", _i] setMarkerPosLocal _post;
							format["mk_wp_cir%1", _i] setMarkerSizeLocal [0.6,0.6];
							_txt = format["%1 - %2 Km", (_types select _i + 1), floor((_post distance _unit)/100)/10];
							format["mk_wp_cir%1", _i] setMarkerTextLocal _txt;
						}
						else
						{
							format["mk_wp_lnk%1", _i] setMarkerSizeLocal [0,0];
							format["mk_wp_cir%1", _i] setMarkerSizeLocal [0,0];
							format["mk_wp_cir%1", _i] setMarkerTextLocal "";
						};
					};

	               "mk_wp_dir" setMarkerDirLocal (getDir _unit)-90;
	               "mk_wp_dir" setMarkerPosLocal (getPosWorld _unit);

					Sleep 0.1;
					call cTab_fnc_waypoints_on;
				};