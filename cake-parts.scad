// These modules make "cakes" - that is, they make extra pieces for the
// Tom et Charlotte cake-stacking toy made by Djeco.


// requires the Round-Anything library, found here:
// https://opensourcelibs.com/lib/round-anything

use <Round-Anything/polyround.scad>;

module circleCakeLayer(cakeDiameter, thickness, filletRadius, holeDiameter){
    CYL1_d = cakeDiameter;  // cake diameter
    CYL1_r = CYL1_d/2;  // cake radius
    h1 = thickness;  // cake layer height
    CRC_r = filletRadius;  // corner-rounder circle radius
    CRC_d = CRC_r * 2;  // corner-rounder circle diameter
    holeDiam = holeDiameter;  // diameter of hole in centre of cake

    // round cake layer with hole
    difference(){
        union(){
            // the big sharp disc
            BSD_d = CYL1_d-CRC_d;  // big sharp disc diameter
            color("DeepPink", 0.5) {
            // color("Blue", 0.8) {
                translate([0, 0, -h1/2]){
                    cylinder(h=h1, d=BSD_d, $fn=100);
                }
            }
            color("Yellow", 0.5){
            // color("DeepPink", 0.5){
                rotate_extrude($fn=100){
                    translate([CYL1_r-CRC_r, 0, 0]){
                        // corner rounder, flat (extrude, then add or subtract it as needed)
                        union(){
                            translate([0, (h1/2)-CRC_r, 0]){
                                circle(d=CRC_d, $fn=100);
                            }
                            translate([0, (-h1/2)+CRC_r, 0]){
                                circle(d=CRC_d, $fn=100);
                            }
                            square(size=[CRC_d, h1-CRC_d], center=true);
                        }
                    }
                }
            }
        }
        // centre hole
        color("Yellow", 0.5){
            rotate_extrude($fn=100){
                difference(){
                    color("DeepPink", 0.5) {
                        translate([0, -h1/2, 0]){
                            square(size=[(holeDiam/2)+0.5, h1]);
                        }
                    }
                    union(){
                        translate([(holeDiam/2)+0.5, (h1/2)-0.5, 0]){
                            circle(d=1, $fn=100);
                        }
                        translate([(holeDiam/2)+0.5, (-h1/2)+0.5, 0]){
                            circle(d=1, $fn=100);
                        }
                        translate([(holeDiam/2), (-h1/2)+0.5, 0]){
                            square(size=[0.5, h1-1]);
                        }
                    }
                }
            }
        }
    }
}

//*******************************//

module squareCakeLayer(length, thickness, filletRadius, holeDiameter){
    squareLength = length;  // length of each side of the cake
    h1 = thickness;  // cake layer height
    CRC_r = filletRadius;  // corner-rounder circle radius
    CRC_d = CRC_r * 2;  // corner-rounder circle diameter
    holeDiam = holeDiameter;  // diameter of hole in centre of cake


    // square cake layer with hole
    difference(){

        union(){
            // square cake layer, shrunk so we can add rounded corner panels
            color("Blue", 0.4){
                translate([0, 0, -h1/2]){
                    linear_extrude(height=h1){
                        // square cake cross-section
                        square(size=squareLength-CRC_d, center=true);
                    }
                }
            }

            color("DeepPink", 0.5){
                // straight corner rounder panel (east)
                translate([(squareLength/2)-CRC_r, (squareLength/2)-CRC_r, 0]){
                    rotate([90, 0, 0]){
                        linear_extrude(height=squareLength-CRC_d){
                            // corner rounder (add or subtract it as needed)
                            union(){
                                translate([0, (h1/2)-CRC_r, 0]){
                                    circle(d=CRC_d, $fn=100);
                                }
                                translate([0, (-h1/2)+CRC_r, 0]){
                                    circle(d=CRC_d, $fn=100);
                                }
                                translate([-CRC_r, (-h1/2)+CRC_r, 0]){
                                    square(size=[CRC_d, h1-CRC_d]);
                                }
                            }
                        }
                    }
                }
                // straight corner rounder panel (west)
                translate([-((squareLength/2)-CRC_r), (squareLength/2)-CRC_r, 0]){
                    rotate([90, 0, 0]){
                        linear_extrude(height=squareLength-CRC_d){
                            // corner rounder (add or subtract it as needed)
                            union(){
                                translate([0, (h1/2)-CRC_r, 0]){
                                    circle(d=CRC_d, $fn=100);
                                }
                                translate([0, (-h1/2)+CRC_r, 0]){
                                    circle(d=CRC_d, $fn=100);
                                }
                                translate([-CRC_r, (-h1/2)+CRC_r, 0]){
                                    square(size=[CRC_d, h1-CRC_d]);
                                }
                            }
                        }
                    }
                }
                // straight corner rounder panel (north)
                translate([-((squareLength/2)-CRC_r), (squareLength/2)-CRC_r, 0]){
                    rotate([90, 0, 90]){
                        linear_extrude(height=squareLength-CRC_d){
                            // corner rounder (add or subtract it as needed)
                            union(){
                                translate([0, (h1/2)-CRC_r, 0]){
                                    circle(d=CRC_d, $fn=100);
                                }
                                translate([0, (-h1/2)+CRC_r, 0]){
                                    circle(d=CRC_d, $fn=100);
                                }
                                translate([-CRC_r, (-h1/2)+CRC_r, 0]){
                                    square(size=[CRC_d, h1-CRC_d]);
                                }
                            }
                        }
                    }
                }
                // straight corner rounder panel (south)
                translate([-((squareLength/2)-CRC_r), -((squareLength/2)-CRC_r), 0]){
                    rotate([90, 0, 90]){
                        linear_extrude(height=squareLength-CRC_d){
                            // corner rounder (add or subtract it as needed)
                            union(){
                                translate([0, (h1/2)-CRC_r, 0]){
                                    circle(d=CRC_d, $fn=100);
                                }
                                translate([0, (-h1/2)+CRC_r, 0]){
                                    circle(d=CRC_d, $fn=100);
                                }
                                translate([-CRC_r, (-h1/2)+CRC_r, 0]){
                                    square(size=[CRC_d, h1-CRC_d]);
                                }
                            }
                        }
                    }
                }
                // NE corner rounder cylinder
                translate([(squareLength/2)-CRC_r, (squareLength/2)-CRC_r, 0]){
                    // corner rounder, cylindrical
                    cornerRounderHeight = h1;
                    cylHeight = cornerRounderHeight-CRC_d;
                    translate([0, 0, -cylHeight/2]){
                        cylinder(h=cylHeight, r=CRC_r, $fn=100);
                    }
                    translate([0, 0, cylHeight/2]){
                        sphere(r=CRC_r, $fn=100);
                    }
                    translate([0, 0, -cylHeight/2]){
                        sphere(r=CRC_r, $fn=100);
                    }
                }
                // NW corner rounder cylinder
                translate([-((squareLength/2)-CRC_r), (squareLength/2)-CRC_r, 0]){
                    // corner rounder, cylindrical
                    cornerRounderHeight = h1;
                    cylHeight = cornerRounderHeight-CRC_d;
                    translate([0, 0, -cylHeight/2]){
                        cylinder(h=cylHeight, r=CRC_r, $fn=100);
                    }
                    translate([0, 0, cylHeight/2]){
                        sphere(r=CRC_r, $fn=100);
                    }
                    translate([0, 0, -cylHeight/2]){
                        sphere(r=CRC_r, $fn=100);
                    }
                }
                // SW corner rounder cylinder
                translate([-((squareLength/2)-CRC_r), -((squareLength/2)-CRC_r), 0]){
                    // corner rounder, cylindrical
                    cornerRounderHeight = h1;
                    cylHeight = cornerRounderHeight-CRC_d;
                    translate([0, 0, -cylHeight/2]){
                        cylinder(h=cylHeight, r=CRC_r, $fn=100);
                    }
                    translate([0, 0, cylHeight/2]){
                        sphere(r=CRC_r, $fn=100);
                    }
                    translate([0, 0, -cylHeight/2]){
                        sphere(r=CRC_r, $fn=100);
                    }
                }
                // SE corner rounder cylinder
                translate([(squareLength/2)-CRC_r, -((squareLength/2)-CRC_r), 0]){
                    // corner rounder, cylindrical
                    cornerRounderHeight = h1;
                    cylHeight = cornerRounderHeight-CRC_d;
                    translate([0, 0, -cylHeight/2]){
                        cylinder(h=cylHeight, r=CRC_r, $fn=100);
                    }
                    translate([0, 0, cylHeight/2]){
                        sphere(r=CRC_r, $fn=100);
                    }
                    translate([0, 0, -cylHeight/2]){
                        sphere(r=CRC_r, $fn=100);
                    }
                }
            }
        }

        // centre hole
        rotate_extrude($fn=100){
            difference(){
                color("DeepPink", 0.5) {
                    translate([0, -h1/2, 0]){
                        square(size=[(holeDiam/2)+0.5, h1]);
                    }
                }
                union(){
                    translate([(holeDiam/2)+0.5, (h1/2)-0.5, 0]){
                        circle(d=1, $fn=100);
                    }
                    translate([(holeDiam/2)+0.5, (-h1/2)+0.5, 0]){
                        circle(d=1, $fn=100);
                    }
                    translate([(holeDiam/2), (-h1/2)+0.5, 0]){
                        square(size=[0.5, h1-1]);
                    }
                }
            }
        }
    }
}


//*******************************//


// Cake parts that fit the cake-stacking toy.
// Uncomment one at a time.

// large round cake layer
// circleCakeLayer(cakeDiameter=57, thickness=7, filletRadius=3/2, holeDiameter=11);

// small round cake layer
// circleCakeLayer(cakeDiameter=33, thickness=7, filletRadius=3/2, holeDiameter=11);

// square cake layer
// squareCakeLayer(length=52, thickness=7, filletRadius=3/2, holeDiameter=11);

// wafers: the wafer texture is produced by your slicer settings. choose a square infill
// pattern ("grid" in Cura slicer), and set the number of top (shell) layers to zero.

// round wafer
// circleCakeLayer(cakeDiameter=57, thickness=3, filletRadius=3/2, holeDiameter=11);

// square wafer
// squareCakeLayer(length=52, thickness=3, filletRadius=3/2, holeDiameter=11);

// icing that fits over small round cake layer
difference(){
    circleCakeLayer(cakeDiameter=40, thickness=7,
                    filletRadius=3/2, holeDiameter=11);
    translate([0, 0, -4.5]){
        circleCakeLayer(cakeDiameter=34, thickness=10,
                        filletRadius=3/2, holeDiameter=11);
    }
}
