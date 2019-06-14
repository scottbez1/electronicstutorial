print_compensation = -0.25;
module shaft() {
    difference() {
        circle(d=4.91, $fn=30);
        translate([-4, -4.91/2 + 4.21]) {
            square([8, 3]);
        }
    }
}

slot_width = 0.6;
linkage_width = 4;
linkage_length = 25;

module linkage() {
    offset(print_compensation) {
        difference() {
            union() {
                circle(d=8, $fn=30);
                translate([-linkage_width/2, 0]) {
                    square([linkage_width, linkage_length]);
                }
            }
            translate([-slot_width/2, linkage_length - 10]) {
                square([slot_width, 10]);
            }
            rotate([0, 0, 2.5]) {
                shaft();
            }
        }
    }
}


throttle_shaft_diameter = 4.1;
throttle_rotation = 45;
pot_rotation = 15;
throttle_linkage_length = 8;
throttle_linkage_width = 3;


calculated_linkage_length = throttle_linkage_length * sin(throttle_rotation/2) / sin(pot_rotation/2);
echo(calculated_linkage_length);

module throttle() {
    offset(print_compensation) {
        difference() {
            union() {
                circle(d=throttle_shaft_diameter + 4, $fn=30);
                translate([0, -3]) {
                    square([20, 2.5]);
                }
                rotate([0, 0, -180 + throttle_rotation/2]) {
                    translate([-throttle_linkage_width/2, 0]) {
                        difference() {
                            square([throttle_linkage_width, throttle_linkage_length + 2]);
                            translate([throttle_linkage_width/2, throttle_linkage_length]) {
                                circle(d=0.6, $fn=30);
                            }
                        }
                    }
                }
            }
            circle(d=throttle_shaft_diameter, $fn=30);
        }
    }
}

pot_axis_top_offset = 5;

case_thickness = 5.35;
case_width = 9.55;
case_height = 11.11;

thickness = 6.7;

base_thickness = 1;

border=2;


combined_linkage_linear_length = calculated_linkage_length * cos(pot_rotation/2) + throttle_linkage_length * cos(throttle_rotation/2);

module base() {
    offset(print_compensation) {
        difference() {
            square([case_width + border*2, case_height - pot_axis_top_offset + combined_linkage_linear_length + 5]);
            translate([border, 0]) {
                square([case_width, case_height]);
            }
            translate([case_width/2 + border, case_height - pot_axis_top_offset + combined_linkage_linear_length]) {
                circle(d=throttle_shaft_diameter, $fn=30);
            }
        }
    }
}

module 3dbase() {
    linear_extrude(height=base_thickness) {
        offset(print_compensation) {
            square([case_width + border * 2, case_height - pot_axis_top_offset + combined_linkage_linear_length + 5]);
        }
    }
    
    translate([case_width/2 + border, case_height - pot_axis_top_offset + combined_linkage_linear_length, base_thickness + 6.7]) {
        linear_extrude(height=3) {
            offset(print_compensation) {
                difference() {
                    circle(d=throttle_shaft_diameter + 4, $fn=30);
                    circle(d=throttle_shaft_diameter, $fn=30);
                }
            }
        }
    }
    translate([0, 0, base_thickness]) {
        linear_extrude(height=6.7) {
            base();
        }
    }
}


module assembled() {
    3dbase();
    translate([case_width/2 + border, case_height - pot_axis_top_offset, 6.7 + base_thickness]) {
        linear_extrude(height=3) {
            rotate([0, 0, -pot_rotation/2])
            linkage();
        }
    }
    translate([case_width/2 + border, case_height - pot_axis_top_offset + combined_linkage_linear_length, 6.7 + 3 + base_thickness]) {
        linear_extrude(height=3) {
            //rotate([0, 0, -throttle_rotation])
            throttle();
        }
    }
}

module for_print() {
    3dbase();
    translate([20, 10, 0]) {
        linear_extrude(height=3) {
            linkage();
        }
    }
    translate([30, 10, 0]) {
        linear_extrude(height=3) {
            throttle();
        }
    }
}

//assembled();
for_print();