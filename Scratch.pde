Value v;
If_else f;
Forloop l;
float bx = 10;
float by = 10;
//boolean overBox = false;
//boolean locked = false;
//float xOffset = 0.0; 
//float yOffset = 0.0; 
int boxSize = 75;
ArrayList<Tree> tree = new ArrayList<Tree>();
Tree selec,next,last;
int position_x,position_y,mouse_x,mouse_y,text_count = 1;

void setup(){
  size(1200,800);
  frameRate(60);
  background(255);
  textSize(15);
  redraw();
  ///create oj
  v = new Value(boxSize);
  f = new If_else(boxSize);
  l = new Forloop(boxSize);
  
}
void draw(){
  if (mousePressed){
    if (selec != null){
      background(255);
      selec.posx = position_x + (mouseX-mouse_x);
      selec.posy = position_y + (mouseY-mouse_y);
      selec.select = true;
      checktouch();
      redraw();
      if (mouseY > height - 40) {
        fill(255,0,0,255);
        selec.posy = height;
      } else {
        fill(128,0,0,200);
      } 
    }
  }
  v.drawValue(bx,by); 
  f.drawIf_else(bx,by);
  l.drawForloop(bx,by);
  //delete botton
  fill(#B22222);
  rect(500,770,300,30);
  fill(0);
  text("Delete",600,790);
}
 void redraw() {
  fill(235,245,251);
  rect(0,0,width/5,height);
  line(0,height/3,width/5,height/3);
  line(0,height*2/3,width/5,height*2/3);
  for (int i = 0; i < tree.size(); i++) {
    Tree sel = tree.get(i);
    sel.drawTree();
  }
  if (selec != null)selec.drawTree();
}

void mousePressed() {
  for (int i = 0; i < tree.size(); i++) {
    Tree sel = tree.get(i);
    sel = sel.positionMouse(mouseX,mouseY);
    if (sel != null) {
      selec = sel;
      if (tree.indexOf(sel) == -1) {
        tree.add(sel);
      }
      position_x = sel.posx;
      position_y = sel.posy;
      mouse_x = mouseX;
      mouse_y = mouseY;
      return; 
    }
  }
     if (mouseY < 50 && mouseX < 100) {
        Tree nextchild = new Tree(); 
        tree.add(nextchild);
        nextchild.textBox = "Value " + text_count;
        text_count++;
        selec = nextchild;      
     }
     else if (mouseY < 310 && mouseY > 260 && mouseX <100){
         Tree nextchild = new Tree(); 
          tree.add(nextchild);
          nextchild.textBox = "if-else ";
          selec = nextchild;  
     }
       else if (mouseY < 570 && mouseY > 520 && mouseX <100){
         Tree nextchild = new Tree(); 
         tree.add(nextchild);
         nextchild.textBox = "foor-loop ";
         selec = nextchild;  
    }
  }

//void mouseDragged() {
//  if(locked) {
//    bx = mouseX-xOffset; 
//    by = mouseY-yOffset; 
//    fill(255);
//  }
//}

void mouseReleased() {
  if ( selec != null) {
    background(255);  
    if (selec.posy >= height) {
       tree.remove(selec);
       
    }
    selec.select = false;
    if (next != null) {
      next.inputChild(selec);
      next.input = false;
      tree.remove(selec);
      next = null;
    }
    selec = null;  
    last = null;
    position_x = 0;
    position_y = 0;
    mouse_x = 0;
    mouse_y = 0;
    redraw();
    background(255);  
    redraw();
  }
}
void checktouch() {
  for (int i = 0; i < tree.size(); i++) {
    Tree sel = tree.get(i);
    sel = sel.positionMouse(selec);
    if (sel != null) {
      next = sel;
      next.input = true;
      return;
    }
  }
}
