class Tree{
  int posx = 0, posy = 0,width_x = 120 , height_y = 30;
  boolean input = false, select = false;
  int state = 0;
  String textBox = " ";
  Tree parent,child;
  
  
  void addToLastChild(Tree child){
    if(this.child != null){
      this.child.addToLastChild(child);
    }else{
      child.parent = this;
      this.child =  child;
    }
  }
  void addChild(Tree child){
    child.parent = this;
    if(this.child != null){
      child.addToLastChild(this.child);
    }
    this.child = child;
  }
  void delChild(Tree child){
    if(child.parent != null){
      
    }
  }


  
  void drawTree(){
    fill(46,134,193);
    rect(posx, posy, width_x, height_y);
    fill(255);
    textSize(20);
    text(textBox, posx+30, posy+20);
  }
  
  
}
