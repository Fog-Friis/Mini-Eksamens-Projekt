int gamestate;
TextBox regUserLaererTB, regLaererID, regPasswordLaerer1, regPasswordLaerer2, regUserElevTB, regPasswordElevTB, regVerifikationElevTB;
TextBox logUserTB, logPasswordTB;

Button loginBut, registerScreenBut;
Button ElevRegisterBut, LaererRegisterBut, TilbageBut;
Button registerElevBut, backElevBut, registerLaererBut, backLaererBut;
Button logoutBut, resultaterElevBut;
Button resultaterLaererBut;
Button proeverElevBut;
Button proeverLaererBut, opretProeveBut, uddelProeveBut;
Button opgaveTilbageBut, opgaveFremBut, opgaveSlutBut, svar1But, svar2But, svar3But, svar4But;

int[] elevSvarNR = new int[10];
int[] realtSvarNR = new int[10];
int currentopgave = 1, maxopgaver=10;
String[] opgavetekst = new String[10];
String currentOpgaveTekst;
boolean update = false;
DropdownMenu uddannelsesInstitution;
DropdownMenu klasseValg, testValg;

PFont Comic;
PFont norm;

class GameStateManager {

  void setupManager() {

    norm = createFont("Arial", 18);
    Comic = createFont("Comic Sans MS", 18);

    //setup login screen
    logUserTB = new TextBox(new PVector(width/2-200, height/3.2), new PVector(400, 70), false, 0);
    logPasswordTB = new TextBox(new PVector(width/2-200, height/2.4), new PVector(400, 70), false, 0);

    textBoxes.add(logUserTB);
    textBoxes.add(logPasswordTB);

    loginBut = new Button(new PVector(width/2 + 30, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Login", 50, 0);
    registerScreenBut = new Button(new PVector(width/2 - 180, height / 2 + 20), new PVector(160, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Register", 50, 0);

    buttons.add(loginBut);
    buttons.add(registerScreenBut);

    ElevRegisterBut = new Button(new PVector(width/2.72+40, height/3.2+30), new PVector(180, 340), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Elev", 50, 1);
    LaererRegisterBut = new Button(new PVector(width/2+40, height/3.2+30), new PVector(180, 340), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Lærer", 50, 1);
    TilbageBut = new Button(new PVector(width/2.72+40, height/1.45+30), new PVector(425, 40), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Tilbage", 50, 1);

    buttons.add(ElevRegisterBut);
    buttons.add(LaererRegisterBut);
    buttons.add(TilbageBut);

    regUserElevTB = new TextBox(new PVector(width/2-200, height/3.7+20), new PVector(400, 70), false, 3);
    regPasswordElevTB = new TextBox(new PVector(width/2-200, height/3.7+150), new PVector(400, 70), false, 3);
    regVerifikationElevTB = new TextBox(new PVector(width/2-200, height/3.7+280), new PVector(400, 70), false, 3);

    textBoxes.add(regUserElevTB);
    textBoxes.add(regPasswordElevTB);
    textBoxes.add(regVerifikationElevTB);

    registerElevBut = new Button(new PVector(width/2 + 30, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 50, 3);
    backElevBut = new Button(new PVector(width/2 -180, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Tilbage", 50, 3);

    buttons.add(registerElevBut);
    buttons.add(backElevBut);

    uddannelsesInstitution= new DropdownMenu(new PVector(width/2-200, height/2+63), new PVector(400, 50), "Vælg uddannelses institution", 24, 1, 2, new ArrayList<dropdownObject>());

    dropdownMenus.add(uddannelsesInstitution);

    uddannelsesInstitution.objects.add(new dropdownObject(uddannelsesInstitution.pos, uddannelsesInstitution.size, "H. C. Ørsted Lyngby", 1, false));

    //setup register screeen
    regUserLaererTB = new TextBox(new PVector(width/2-200, height/3.7), new PVector(400, 70), false, 2);
    regPasswordLaerer1 = new TextBox(new PVector(width/2-200, height/3.7+110), new PVector(400, 70), false, 2);
    regPasswordLaerer2 = new TextBox(new PVector(width/2-200, height/3.7+220), new PVector(400, 70), false, 2);
    regLaererID = new TextBox(new PVector(width/2-200, height/3.7+410), new PVector(400, 70), false, 2);

    textBoxes.add(regUserLaererTB);
    textBoxes.add(regPasswordLaerer1);
    textBoxes.add(regPasswordLaerer2);
    textBoxes.add(regLaererID);

    registerLaererBut = new Button(new PVector(width/2 + 30, height / 2 + 290), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 50, 2);
    backLaererBut = new Button(new PVector(width/2 -180, height / 2 + 290), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Tilbage", 50, 2);

    buttons.add(registerLaererBut);
    buttons.add(backLaererBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 4);
    resultaterElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 4);

    buttons.add(logoutBut);
    buttons.add(resultaterElevBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 5);
    resultaterLaererBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 5);
    opretProeveBut = new Button(new PVector(width/4, height - 200), new PVector(width/2, 40), 40, color(205), color(225), color(225, 225, 235), "Opret opgavesæt", 40, 5);
    uddelProeveBut = new Button(new PVector(width/4, height - 100), new PVector(width/2, 40), 40, color(205), color(225), color(225, 225, 235), "Uddel opgavesæt", 40, 5);

    buttons.add(opretProeveBut);
    buttons.add(uddelProeveBut);
    buttons.add(logoutBut);
    buttons.add(resultaterLaererBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 6);
    resultaterLaererBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 6);

    buttons.add(logoutBut);
    buttons.add(resultaterLaererBut);

    klasseValg= new DropdownMenu(new PVector(width/2-275, height/2-150), new PVector(550, 50), "Klasse", 32, 10, 6);
    testValg= new DropdownMenu(new PVector(width/2-275, height/2), new PVector(550, 50), "Test", 32, 10, 6);

    dropdownMenus.add(klasseValg);
    dropdownMenus.add(testValg);

    klasseValg.objects.add(new dropdownObject(klasseValg.pos, klasseValg.size, "3a2 I guess (database her)", 1, false));
    testValg.objects.add(new dropdownObject(testValg.pos, testValg.size, "IDK IQ something navn", 1, false));
    

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 7);
    proeverElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 7);

    buttons.add(logoutBut);
    buttons.add(proeverElevBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 8);
    proeverLaererBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 8);

    buttons.add(logoutBut);
    buttons.add(proeverLaererBut);

    //Testscreen
    opgaveFremBut= new Button(new PVector(width-width/7,250), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Opgave frem", 24, 9);
    opgaveTilbageBut = new Button(new PVector(width-width/1.1, 250), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "opgave Tilbage", 24, 9);
    opgaveSlutBut = new Button(new PVector(width-width/7, height - 1050), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Opgaveslut", 24, 9);
    svar1But = new Button(new PVector(width-width/3.4, height - 750), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar1", 24, 9);
    svar2But = new Button(new PVector(width-width/3.4, height - 600), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar2", 24, 9);
    svar3But = new Button(new PVector(width-width/3.4, height - 450), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar3", 24, 9);
    svar4But = new Button(new PVector(width-width/3.4, height - 300), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar4", 24, 9);

    buttons.add(opgaveTilbageBut);
    buttons.add(opgaveFremBut);
    buttons.add(opgaveSlutBut);
    buttons.add(svar1But);
    buttons.add(svar2But);
    buttons.add(svar3But);
    buttons.add(svar4But);
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
      RegisterScreenTeacher();
      break;

    case 3:
      RegisterScreenStudent();
      break;

    case 4:
      StudentProeveMenu();
      break;

    case 5:
      TeacherProeveMenu();
      break;

    case 6:
      TeacherUddelProeveMenu();
      break;

    case 7:
      StudentResultatMenu();
      break;

    case 8:
      TeacherResultatMenu();
      break;

    case 9:
      testscreen();
      break;

    default:
      gamestate = 0;
      break;
    }
  }

  void LoginScreen() {
    fill(240);
    stroke(6);
    strokeWeight(2);
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
    fill(240);
    stroke(6);
    rect(width/2.8, height/6.8, 550, 700);
    fill(0);
    textSize(25);
    text("Hvilken bruger vil du gerne registreres som?", width/2.622, height/5.6, 550, 500);
    fill(100);
    textSize(23);
    text("Er du lærer eller elev?", width/2.265, height/4.2, 550, 500);
    fill(200);
    if (TilbageBut.clicked) {
      gamestate = 0;
    }
    if (ElevRegisterBut.clicked) {
      gamestate = 3;
    }
    if (LaererRegisterBut.clicked) {
      gamestate = 2;
    }
  }

  void RegisterScreenStudent() {
    fill(240);
    stroke(6);
    rect(width/2.8, height/6.8, 550, 700);

    if (backElevBut.clicked) {
      gamestate = 0;
    }
    if (registerElevBut.clicked) {
      errorHandler.registerUpdate();
      if (errorType == 0) {
        //register user :)
      }
    }
    fill(0);
    textSize(32);
    text("Brugernavn", width/2-200, height/3.7+10);
    text("Adgangskode", width/2-200, height/3.7+140);
    text("Uni-login", width/2-200, height/3.7-22);
    text("Verifikationskode", width/2-200, height/3.7+270);
    textSize(48);
    text("Registrer elev  ", width/2.37, height/5.3);
  }

  void RegisterScreenTeacher() {
    fill(240);
    stroke(6);
    rect(width/2.8, height/6.8, 550, 770);

    if (backLaererBut.clicked) {
      gamestate = 0;
    }
    if (registerLaererBut.clicked) {
      errorHandler.registerUpdate();
      if (errorType == 0) {
        //register user :)
      }
    }
    fill(0);
    textSize(32);
    text("Brugernavn", width/2-200, height/3.7-10);
    text("Adgangskode", width/2-200, height/3.7+100);
    text("Gentag adgangskode", width/2-200, height/3.7+210);
    text("Lære-ID", width/2-200, height/3.7+400);
    textSize(48);
    text("Registrer lærer", width/2.37, height/5.3);
  }

  void StudentProeveMenu() {
    textFont(Comic);
    text("ELEV", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Prøver:", width/9.8, height/4.7, 999, 999);
    text("Status:", width-width/3.84, height/4.7, 999, 999);
    rect(0, height/3.6, width, 2);
    if (logoutBut.clicked) {
      gamestate = 0;
    }
    if (resultaterElevBut.clicked) {
      gamestate = 7;
    }
  }

  void TeacherProeveMenu() {
    textFont(Comic);
    text("LÆREr", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Prøver:", width/9.8, height/4.7, 999, 999);
    text("Status:", width-width/3.84, height/4.7, 999, 999);
    rect(0, height/3.6, width, 2);
    if (logoutBut.clicked) {
      gamestate = 0;
    }
    if (resultaterLaererBut.clicked) {
      gamestate = 8;
    }
    if (uddelProeveBut.clicked) {
      gamestate = 6;
    }
  }
  void TeacherUddelProeveMenu() {
    textFont(Comic);
    text("LÆREr", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Prøver:", width/9.8, height/4.7, 999, 999);
    text("Status:", width-width/3.84, height/4.7, 999, 999);
    rect(0, height/3.6, width, 2);
    if (logoutBut.clicked) {
      gamestate = 0;
    }
    if (resultaterLaererBut.clicked) {
      gamestate = 8;
    }
    stroke(0);
    fill(240);
    rect(width/2-400, height/5.5, 800, 800);
    fill(0);
    textSize(38);
    text("Uddel opgavesæt", width/2-140, height/6.8+60, 999, 100);
  }


  void StudentResultatMenu() {
    textFont(Comic);
    text("ELEV", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Resultater:", width/9.8, height/4.7, 999, 999);
    text("Karakter:", width-width/3.84, height/4.7, 999, 999);
    rect(0, height/3.6, width, 2);
    if (logoutBut.clicked) {
      gamestate = 0;
    }
    if (proeverElevBut.clicked) {
      gamestate = 4;
    }
  }
  void TeacherResultatMenu() {
    textFont(Comic);
    text("LÆREr", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Resultater:", width/9.8, height/4.7, 999, 999);
    text("Besvaret:", width-width/3.84, height/4.7, 999, 999);
    rect(0, height/3.6, width, 2);
    if (logoutBut.clicked == true) {
      gamestate = 0;
    }
    if (proeverLaererBut.clicked == true) {
      gamestate = 5;
    }
  }
  void updatetest() {
    background(255);
    fill(110,255,110);
    rect(0,80,width,150);
    textFont(Comic);
    fill(0);
    text("Elev nr 12", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    text(currentopgave+": "+currentOpgaveTekst, width/9.8, height/4.7, 999, 999);
  }
  void testscreen() {
    
    opgavetekst[0]= "hey1";
    opgavetekst[1]= "hey2";
    opgavetekst[2]= "hey3";
    opgavetekst[3]= "hey4";
    opgavetekst[4]= "hey5";
    opgavetekst[5]= "hey6";
    opgavetekst[6]= "hey7";
    opgavetekst[7]= "hey8";
    opgavetekst[8]= "hey9";
    opgavetekst[9]= "hey10";

    if (update == false) {

      currentOpgaveTekst =opgavetekst[0];
      update = true;
    }
    //lav en load funktion på menuskærmen

    updatetest();






    if (opgaveTilbageBut.clicked == true && currentopgave != 1) {
      currentopgave -= 1;
      currentOpgaveTekst = opgavetekst[currentopgave-1];
      updatetest();
    }
    if (opgaveFremBut.clicked == true && currentopgave != maxopgaver) {
      currentopgave += 1;
      currentOpgaveTekst = opgavetekst[currentopgave-1];
      updatetest();
    }
    if (opgaveSlutBut.clicked == true) {
      gamestate = 0;
      println(elevSvarNR);
    }
    if (svar1But.clicked == true) {
      elevSvarNR[currentopgave-1] = 1;
    }
    if (svar2But.clicked == true) {
      elevSvarNR[currentopgave-1] = 2;
    }
    if (svar3But.clicked == true) {
      elevSvarNR[currentopgave-1] = 3;
    }
    if (svar4But.clicked == true) {
      elevSvarNR[currentopgave-1] = 4;
    }
  }
}
