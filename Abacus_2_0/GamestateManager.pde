int gamestate;
TextBox regUserTB, regEmailTB, regPassword1, regPassword2;
TextBox logUserTB, logPasswordTB;

Button loginBut, registerScreenBut;
Button registerBut, backBut;

class GameStateManager {

  void setupManager() {

    //setup login screen
    logUserTB = new TextBox(new PVector(width/2-200, height/3.2), new PVector(400, 70), false, 0);
    logPasswordTB = new TextBox(new PVector(width/2-200, height/2.4), new PVector(400, 70), false, 0);

    textBoxes.add(logUserTB);
    textBoxes.add(logPasswordTB);

    loginBut = new Button(new PVector(width/2 + 30, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "login", 50, 0);
    registerScreenBut = new Button(new PVector(width/2 - 180, height / 2 + 20), new PVector(160, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "register", 50, 0);

    buttons.add(loginBut);
    buttons.add(registerScreenBut);

    //setup register screeen
    regUserTB = new TextBox(new PVector(width/2-200, height/3.7), new PVector(400, 70), false, 2);
    regEmailTB = new TextBox(new PVector(width/2-200, height/3.7+110), new PVector(400, 70), false, 2);
    regPassword1 = new TextBox(new PVector(width/2-200, height/3.7+220), new PVector(400, 70), false, 2);
    regPassword2 = new TextBox(new PVector(width/2-200, height/3.7+330), new PVector(400, 70), false, 2);

    textBoxes.add(regUserTB);
    textBoxes.add(regEmailTB);
    textBoxes.add(regPassword1);
    textBoxes.add(regPassword2);

    registerBut = new Button(new PVector(width/2 + 30, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "register", 50, 2);
    backBut = new Button(new PVector(width/2 -180, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "back", 50, 2);

    buttons.add(registerBut);
    buttons.add(backBut);
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
      RegisterScreenStudent();
      break;

    case 3:
      RegisterScreenTeacher();
      break;

    case 4:
      StudentMenu();
      break;

    default:
      gamestate = 0;
      break;
    }
  }  

  void LoginScreen() {
    fill(240);
    stroke(6);
    rect(width/2.8, height/5, 550, 600);

    if (registerScreenBut.clicked) {
      gamestate = 1;
    }
    
    if (loginBut.clicked) {
      errorHandler.loginUpdate();
    }
    
    fill(0);
    textSize(32);
    text("Brugernavn", width/2-200, height/3.2-10);
    text("Adgangskode", width/2-200, height/2.4-10);
    textSize(48);
    text("Login", width/2.1, height/4);
  }

  void ChooseRegister() {
  }

  void RegisterScreenStudent() {
    fill(240);
    stroke(6);
    rect(width/2.8, height/6.8, 550, 700);

    if (backBut.clicked) {
      gamestate = 0;
    }
    
    if (registerBut.clicked){
      errorHandler.registerUpdate();
      if (errorType == 0){
        //register user :)
      }
    }
    
    fill(0);
    textSize(32);
    text("Brugernavn", width/2-200, height/3.7-10);
    text("Adgangskode", width/2-200, height/3.7+100);
    text("Gentag adgangskode", width/2-200, height/3.7+210);
    text("Lære-ID", width/2-200, height/3.7+320);
    textSize(48);
    text("Registrer lærer", width/2.37, height/5.3);
  }

  void RegisterScreenTeacher() {
  }

  void StudentMenu() {
    textSize(48);
    fill(0);
    rect(0,width/22,width,width/36);
    text("Prøver:", width/9.8,height/4.7,999,999);
    rect(0,height/3.6,width,2);
  }

  void TeacherMenu() {
  }
}
