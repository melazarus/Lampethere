

difference() 
{
  union()
  {
    linear_extrude(25, convexity=2)
      import("2d\\tube.svg", convexity=2);
      
   screwhole();
   rotate([0,0,180]) screwhole();
  }
  nut();
}

module screwhole() {
  difference()
  {
    translate([-4,13.5,11])
      rotate([30,0,0])
        cube([8,8.5,16]);
    
    translate([0,0,25])
      cylinder(10,d=35);
    
    linear_extrude(25, convexity=2)
      import("2d\\tube_outer.svg", convexity=2); 
    
    linear_extrude(30, convexity=2)
    rotate([0,0,90])
      import("2d\\scewholes.svg", convexity=2);      
  }
}

module nut() {
  translate([0,0,21])
  {
    linear_extrude(3, convexity=2)
    rotate([0,0,90])
      import("2d\\nut_inserts.svg", convexity=2);  
  }
}