class ImageButton extends Button {
   public ImageButton(String imagePath, Rect rect) {
     super(rect);
     img = loadImage(imagePath);
   }
   
   protected PImage img;
   protected float imgScale;
   private boolean drawBase = true;
   
   void SetDrawBase(boolean value){
     this.drawBase = value;
   }
   
   void LoadImage(String path){
     img = loadImage(path);
   }
   
   void SetImageScale(float imgScale){
     this.imgScale = imgScale;
   }
   
   void Draw(){
     if (drawBase) super.Draw();
     final float imgW = super.rect.w * imgScale;
     final float imgH = super.rect.h * imgScale;
     image(img, super.rect.x + imgW/2, super.rect.y + imgH/2, imgW, imgH);
   }
}
