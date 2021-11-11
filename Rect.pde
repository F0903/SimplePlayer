class Rect {
  Rect(float x, float y, float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }
  
  float x, y; 
  float w, h;
  
  Rect copy(){
    return new Rect(x, y, w, h);
  }
}
