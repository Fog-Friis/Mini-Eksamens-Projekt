int gamestate;
TextBox regUserTB, regEmailTB, regPassword1, regPassword2;
TextBox logUserTB, logPasswordTB;

class GameStateManager {

  void setupManager() {

    //setup login screen
    logUserTB = new TextBox(new PVector(width/2-200, 300), new PVector(400, 70), false, 0);
    logPasswordTB = new TextBox(new PVector(width/2-200, 380), new PVector(400, 70), false, 0);

    textBoxes.add(logUserTB);
    textBoxes.add(logPasswordTB);
    
    //setup register screeen
    regUserTB = new TextBox(new PVector(width/2-200, 300), new PVector(400, 70), false, 2);
    regEmailTB = new TextBox(new PVector(width/2-200, 380), new PVector(400, 70), false, 2);
    regPassword1 = new TextBox(new PVector(width/2-200, 460), new PVector(400, 70), false, 2);
    regPassword2 = new TextBox(new PVector(width/2-200, 540), new PVector(400, 70), false, 2);

    textBoxes.add(regUserTB);
    textBoxes.add(regEmailTB);
    textBoxes.add(regPassword1);
    textBoxes.add(regPassword2);
  }


  //start teacher screens at case 100
  void manage() {

    if (enter) {
      gamestate +=1;
      enter = false;
    }

    switch(gamestate) {
    case 0:
      LoginScreen();
      break;

    case 1:
      ChooseRegister();
      break;

    case 2:
      RegisterScreen();
      break;

    case 3:
      break;

    case 4:
      break;

    default:
      gamestate = 0;
      break;
    }
  }  

  void LoginScreen() {
    for (TextBox t : textBoxes) {
      t.display();
    }
  }

  void ChooseRegister() {
  }

  void RegisterScreen() {
    for (TextBox t : textBoxes) {
      t.display();
    }
  }

  void StudentMenu() {
  }

  void TeacherMenu() {
  }
}
