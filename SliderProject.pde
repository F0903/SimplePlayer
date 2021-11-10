import processing.sound.*;

SoundFile sound;
Slider speed;
Slider volume;
PlayButton play;

void setup() {
  size(600, 600);
  frameRate(60);
  background(#111111);

  final float anchorX = width/2;
  final float anchorY = height/2 - 50;

  textAlign(CENTER);
  textSize(50);
  text("Loading...", anchorX, anchorY+50);

  final float sliderW = 500;
  volume = new Slider(anchorX - sliderW/2, anchorY, sliderW, 100);
  volume.SetHandle(volume.new SliderHandle(#FF2211, 100, 100));
  volume.SetValue(1);

  speed = new Slider(anchorX - sliderW/2, anchorY - 150, sliderW, 100);
  speed.SetHandle(speed.new SliderHandle(#2B9CFF, 100, 100));
  speed.SetValue(0.5);

  final float playW = 100;
  play = new ImagePlayButton("play-pause.png", anchorX - playW/2, anchorY + 150, playW, playW);

  sound = new SoundFile(this, "sus.mp3");
  sound.loop();
}

void draw() {
  background(#111111);

  speed.Draw();
  volume.Draw();
  println(volume.GetValue());
  sound.amp(volume.GetValue());
  sound.rate(speed.GetValue() * 2);

  play.Draw();
  if (play.IsClicked()) {
    final boolean isPlaying = sound.isPlaying();
    if (isPlaying) sound.pause();
    else sound.play();
  }
}

void mousePressed() {
  speed.OnMouseClick();
  volume.OnMouseClick();
  play.OnMouseClick();
}

void mouseReleased() {
  speed.OnMouseRelease();
  volume.OnMouseRelease();
}
