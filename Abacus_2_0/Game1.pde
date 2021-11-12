GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();
boolean enter;

class Game1 {

  void initiate() {
    gamestateManager = new GameStateManager();
    gamestateManager.setupManager();
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
  
  void clickMouse(){
    for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);
  }

  void display() {
    gamestateManager.manage();
  }
}
