Value v;
If_else f;
Forloop l;
float bx = 10;
float by = 10;
boolean overBox = false;
boolean locked = false;
float xOffset = 0.0; 
float yOffset = 0.0; 
int boxSize = 75;

void setup(){
  size(1200,800);
  background(253,254,254);
  
  ///create oj
  v = new Value(boxSize);
  f = new If_else(boxSize);
  l = new Forloop(boxSize);
  
}
void draw(){

background(255);

// Test if the cursor is over the box 
  if (mouseX > bx-boxSize && mouseX < bx+boxSize && 
      mouseY > by-boxSize && mouseY < by+boxSize) {
    overBox = true;  
    if(!locked) { 
      stroke(255); 
      fill(0);
    } 
  } else {
    stroke(153);
    fill(153);
    overBox = false;
  }
  
  fill(235,245,251);
  rect(0,0,width/5,height);
  line(0,height/3,width/5,height/3);
  line(0,height*2/3,width/5,height*2/3);
  
  // Draw the box
    fill(255,255,255);
    v.drawValue(bx,by); 
    f.drawIf_else(bx,by);
    l.drawForloop(bx,by);
          ///tabel menu
    
  }

void mousePressed() {
  if(overBox) {
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  xOffset = mouseX-bx; 
  yOffset = mouseY-by; 

}

void mouseDragged() {
  if(locked) {
    bx = mouseX-xOffset; 
    by = mouseY-yOffset; 
    fill(255);
  }
}

void mouseReleased() {
  locked = false;
}
