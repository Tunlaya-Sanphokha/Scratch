class Value{
  int boxSize;
  Value(int bz){
  boxSize = bz;
  this.drawValue(10,10);
}
void drawValue(float bx,float by){///box value
    textSize(24);
    fill(46, 134, 193);
    rect(bx,by,120, 30);
    fill(253, 254, 254);
    text("value",bx+30,by,120, 30);
} 

}
