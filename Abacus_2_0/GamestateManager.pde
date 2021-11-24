int gamestate;
TextBox regUserTB, regEmailTB, regPassword1, regPassword2;
TextBox logUserTB, logPasswordTB;

Button loginBut, registerScreenBut;
Button registerBut, backBut;
Button logoutBut, resultaterElevBut;
Button resultaterLærerBut;
Button prøverElevBut;
Button prøverLærerBut;

PFont Comic;
PFont norm;

class GameStateManager {

  void setupManager() {

    norm = createFont("Arial",18);
    Comic = createFont("Comic Sans MS",18);
    
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
    
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 4);
    resultaterElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 4);
    
    buttons.add(logoutBut);
    buttons.add(resultaterElevBut);
    
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 5);
    resultaterLærerBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 5);
    
    buttons.add(logoutBut);
    buttons.add(resultaterLærerBut);
    
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 6);
    prøverElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 6);
    
    buttons.add(logoutBut);
    buttons.add(prøverElevBut);
    
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 7);
    prøverLærerBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 7);
    
    buttons.add(logoutBut);
    buttons.add(prøverLærerBut);
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
      StudentPrøveMenu();
      break;

    case 5:
      TeacherPrøveMenu();
      break;

    case 6:
      StudentResultatMenu();
      break;

    case 7:
      TeacherResultatMenu();
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

  void StudentPrøveMenu() {
    textFont(Comic);
    text("ELEV",10,10,99,99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0,height/12,width,height/27);
    text("Prøver:", width/9.8,height/4.7,999,999);
    text("Status:", width-width/3.84,height/4.7,999,999);
    rect(0,height/3.6,width,2);
    if (logoutBut.clicked == true) {
      gamestate = 0;
    }
  }

  void TeacherPrøveMenu() {
    textFont(Comic);
    text("LÆRE",10,10,99,99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0,height/12,width,height/27);
    text("Prøver:", width/9.8,height/4.7,999,999);
    text("Status:", width-width/3.84,height/4.7,999,999);
    rect(0,height/3.6,width,2);
    if (logoutBut.clicked == true) {
      gamestate = 0;
    }
  }
  void StudentResultatMenu() {
    textFont(Comic);
    text("ELEV",10,10,99,99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0,height/12,width,height/27);
    text("Resultater:", width/9.8,height/4.7,999,999);
    text("Karakter:", width-width/3.84,height/4.7,999,999);
    rect(0,height/3.6,width,2);
    if (logoutBut.clicked == true) {
      gamestate = 0;
    }
  }
  void TeacherResultatMenu() {
    textFont(Comic);
    text("LÆRE",10,10,99,99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0,height/12,width,height/27);
    text("Resultater:", width/9.8,height/4.7,999,999);
    text("Besvaret:", width-width/3.84,height/4.7,999,999);
    rect(0,height/3.6,width,2);
    if (logoutBut.clicked == true) {
      gamestate = 0;
    }
  }
}
