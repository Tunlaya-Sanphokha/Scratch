class Cat {
  PImage picCat;
  float posx, posy, pic_Width, pic_Height, radians = 0;

  Cat() { 
    picCat = loadImage("cat.png");
    pic_Width = 200;
    pic_Height = 150;
    posx = 400;
    posy = 400;
  }
  
  Cat(int size) { 
    picCat = loadImage("cat.png");
    pic_Width = 2*size;
    pic_Height = 1.5*size;
    posx = 400;
    posy = 400;
  }
  
  Cat(int size,int posx,int posy) {
    picCat = loadImage("cat.png");
    pic_Width = 2*size;
    pic_Height = 1.5*size;
    this.posx = posx;
    this.posy = posy;
  }  
  
  void draws() {
    pushMatrix();
    translate(posx,posy);
    image(picCat,0,0,pic_Width,pic_Height);
    popMatrix();
  }
  
  void move(String direction,float amount) { 
    switch(direction) {
      case "R" :
        posx += amount*cos(radians);
        posy += amount*sin(radians); 
    }
  }
  
  void turn(String direction,float degrees) {
    switch(direction) {
      case "R" :
      radians = radians + degrees/180*PI;
    }
  }
}
