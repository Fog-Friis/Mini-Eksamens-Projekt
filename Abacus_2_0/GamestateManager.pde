int gamestate;
TextBox regUserTB, regEmailTB, regPassword1, regPassword2;
TextBox logUserTB, logPasswordTB;

class GameStateManager {

  void setupManager() {

    //setup login screen
    logUserTB = new TextBox(new PVector(width/2-200, height/3.2), new PVector(400, 70), false, 0);
    logPasswordTB = new TextBox(new PVector(width/2-200, height/2.4), new PVector(400, 70), false, 0);

    textBoxes.add(logUserTB);
    textBoxes.add(logPasswordTB);
    
    //setup register screeen
    regUserTB = new TextBox(new PVector(width/2-200, height/3.7), new PVector(400, 70), false, 2);
    regEmailTB = new TextBox(new PVector(width/2-200, height/3.7+110), new PVector(400, 70), false, 2);
    regPassword1 = new TextBox(new PVector(width/2-200, height/3.7+220), new PVector(400, 70), false, 2);
    regPassword2 = new TextBox(new PVector(width/2-200, height/3.7+330), new PVector(400, 70), false, 2);

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
      RegisterScreenElev();
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
    fill(240);
    stroke(6);
    rect(width/2.8,height/5,550,600);
    for (TextBox t : textBoxes) {
      t.display();
    }
    textSize(32);
    text("Brugernavn", width/2-200, height/3.2-10);
    text("Adgangskode", width/2-200, height/2.4-10);
    textSize(48);
    text("Login", width/2.1, height/4);
  }

  void ChooseRegister() {
  }

  void RegisterScreenElev() {
    fill(240);
    stroke(6);
    rect(width/2.8,height/6.8,550,700);
    for (TextBox t : textBoxes) {
      t.display();
    }
    textSize(32);
    text("Brugernavn", width/2-200, height/3.7-10);
    text("Adgangskode", width/2-200, height/3.7+100);
    text("Gentag adgangskode", width/2-200, height/3.7+210);
    text("Lære-ID", width/2-200, height/3.7+320);
    textSize(48);
    text("Registrer lærer", width/2.37, height/5.3);
  }

  void StudentMenu() {
  }

  void TeacherMenu() {
  }
}
