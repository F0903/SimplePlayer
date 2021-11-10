class PlayButton {
  public PlayButton(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  private float x, y;
  private float w, h;
  private color clr = #FFFFFF;
  private boolean clicked;
  
  void SetColor(color clr) {
    this.clr = clr;
  }
  
  boolean IsClicked() {
    boolean val = clicked;
    clicked = false;
    return val;
  }
  
  void Draw() {
    pushStyle();
    fill(clr);
    rect(x, y, w, h);
    popStyle();
  }
  
  void OnMouseClick() {
    if((mouseX < x || mouseX > x+w) || (mouseY < y || mouseY > y+h))
      return;
    clicked = true;
  }
}
