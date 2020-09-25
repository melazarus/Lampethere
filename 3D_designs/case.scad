
difference()
{
  half_rounded_cube(91, 20, 5);
  translate([0,0,3])
    half_rounded_cube(85, 17, 5);
  
  linear_extrude(20, convexity=2)
    import("2d\\curved_sloth.svg");
  
  cylinder(1,d=31);
  cylinder(5,d=12);
}

module half_rounded_cube(width, height, r)
{

difference()
{
  translate([0,0,height/2])
  minkowski()
  {
    cube([width-r,width-r,height-r], center=true);
    sphere(d=r,$fn=100);
  }
  translate([0,0,height-r/2])
    cube([width,width,r], center=true);
  }
}