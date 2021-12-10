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
    if (keyCode == 46) {
      period = true;
    }

    if (key == ENTER) {
      enter = true;
    }
  }

  void releaseKey() {
    if (keyCode == 46) {
      period = false;
    }

    if (key == ENTER) {
      enter = false;
    }
  }

  void display() {    
    gamestateManager.manage();
    sb1.run();
    sb2.run();
    sb3.run();



    for (TextBox t : textBoxes) {
      if (gamestate <6) t.scroll = -sb1.spos;
      if (gamestate == 6) t.scroll = -sb2.spos;
      if (gamestate >6) t.scroll = -sb3.spos;
      t.display();
    }
    for (Button b : buttons) { 
      if (gamestate < 6) b.scroll = -sb1.spos;
      if (gamestate == 6) b.scroll = -sb2.spos;
      if (gamestate > 8) b.scroll = -sb3.spos;
      b.display();
    }
    for (DropdownMenu d : dropdownMenus) { 
      if (gamestate < 6) d.scroll = -sb1.spos;
      if (gamestate == 6) d.scroll = -sb2.spos;
      if (gamestate > 6) d.scroll = -sb3.spos;
      d.display();
    }
    fill(255);
    if (gamestateManager.showrect && gamestate == 5) {
      rect(opgaveTB.position.x, opgaveTB.position.y, +opgaveTB.size.x, 7*rsvar4But.pos.y/10);
    }

    errorHandler.display();
  }

  void pressMouse() {    
    for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);

    for (DropdownMenu d : dropdownMenus) {
      d.pressed();
      for (dropdownObject o : d.objects) o.pressed();
    }
  }

  void releaseMouse() {

    for (DropdownMenu d : dropdownMenus) {
      for (dropdownObject o : d.objects) o.released();
    }
  }

  void clickMouse() {
    for (Button b : buttons) b.pressed();
  }
}
