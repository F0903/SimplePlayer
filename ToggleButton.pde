class ToggleButton extends ImageButton {
  ToggleButton(Rect rect, String onImagePath, String offImagePath) {
    super(offImagePath, rect);
    onImage = loadImage(onImagePath);
    offImage = loadImage(offImagePath);
  }

  PImage onImage;
  PImage offImage;

  boolean state;

  void Invert() {
    state = !state;
    super.img = state ? onImage : offImage;
  }

  void OnMousePressed() {
    if (!super.IsMouseAbove())
      return;
    super.OnMousePressed();
    Invert();
  }
}
