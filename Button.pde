class Button {
  public Button(Rect rect){
    this.rect = rect; 
  }
  
  Rect rect;
  private color clr = #FFFFFF;
  protected boolean clicked;
  
  private boolean stroke;
  private int radius;
  
  void SetColor(color clr) {
    this.clr = clr;
  }
  
  void SetRadius(int radius){
    this.radius = radius;
  }
  
  void SetStroke(boolean value){
    stroke = value;
  }
  
  boolean IsClicked() {
    boolean val = clicked;
    clicked = false;
    return val;
  }
  
  boolean IsMouseAbove() {
    return (mouseX > rect.x && mouseX < rect.x + rect.w) && (mouseY > rect.y && mouseY < rect.y + rect.h);
  }
  
  void Draw() {
    pushStyle();
    if (!stroke) noStroke();
    fill(clr);
    rect(rect.x, rect.y, rect.w, rect.h, radius);
    popStyle();
  }
  
  void OnMousePressed() {
    if (!IsMouseAbove())
      return;
    clicked = true;
  }
}
