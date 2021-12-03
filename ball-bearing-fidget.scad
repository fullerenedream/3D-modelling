// This module makes a ball bearing that works nicely as a fidget toy.


module ballbearing(inner,outer,ballDiam,cylHeightFactor,gap=0.2) {
    cylHeight = ballDiam * cylHeightFactor;
    heightDiff = ballDiam - cylHeight;
    // casing
    color("DeepPink", 0.5) {
        difference() {
            translate([0,0,heightDiff/2]){
                union() {
                    // outer casing
                    difference() {
                        cylinder(d=outer+2,h=cylHeight,$fn=75);
                        cylinder(d=(outer+inner+ballDiam)/2,h=cylHeight,$fn=75);
                    }
                    // inner casing
                    difference() {
                        cylinder(d=(outer+inner-ballDiam)/2,h=cylHeight,$fn=50);
                        cylinder(d=inner-2,h=cylHeight,$fn=50);
                    }
                }
            }
        // torus of internal negative space
        translate([0,0,ballDiam/2]) rotate_extrude() translate([(inner+outer)/4, 0, 0]) circle(d=(ballDiam+2*gap), $fn=50);
        }
    }

    // balls
    a = 2 * asin(ballDiam/((inner+outer)/2));
    b = round(360 / a);
    c = 360 / b;
    for (e = [0:c:360]) color("Aqua", 0.9){
        {rotate([0,0,e]) translate([(inner+outer)/4,0,ballDiam/2]) sphere(d=ballDiam,$fn=40);
        }
    }
}


// outer - inner > 2*d
// outer > 2*d + inner
// inner < outer - 2*d
bD = 10.2;
// in = bD;
// out = bD*2 + in + 3;
out = 32;
in = (out - bD*2) - 2;
cHF = 0.78;
g = 0.1;

// ballbearing(inner=5,outer=16,ballDiam=5,gap=0.2);
ballbearing(inner=in, outer=out, ballDiam=bD,cylHeightFactor=cHF,gap=g);

