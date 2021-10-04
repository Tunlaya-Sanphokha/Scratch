class If_else{
  int boxSize;
  If_else(int bz){
  boxSize = bz;
  this.drawIf_else(10,10);
}
void drawIf_else(float bx ,float by){
    /*fill(244, 208, 63);
    rect(bx,by,120, 30);
    fill(253, 254, 254);
    text("if-else",bx+30,by,120, 30);*/
    fill(244, 208, 63);
    rect(10,10+height/3,120, 30);
    fill(253, 254, 254);
    text("if-else",30,10+height/3,120, 30);
}
}
