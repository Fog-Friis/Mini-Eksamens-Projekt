GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();

class Game1 {

  void initiate() {
    gamestateManager = new GameStateManager();
  }

  void pressKey() {
    for (TextBox t : textBoxes) {
      if (t.keyWasTyped(key, (int)keyCode)) {
      }
    }
    if (keyCode == 46) {
      period = true;
    }
  }

  void releaseKey() {
    if (keyCode == 46) {
      period = false;
    }
  }
  
  void clickMouse(){
    for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);
  }

  void display() {
    gamestateManager.manage();
  }
}
