class Rect {
  Rect(float x, float y, float w, float h) {
    Set(x, y, w, h);
  }

  float x, y; 
  float w, h;

  void SetPos(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void SetDimensions(float w, float h) {
    this.w = w;
    this.h = h;
  }

  void Set(float x, float y, float w, float h) {
    SetPos(x, y);
    SetDimensions(w, h);
  }

  Rect copy() {
    return new Rect(x, y, w, h);
  }
}
