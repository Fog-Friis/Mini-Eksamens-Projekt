GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<DropdownMenu> dropdownMenus = new ArrayList<DropdownMenu>();
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

    if (key == ENTER) {
      enter = true;
    }
  }

  void releaseKey() {

    if (key == ENTER) {
      enter = false;
    }
  }

  void display() {    
    gamestateManager.manage();
    sb1.run();
    sb2.run();
    sb3.run();
    sb4.run();


    for (TextBox t : textBoxes) {
      if (gamestate == 3) t.scroll = -sb1.spos;
      if (gamestate == 6) t.scroll = -sb2.spos;
      if (gamestate == 7) t.scroll = -sb3.spos;
      if (gamestate == 9) t.scroll = -sb4.spos;
      t.display();
    }
    for (Button b : buttons) { 
      if (gamestate == 3) b.scroll = -sb1.spos;
      if (gamestate == 6) b.scroll = -sb2.spos;
      if (gamestate == 7) b.scroll = -sb3.spos;
      if (gamestate == 9) b.scroll = -sb4.spos;
      b.display();
    }
    for (DropdownMenu d : dropdownMenus) { 
      if (gamestate == 3) d.scroll = -sb1.spos;
      if (gamestate == 6) d.scroll = -sb2.spos;
      if (gamestate == 7) d.scroll = -sb3.spos;
      if (gamestate == 9) d.scroll = -sb4.spos;
      d.display();
    }
    fill(255);
    errorHandler.display();
  }

  void pressMouse() {    
    for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);

    for (DropdownMenu d : dropdownMenus) {
      d.pressed();
      for (dropdownObject o : d.objects) o.pressed();
    }
    for (Button b : buttons) b.pressed();
  }

  void releaseMouse() {

    for (DropdownMenu d : dropdownMenus) {
      for (dropdownObject o : d.objects) o.released();
    }
    
    for (Button b : buttons)b.released();
  }

  void clickMouse() {
    //for (Button b : buttons) b.pressed();
  }
}
