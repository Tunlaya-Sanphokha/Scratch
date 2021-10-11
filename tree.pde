class Tree{
  int posx = 0, posy = 0,width_x = 120 , height_y = 30;
  boolean input = false, select = false , state = false;
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
  void deleteChild(){
    if(child.parent != null){
  }
 }
  void inputChild(Tree child) {
    if (input)
      if (state == true)addChild(child);
    state = false;
  }
    Tree positionMouse(int mouse_x, int mouse_y) {
    if (mouse_x > posx && mouse_x < posx + width_x && mouse_y > posy && mouse_y < posy + height_y) {
      return this;
    } else {
      if (this.child != null) {
        return this.child.positionMouse(mouse_x, mouse_y);
      }
    }
    return null;
  }

  void drawTree(){
    fill(255);
    rect(posx, posy, width_x, height_y);
    fill(0);
    textSize(15);
    text(textBox, posx+10, posy+17);
    if (this.child != null) {
      if (this.parent == null) {
        this.child.posx = this.posx+10;
        this.child.posy = this.posy + this.height_y;
      } else {
        this.child.posx = this.posx;
        this.child.posy = this.posy + this.height_y;
      }
      this.child.drawTree();
    }
  }

  Tree positionMouse(Tree position) {
    if ( (position.posx < posx + width_x && position.posx > posx ) &&
         (position.posy < posy + height_y && position.posy > posy )
       ) {
         state = true;
      return this;
    } else {
      state = false;
      if (this.child != null) {
        return this.child.positionMouse(position); //recursive self
      }
    }
    return null;
  }
}
