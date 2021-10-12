class Move extends Tree {
  Tree ts;
  String dir = "R";
  public String display_Move() {
    if (ts != null) {
      float amount = parseFloat(ts.display_Move());
      cat.move(dir,amount);
    }
    if (child != null)
      return child.display_Move();
    return "0";
  }
  Move() {
    this.height_y = 30;
    this.textBox = "Move To";
  }
    boolean menu() {
      if (dir == "R") {
      dir = "R";
    } 
    return false;
  }
  void inputChild(Tree child) {
    if (input)
      if (state == 1) {
        addChild(child);
      } else if (state == 2) {
        ts = child;
      }
    redraw();
    state = 0;
  }
  Tree vts;
  void drawTree() {
    if (ts !=null) {
      vts = ts.getLastChild();
    }
    if (select) {
      fill(255);
    } else {
      fill(255);
    }      
    if (input) {
      if (state == 1) {
        fill(255);
        rect(posx, posy, width_x, height_y);
      } else if (state == 2) {
        fill(255);
        rect(posx, posy, width_x, height_y);
        fill(255);
        rect(posx+55, posy, 20, height_y);
      }
    } else {
      rect(posx, posy, width_x, height_y);
    }
    fill(0);
    text(textBox, posx+10, posy+17);
    width_x = 120;
    if (ts != null) {
      ts.posx = posx+120;
      ts.posy = posy;
      ts.drawTree();

    }

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
  Tree getClass(int x, int y,boolean getout) {
    Tree output = null;
    if (ts != null) {
      output = ts.getClass(x, y,getout);
      if (output != null) {
        if (output == ts && getout) {
          ts = null;
        }
        return output;
      }
    }

    output = super.getClass(x, y,getout);
    return output;
  }
  Tree positionMouse(Tree position) {
    Tree output = null;
    if (ts != null) {
      output = ts.positionMouse(position);
      if (output != null) {
        return output;
      }
    }

    output = super.positionMouse(position); 
    return output;
  }
  Tree Touch(Tree position) {
    state = 1;
    if (ts == null) {
    } else {
    }

    if (position.posx > posx+55 && position.posx < posx+75) {
      if (ts == null) {
        state = 2;
      }
    }
    return this;
  }
}
