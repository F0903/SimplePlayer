class ImagePlayButton extends PlayButton {
   public ImagePlayButton(String imagePath, float x, float y, float w, float h) {
     super(x, y, w, h);
     img = loadImage(imagePath);
   }
   
   private PImage img;
   
   void Draw(){
     image(img, super.x, super.y, super.w, super.h);
   }
}
