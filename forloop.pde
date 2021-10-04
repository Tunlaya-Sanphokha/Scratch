class Forloop{
  int boxSize;
  Forloop(int bz){
  boxSize = bz;
  this.drawForloop(10,10);
}
void drawForloop(float bx,float by){///box value
    /*fill(231, 76, 60 );
    rect(bx,by,120, 30);
    fill(253, 254, 254);
    text("for-loop",bx+30,by+30,120, 30);*/
    
    fill(231, 76, 60 );
    rect(10,10+height*2/3,120, 30);
    fill(253, 254, 254);
    text("for-loop",20,10+height*2/3,120, 30);
} 

}
