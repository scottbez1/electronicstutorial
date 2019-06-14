case_thickness = 5.35;
case_width = 9.55 + 0.6;
case_height = 11.11;

thickness = 6.7;

base_thickness = 1;

border = 3;

spring_retainer_offset = 17;
% translate([border, spring_retainer_offset, base_thickness]) {
        cube([case_width, case_height, case_thickness]);
        translate([case_width/2, 6.4]) {
            linear_extrude(height=9.5) {
                shaft();
            }
        }
}

union() {
    // base
    linear_extrude(height=base_thickness) {
        square([border + case_width + border, spring_retainer_offset + case_height + border]);
    }

    // left wall
    translate([0, 0, base_thickness]) {
        linear_extrude(height=thickness) {
            square([border, spring_retainer_offset + case_height + border]);
        }
    }
    
    // right wall
    translate([border + case_width, 0, base_thickness]) {
        linear_extrude(height=thickness) {
            square([border, spring_retainer_offset + case_height + border]);
        }
    }
    
    // top wall
    translate([border + case_width*3/4, spring_retainer_offset + case_height, 0]) {
        linear_extrude(height=base_thickness + thickness+5) {
            square([case_width/2 + border + 4, border]);
        }
    }
    translate([0, spring_retainer_offset + case_height, 0]) {
        linear_extrude(height=base_thickness + case_thickness) {
            square([border + case_width + border, border]);
        }
    }
    
    // bottom wall
    translate([border, 0, base_thickness]) {
        linear_extrude(height=thickness) {
            difference() {
                square([case_width, spring_retainer_offset - 6]);
                translate([case_width * 7/8, 2]) {
                    circle(d=1.5, $fn=20);
                }
                translate([case_width * 7/8, 4]) {
                    circle(d=1.5, $fn=20);
                }
                translate([case_width * 7/8, 6]) {
                    circle(d=1.5, $fn=20);
                }
                translate([case_width * 7/8, 8]) {
                    circle(d=1.5, $fn=20);
                }
                
                translate([case_width/2, 2]) {
                    circle(d=1.5, $fn=20);
                }
                translate([case_width/2, 4]) {
                    circle(d=1.5, $fn=20);
                }
                translate([case_width/2, 6]) {
                    circle(d=1.5, $fn=20);
                }
                translate([case_width/2, 8]) {
                    circle(d=1.5, $fn=20);
                }
            }
        }
    }
}

module shaft() {
    difference() {
        circle(d=4.91, $fn=30);
        translate([-4, -4.91/2 + 4.21]) {
            square([8, 3]);
        }
    }
}

module lever() {
    //square([25 +
    linear_extrude(height=3) {
        offset(r=-0.3) {
            difference() { 
                translate([-5, -4]) {
                    square([30, 8]);
                }
                shaft();
                x = 0.8;
                translate([0, -2]) {
                    translate([6, 0])
                        circle(d=x, $fn=20);
                    translate([8, 0])
                        circle(d=x, $fn=20);
                    translate([10, 0])
                        circle(d=x, $fn=20);
                    translate([12, 0])
                        circle(d=x, $fn=20);
                    translate([14, 0])
                        circle(d=x, $fn=20);
                    translate([16, 0])
                        circle(d=x, $fn=20);
                    translate([18, 0])
                        circle(d=x, $fn=20);
                    translate([20, 0])
                        circle(d=x, $fn=20);
                    translate([22, 0])
                        circle(d=x, $fn=20);
                }
            }
        }
    }
}

translate([0, -10, 0]) {
    lever();
}