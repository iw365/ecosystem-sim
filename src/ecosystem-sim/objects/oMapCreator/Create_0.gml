/// @description []

function create_island_method_1() {
    var markerCountX = oWindowManager.screen_width / 32; // Number of markers in X direction
    var markerCountY = oWindowManager.screen_height / 32; // Number of markers in Y direction
    var spacingX = oWindowManager.screen_width / (markerCountX + 1); // Calculate the spacing between markers in X direction
    var spacingY = oWindowManager.screen_height / (markerCountY + 1); // Calculate the spacing between markers in Y direction
    var offsetX = 27;
    var offsetY = 17;
	
	//with instance_create_layer((oWindowManager.screen_width/2)+(27/2), (oWindowManager.screen_height/2)+(17/2), "Instances", oMarker){
	//	image_xscale *= 3;
	//	image_yscale *= 3;
	//}
	
    for (var yy = 1; yy <= markerCountY; yy++) {
        for (var xx = 1; xx <= markerCountX; xx++) {
            var current_x = offsetX + (spacingX * xx);
            var current_y = offsetY + (spacingY * yy);
            
			xPerc = (abs((oWindowManager.screen_width/2) - current_x) / (oWindowManager.screen_width/2) * 100);
			yPerc = (abs((oWindowManager.screen_height/2) - current_y) / (oWindowManager.screen_height/2) * 100);
			avgPerc = round((xPerc + yPerc) / 2)
			
            instance_create_layer(current_x, current_y, "Instances", oMarker);
			if (random_range(0, 100) + random_range(0, 100) + random_range(0, 100) + random_range(0, 100) + random_range(0, 100)) / 5 >= avgPerc //you saw nothing
			{
				if avgPerc < 45{
					instance_create_layer(current_x, current_y, "Instances", oGround);
				}
				else{
					instance_create_layer(current_x, current_y, "Instances", oSand);
				}
			}
            show_debug_message($"created point at {current_x}, {current_y}");
			show_debug_message(avgPerc);
			
			
        }
    }
}

create_island_method_1();