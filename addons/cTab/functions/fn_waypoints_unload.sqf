		deleteMarkerLocal "mk_wp_dir";
		for [{_i=0},{_i<10},{_i=_i+1}] do
		{
			deleteMarkerLocal format["mk_wp_lnk%1", _i];
			deleteMarkerLocal format["mk_wp_cir%1", _i];
		};

		if (!isNil "last_onmapsclick") then
		{
			onMapSingleClick last_onmapsclick;
		}
		else
		{
			onMapSingleClick "";
		};