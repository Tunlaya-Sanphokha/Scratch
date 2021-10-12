class Value extends Tree{
  String varname = " ";
  String value = " ";
  Value() {
  }
  public String display_Move() {
    if (child != null) {
      child.display_Move();  
    }
    return values.get(varname);
  }
  void setValue(String value) {
     values.put(varname,value);
  }
  void setName(String name){
    this.varname = name;
    this.textBox = name;
  }
}
