class Slider { //<>//
  class SliderHandle {
    public SliderHandle(color clr, float w, float h) {
      this.clr = clr;
      this.w = w;
      this.h = h;
    }

    private Slider parent = null;

    private color clr;
    private float w, h;
    private float position; 

    void SetParent(Slider parent) {
      this.parent = parent;
    }

    float GetPosition() {
      return position;
    }

    boolean IsMouseAbove() {
      float position = GetPosition();
      final float x = parent.x + position;
      final float y = parent.y + ((parent.h - h)/2);
      final float mX = mouseX;
      final float mY = mouseY;
      final boolean xMatch = (mX > x && mX < x+w);
      final boolean yMatch = (mY > y && mY < y+h); 
      return xMatch && yMatch;
    }

    void SetPosition(float pos) {
      if (parent == null)
        throw new NullPointerException();
      final float max = parent.w - w;
      final float min = 0;
      if (pos > max) pos = max;
      if (pos < min) pos = min;
      position = pos;
    }

    void UpdateToMouse() {
      final float newX = mouseX - parent.x - w/2;
      SetPosition(newX);
    }

    void Draw() {
      final float x = parent.x;
      final float y = parent.y;
      pushStyle();
      fill(clr);
      noStroke();
      rect(x + position, y + ((parent.h - h)/2), w, h, 25);
      popStyle();
    }
  }

  public Slider(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  private SliderHandle handle;

  private float x, y;
  private float w, h;

  private boolean dragging;

  private color clr = #FFFFFF;

  void SetHandle(SliderHandle handle) { 
    this.handle = handle;
    handle.SetParent(this);
  }

  float GetLength() {
    return w;
  }

  void SetColor(color clr) {
    this.clr = clr;
  }

  float GetValue() {
    final float handlePos = handle.GetPosition(); 
    return handlePos / (w - handle.w);
  }

  void SetValue(float val) {
    if (val > 1) val = 1;
    if (val < 0) val = 0;
    handle.SetPosition((w - handle.w) * val);
  }

  void Draw() {
    pushStyle();
    noStroke();
    fill(clr);
    rect(x, y, w, h, 25);
    popStyle();

    if (dragging) handle.UpdateToMouse();
    handle.Draw();
  }

  void OnMouseClick() {
    if (handle.IsMouseAbove())
      dragging = true;
  }

  void OnMouseRelease() {
    dragging = false;
  }
}
