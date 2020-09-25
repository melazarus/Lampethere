$fn=50;

translate([0,0,13]) ledstrips();
translate([0,0,0]) base();



*container();


module container() 
{
  %translate([0,0,100-1.5])
    cube([91,91,200], center=true);
}

module ledstrips()
{
  difference() 
  {
    cylinder(170, d=31);

    translate([0,15,170/2])
      cube([11,5,170], center=true);
    translate([0,-15,170/2])
      cube([11,5,170], center=true);
    translate([15,0,170/2])
      cube([5,11,170], center=true);
    translate([-15,0,170/2])
      cube([5,11,170], center=true);
    
    cylinder(170, d=20);
    
    translate([-12.4,12.4,5])
    rotate([90,0,45])
      cylinder(35, d=5);
    
    translate([-12.4,-12.4,5])
    rotate([90,0,45+90])
      cylinder(35, d=5);
    
    translate([-12.4,12.4,165])
    rotate([90,0,45])
      cylinder(35, d=5);   
     
    translate([9,9,165])
    rotate([0,0,45])
    {
      cylinder(3,d=6.5,$fn=6); 
      translate([3.25,0,1.5])
        cube([5.5,5.5,3], center=true);
      translate([0,0,-15])
      cylinder(20,d=3.5);
    }
    
    rotate([0,0,180])
    translate([9,9,165])
    rotate([0,0,45])
    {
      cylinder(3,d=6.5,$fn=6); 
      translate([3.25,0,1.5])
        cube([5.5,5.5,3], center=true);
      translate([0,0,-15])
      cylinder(20,d=3.5);
    }
  }
  
  
}

module base()
{
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
      linear_extrude(3)
        import("2d\\tube.svg");
      
    translate([0,0,12])
      difference()
      {
        cylinder(1,d=31);
        cylinder(1,d=20);
      }
  }
}