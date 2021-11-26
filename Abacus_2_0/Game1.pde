GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();
ArrayList<Button> buttons = new ArrayList<Button>();
boolean enter;
ErrorHandler errorHandler;

class Game1 {

  void initiate() {
    gamestateManager = new GameStateManager();
    gamestateManager.setupManager();
    errorHandler = new ErrorHandler();
  }

  void pressKey() {
    for (TextBox t : textBoxes) {
      if (t.keyWasTyped(key, (int)keyCode)) {
      }
    }
    if (keyCode == 46) {
      period = true;
    }
    
    if (key == ENTER){
      enter = true;
    }
  }

  void releaseKey() {
    if (keyCode == 46) {
      period = false;
    }
    
    if (key == ENTER){
      enter = false;
    }
    
  }
  
  void display() {    
    gamestateManager.manage();
    
    for (TextBox t : textBoxes) t.display();
    for (Button b : buttons) b.display();
    
    errorHandler.display();
  }
  
  void pressMouse(){
    for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);
  }
  
  void clickMouse(){
    for (Button b : buttons) b.pressed();
  }
}
