/// @description []

function create_island_method_1() {
    var markerCountX = oWindowManager.screen_width / 32;
    var markerCountY = oWindowManager.screen_height / 32;
    var spacingX = oWindowManager.screen_width / (markerCountX + 1);
    var spacingY = oWindowManager.screen_height / (markerCountY + 1);
    var offsetX = 27;
    var offsetY = 17;
	var sum = 0;
	var avgRand = 0;
	
	//with instance_create_layer((oWindowManager.screen_width/2)+(27/2), (oWindowManager.screen_height/2)+(17/2), "Instances", oMarker){
	//	image_xscale *= 3;
	//	image_yscale *= 3;
	//}
	
    for (var yy = 1; yy <= markerCountY; yy++) {
        for (var xx = 1; xx <= markerCountX; xx++) {
            var current_x = offsetX + (spacingX * xx);
            var current_y = offsetY + (spacingY * yy);
            
			var xPerc = (abs((oWindowManager.screen_width/2) - current_x) / (oWindowManager.screen_width/2) * 100);
			var yPerc = (abs((oWindowManager.screen_height/2) - current_y) / (oWindowManager.screen_height/2) * 100);
			var avgPerc = round((xPerc + yPerc) / 2)
			
			for (var i = 0; i < 5; i++) {
    			var randomNumber = random(100);
    			sum += randomNumber;
			}
			
			avgRand = sum / 5;

            //instance_create_layer(current_x, current_y, "Instances", oMarker);
			if avgRand >= avgPerc
			{
				//if avgPerc < 45{
				//	instance_create_layer(current_x, current_y, "Instances", oGround);
				//}
				//else{
				//	instance_create_layer(current_x, current_y, "Instances", oSand);
				//}
				
				instance_create_layer(current_x, current_y, "Instances", oGround);
			}
            // show_debug_message($"created point at {current_x}, {current_y}");
			// show_debug_message(avgPerc);
			
			sum = 0;
			avgRand = 0;
			
			var xPerc = 0;
			var yPerc = 0;
			var avgPerc = 0;
        }
    }
}

function check_island(){
	var markerCountX = oWindowManager.screen_width / 32;
    var markerCountY = oWindowManager.screen_height / 32;
    var spacingX = oWindowManager.screen_width / (markerCountX + 1);
    var spacingY = oWindowManager.screen_height / (markerCountY + 1);
    var offsetX = 27;
    var offsetY = 17;
	var sum = 0;
	var avgRand = 0;
	var surrounds = 0;
	
	//var coordinateList = ds_list_create();
	//var coordinate1 = ds_list_create();
	
    for (var yy = 1; yy <= markerCountY; yy++) {
        for (var xx = 1; xx <= markerCountX; xx++) {
            var current_x = offsetX + (spacingX * xx);
            var current_y = offsetY + (spacingY * yy);
			
			if place_meeting(current_x + 0, current_y - 32, oGround){
				surrounds++;
			}
			if place_meeting(current_x + 32, current_y - 32, oGround){
				surrounds++;
			}
			if place_meeting(current_x + 32, current_y + 0, oGround){
				surrounds++;
			}
			if place_meeting(current_x + 32, current_y + 32, oGround){
				surrounds++;
			}
			if place_meeting(current_x + 0, current_y + 32, oGround){
				surrounds++;
			}
			if place_meeting(current_x - 32, current_y + 32, oGround){
				surrounds++;
			}
			if place_meeting(current_x - 32, current_y + 0, oGround){
				surrounds++;
			}
			if place_meeting(current_x - 32, current_y = 32, oGround){
				surrounds++;
			}
			
			show_debug_message(surrounds)
			if surrounds >= 6{
				instance_create_layer(current_x, current_y, "Instances", oMarker);
				show_debug_message("placed extra point");
			}
			
			surrounds = 0;
		}
	}
}

create_island_method_1();
check_island();