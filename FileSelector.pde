class FileSelector {
  FileSelector(Rect rect, color clr){
    this.rect = rect;
    this.clr = clr;
    SetupButton(new Button(new Rect(0, 0, 0, 0)));
  }
  
  private Rect rect;
  private color clr;
  private Button btn;
  
  private String selectionText = "Please select a file...";
  private int textSize = 28;
  private String selectionPath = null;
  private boolean hasSelected = false;
  
  private void SetupButton(Button button) {
    Rect btnRect = rect.copy();
    btnRect.h = rect.h;
    btnRect.w = btnRect.h;
    btnRect.x = (rect.x + rect.w) - btnRect.w;
    
    button.rect = btnRect;
    button.SetStroke(false);
    button.SetColor(#FF8E15);
    button.SetRadius(25);
    btn = button;
  }
  
  private void ButtonClicked() {
    selectInput("Select song.", "onFileSelected");
  }
  
  void LoadImage(String path, float scale){
    final ImageButton button = new ImageButton(path, btn.rect);
    button.SetImageScale(scale);
    SetupButton(button);
  }
  
  boolean HasSelected(){
    return hasSelected;
  }
  
  String GetSelection(){
    hasSelected = false;
    return selectionPath;
  }
  
  void SetSelectionText(String txt){
    final int maxSize = ((int)rect.w / (int)(textSize / 1.5)) - 1;
    if(txt.length() > maxSize){
      txt = txt.substring(0, maxSize) + "...";
    }
    selectionText = txt;
  }
  
  void OnFileSelected(File file) {
    if(file == null) return;
    if(!file.isFile()){
      println("Selection was not a file...");
      return;
    }
    SetSelectionText(file.getName());
    selectionPath = file.getAbsolutePath();
    hasSelected = true;
  }
  
  void Draw() {
    pushStyle();
    noStroke();
    fill(clr);
    rect(rect.x, rect.y, rect.w, rect.h, 25);
    popStyle();
    
    pushStyle();
    fill(0);
    textAlign(LEFT);
    textSize(textSize);
    text(selectionText, rect.x + 5, rect.y + rect.h/2 + textSize/3);
    popStyle();
    
    this.btn.Draw();
  }
  
  void OnMousePressed() {
    if(this.btn.IsMouseAbove()) {
      ButtonClicked();
    }
  }
}
