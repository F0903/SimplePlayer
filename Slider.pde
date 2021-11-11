class Slider { //<>//
  public Slider(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    SetupHandle();
  }

  private Button handle;

  private float x, y;
  private float w, h;

  private boolean dragging;

  private color clr = #FFFFFF;

  private void SetupHandle() {
    final Button button = new Button(new Rect(x, y, h, h));
    button.rect.Set(x, y, h, h);
    handle = button;   
    SetValue(1);
  }

  float GetLength() {
    return w;
  }

  void SetColor(color clr) {
    this.clr = clr;
  }

  void SetHandleColor(color clr) {
    handle.SetColor(clr);
  }

  void SetHandleRadius(int radius) {
    handle.SetRadius(radius);
  }

  private final float GetHandleRightBound() {
    return x + w - handle.rect.w;
  }

  private final float GetHandleLeftBound() {
    return x;
  }

  float GetValue() {
    final float rightBound = GetHandleRightBound();
    final float leftBound = GetHandleLeftBound();
    final float handlePos = (handle.rect.x - leftBound) / (rightBound - leftBound);  
    println(handlePos);
    return handlePos;
  }

  void SetHandleImage(String path, float scale) {
    final ImageButton imgBtn = new ImageButton(path, handle.rect);
    imgBtn.LoadImage(path);
    imgBtn.SetImageScale(scale);
    handle = imgBtn;
  }

  void SetHandlePosition(float newX) {
    final float rightBound = GetHandleRightBound();
    final float leftBound = GetHandleLeftBound();
    if (newX > rightBound) newX = rightBound;
    else if (newX < leftBound) newX = leftBound;
    handle.rect.x = newX;
  }

  void SetValue(float val) {
    if (val > 1) val = 1;
    else if (val < 0) val = 0; 
    
    final float rightBound = GetHandleRightBound();
    final float leftBound = GetHandleLeftBound();
    SetHandlePosition((rightBound - leftBound) * val + leftBound);
  }

  void Draw() {
    pushStyle();
    noStroke();
    fill(clr);
    rect(x, y, w, h, 25);
    popStyle();

    if (dragging) {
      SetHandlePosition(mouseX - handle.rect.w/2);
    }

    handle.Draw();
  }

  void OnMousePressed() {
    if (handle.IsMouseAbove())
      dragging = true;
  }

  void OnMouseRelease() {
    dragging = false;
  }
}
