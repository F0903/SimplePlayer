class Slider { //<>//
  public Slider(Rect rect) {
    this.rect = rect;
    SetupHandle();
  }

  private Button handle;

  private Rect rect;

  private boolean snapEnabled = false;
  private float snapLower, snapUpper, snapValue;

  private boolean dragging;

  private color clr = #FFFFFF;

  private void SetupHandle() {
    final Button button = new Button(new Rect(rect.x, rect.y, rect.h, rect.h));
    button.rect.Set(rect.x, rect.y, rect.h, rect.h);
    handle = button;   
    SetValue(1);
  }

  float GetLength() {
    return rect.w;
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
    return rect.x + rect.w - handle.rect.w;
  }

  private final float GetHandleLeftBound() {
    return rect.x;
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

  private void SetHandlePosition(float newX) {
    final float rightBound = GetHandleRightBound();
    final float leftBound = GetHandleLeftBound();
    if (newX > rightBound) newX = rightBound;
    else if (newX < leftBound) newX = leftBound;
    handle.rect.x = newX;
  }

  float GetHandleNormalizedPosition(float newX){
    final float rightBound = GetHandleRightBound();
    final float leftBound = GetHandleLeftBound();
    return (newX - leftBound) / (rightBound - leftBound);
  }

  void SetSnapEnabled(boolean value) {
    snapEnabled = value;
  }

  void SetSnap(float lower, float upper, float snapTo) {
    snapLower = lower;
    snapUpper = upper;
    snapValue = snapTo;
  }

  void SetValue(float val) { 
    if (snapEnabled && val < snapUpper && val > snapLower) val = snapValue;  
    else if (val > 1) val = 1;
    else if (val < 0) val = 0; 

    final float rightBound = GetHandleRightBound();
    final float leftBound = GetHandleLeftBound();
    SetHandlePosition((rightBound - leftBound) * val + leftBound);
  }

  void Draw() {
    pushStyle();
    noStroke();
    fill(clr);
    rect(rect.x, rect.y, rect.w, rect.h, 25);
    popStyle();

    if (dragging) {
      final float norm = GetHandleNormalizedPosition(mouseX - handle.rect.w/2);
      SetValue(norm);
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
