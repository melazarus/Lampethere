lid_dimensions = 84;
pcb_dimensions = 80;
base_depth = 10; //tot op het bord
button_height = 2;
finger_d=5;
border = (lid_dimensions - pcb_dimensions)/2;
esp_h = 3;
programmer_h = 3;
power_h = 3.5;

translate([-42,-42,0])
union()
{
  cube([lid_dimensions,lid_dimensions,1]);

  
  difference(){
    cube([lid_dimensions,lid_dimensions,base_depth-button_height]);
    translate([border,border,0])
      cube([pcb_dimensions,pcb_dimensions,base_depth+1-button_height]);
  }

  translate([40+3.5/2,40+3.5/2,0])
    difference()
    {
      cylinder(8,d=7,$fn=30);
      translate([0,0,8-1])
        sphere(d=5.5,$fn=30);
    }
    
  offset = border+11;
  offset2 = border+80-11;
  translate([offset,offset,0])
    cylinder(base_depth-button_height,d=finger_d,$fn=30);
  translate([offset,offset2,0])
    cylinder(base_depth-button_height,d=finger_d,$fn=30);
  translate([offset2,offset,0])
    cylinder(base_depth-button_height,d=finger_d,$fn=30);
  translate([offset2,offset2,0])
    cylinder(base_depth-button_height,d=finger_d,$fn=30);
    
  //esp
  translate([(lid_dimensions-border)/2,0,0])
    cube([2,lid_dimensions/2-3.5,base_depth-esp_h]);
    
  //programmer
  translate([(lid_dimensions-border)/2,45,0])
    cube([2,lid_dimensions/2-3.5,base_depth-programmer_h]);
  translate([(lid_dimensions-border)/2,45+23,0])
    cube([2,16,base_depth]);
    
  translate([0,40+1,0])
    cube([lid_dimensions/2-3.5,2,base_depth-power_h]);
  translate([0,40+1,0])
    cube([8,2,base_depth]);
  translate([42+3.5,40+1,0])
    cube([lid_dimensions/2-3.5,2,base_depth-programmer_h]);
  translate([42+3.5+21.5,40+1,0])  
    cube([17,2,base_depth]);
}