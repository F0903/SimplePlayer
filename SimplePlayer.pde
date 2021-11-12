import processing.sound.*;

FileSelector songSelector;
Slider speed;
Slider volume;
ToggleButton play;

SoundFile sound;

void setup() {
  size(600, 600);
  frameRate(60);
  background(#111111);

  final String startSong = "sus.mp3";

  final float anchorX = width/2;
  final float anchorY = height/2 + 20;

  textAlign(CENTER);
  textSize(50);
  text("Loading...", width/2, height/2);

  final float selectorW = 500;
  songSelector = new FileSelector(new Rect(anchorX - selectorW/2, anchorY - 265, selectorW, 65), #FFFFFF);
  songSelector.SetSelectionText(startSong);
  songSelector.LoadImage("file-audio-solid.png", 0.5);

  final float sliderW = 500;
  volume = new Slider(new Rect(anchorX - sliderW/2, anchorY, sliderW, 100)); 
  volume.SetHandleImage("volume-down-solid.png", 0.5); 
  volume.SetHandleColor(#FF2211);
  volume.SetHandleRadius(25);
  volume.SetValue(1);

  speed = new Slider(new Rect(anchorX - sliderW/2, anchorY - 150, sliderW, 100)); 
  speed.SetHandleImage("frog-solid.png", 0.5); 
  speed.SetHandleColor(#2B9CFF);
  speed.SetHandleRadius(25);
  speed.SetSnapEnabled(true);
  speed.SetSnap(0.45, 0.55, 0.5);
  speed.SetValue(0.5);

  final float playW = 100;
  play = new ToggleButton(new Rect(anchorX - playW/2, anchorY + 150, playW, playW), "play-solid.png", "pause-solid.png"); 
  play.SetColor(#676767);
  play.SetRadius(25);
  play.SetImageScale(0.5);

  sound = new SoundFile(this, "sus.mp3");
  sound.play();
}

void draw() {
  background(#111111);

  songSelector.Draw();
  if (songSelector.HasSelected()) {
    if(!sound.isPlaying()) play.Invert();
    final String selection = songSelector.GetSelection();
    sound.stop();
    sound = new SoundFile(this, selection); //<>//
    sound.play();
  }

  speed.Draw();
  volume.Draw();
  sound.amp(volume.GetValue());
  sound.rate(speed.GetValue() * 2);

  play.Draw();
  if (play.IsClicked()) {
    if (sound.isPlaying()) sound.pause();
    else sound.play();
  }
}

void mousePressed() {
  songSelector.OnMousePressed();
  speed.OnMousePressed();
  volume.OnMousePressed();
  play.OnMousePressed();
}

void mouseReleased() {
  speed.OnMouseRelease();
  volume.OnMouseRelease();
}

void onFileSelected(File file) {
  songSelector.OnFileSelected(file);
}
