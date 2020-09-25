union()
{
  linear_extrude(7)
    import("2d\\screwAdapter.svg");

  translate([0,0,7])
    difference()
    {
      cylinder(2,d=37);
      cylinder(2,d=28);
    }
    
  translate([0,0,9])
    linear_extrude(25)
      import("2d\\tube.svg");
}