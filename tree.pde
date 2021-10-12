class Tree{
  int posx = 0, posy = 0,width_x = 120 , height_y = 30;
  boolean input = false, select = false ;
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
  void deleteChild(){
    if(child.parent != null){
  }
 }
  void inputChild(Tree child) {
    if (input)
      if (state == 1)addChild(child);
    state = 0;
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
    if (select)
      fill(255);
    else
      if (state == 1 && input)
        fill(255);
      else
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
  Tree Touch(Tree position) {
    state = 1;
    return this;
  }
  Tree positionMouse(Tree position) {
    if ( (position.posx < posx + width_x && position.posx > posx ) &&
         (position.posy < posy + height_y && position.posy > posy )
       ) {
      return Touch(position);
    } else {
      state = 0;
      if (this.child != null) {
        return this.child.positionMouse(position);
      }
    }
    return null;
  }
    public String display_Move() {
    if (child != null)
      return child.display_Move();
    return "0";
  }
    Tree getLastChild() {
    if (this.child != null) {
      return this.child.getLastChild();
    }
    return this;
  }
  Tree() {
    
  }
    Tree getClass(int x, int y,boolean getout) {
    if (x > posx && x < posx + width_x && y > posy && y < posy+height_y) {
      return this;
    } else {
      if (this.child != null) {
        return this.child.getClass(x, y,getout);
      }
    }
    return null;
  } 
    boolean menu() {
    println("Menu " + textBox);
    return false;
  }
  
  void drawMenu() {
      
  }
}
