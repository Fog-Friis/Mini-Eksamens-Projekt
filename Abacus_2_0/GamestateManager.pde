int gamestate;
TextBox regUserLaererTB, regLaererID, regPasswordLaerer1, regPasswordLaerer2, regUserElevTB, regPasswordElevTB, regVerifikationElevTB;
TextBox logUserTB, logPasswordTB;
TextBox opgaveTB, svar1TB, svar2TB, svar3TB, svar4TB;
  
Button loginBut, registerScreenBut, laererLoginBut;
Button ElevRegisterBut, LaererRegisterBut, TilbageBut;
Button registerElevBut, backElevBut, registerLaererBut, backLaererBut;
Button logoutBut, resultaterElevBut;
Button resultaterLaererBut;
Button proeverElevBut;
Button proeverLaererBut, opretProeveBut, uddelProeveBut;
Button opgaveTilbageBut, opgaveFremBut, opgaveSlutBut, svar1But, svar2But, svar3But, svar4But;
Button annullerBut, gemBut, rsvar1But, rsvar2But, rsvar3But, rsvar4But;

Scrollbar sb1, sb2, sb3;


int[] elevSvarNR = new int[25];
int[] realtSvarNR = new int[25];
int currentopgave =1, maxopgaver;
String[] opgavetekst = new String[25];
String[] opgaveSvar1 = new String[25];
String[] opgaveSvar2 = new String[25];
String[] opgaveSvar3 = new String[25];
String[] opgaveSvar4 = new String[25];

String currentOpgaveTekst, currentSvar1Tekst, currentSvar2Tekst, currentSvar3Tekst, currentSvar4Tekst;
boolean update = false;
DropdownMenu uddannelsesInstitution;
DropdownMenu klasseValg, testValg;

PFont Comic;
PFont norm;

class GameStateManager {

  void setupManager() {

    //setup scroll bars
    sb1 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 2);
    sb2 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 6);    
    sb3 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 8);

    norm = createFont("Arial", 18);
    Comic = createFont("Comic Sans MS", 18);

    //setup login screen
    logUserTB = new TextBox(new PVector(width/2-200, height/3.2), new PVector(400, 70), false, 0);
    logPasswordTB = new TextBox(new PVector(width/2-200, height/2.4), new PVector(400, 70), false, 0);

    textBoxes.add(logUserTB);
    textBoxes.add(logPasswordTB);

    loginBut = new Button(new PVector(width/2 + 30, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Login", 50, 0);
    registerScreenBut = new Button(new PVector(width/2 - 180, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Register", 50, 0);
    laererLoginBut = new Button(new PVector(width/2-180, height/2+120), new PVector(365, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Lærer-login", 50, 0);

    buttons.add(laererLoginBut);
    buttons.add(loginBut);
    buttons.add(registerScreenBut);
    
    logUserTB = new TextBox(new PVector(width/2-200, height/3.2), new PVector(400, 70), false, 1);
    logPasswordTB = new TextBox(new PVector(width/2-200, height/2.4), new PVector(400, 70), false, 1);

    textBoxes.add(logUserTB);
    textBoxes.add(logPasswordTB);

    loginBut = new Button(new PVector(width/2 + 30, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Login", 50, 1);
    registerScreenBut = new Button(new PVector(width/2 - 180, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Register", 50, 1);
    laererLoginBut = new Button(new PVector(width/2-180, height/2+120), new PVector(365, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Elev-login", 50, 1);

    buttons.add(laererLoginBut);
    buttons.add(loginBut);
    buttons.add(registerScreenBut);

    ElevRegisterBut = new Button(new PVector(width/2.72+40, height/3.2+30), new PVector(180, 340), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Elev", 50, 2);
    LaererRegisterBut = new Button(new PVector(width/2+40, height/3.2+30), new PVector(180, 340), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Lærer", 50, 2);
    TilbageBut = new Button(new PVector(width/2.72+40, height/1.45+30), new PVector(425, 40), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Tilbage", 50, 2);

    buttons.add(ElevRegisterBut);
    buttons.add(LaererRegisterBut);
    buttons.add(TilbageBut);

    //setup choose register screen

    regUserElevTB = new TextBox(new PVector(width/2-200, height/3.7+20), new PVector(400, 70), false, 4);
    regPasswordElevTB = new TextBox(new PVector(width/2-200, height/3.7+150), new PVector(400, 70), false, 4);
    regVerifikationElevTB = new TextBox(new PVector(width/2-200, height/3.7+280), new PVector(400, 70), false, 4);

    textBoxes.add(regUserElevTB);
    textBoxes.add(regPasswordElevTB);
    textBoxes.add(regVerifikationElevTB);

    //setup student register screen
    registerElevBut = new Button(new PVector(width/2 + 30, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 50, 4);
    backElevBut = new Button(new PVector(width/2 -180, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Tilbage", 50, 4);

    buttons.add(registerElevBut);
    buttons.add(backElevBut);

    uddannelsesInstitution= new DropdownMenu(new PVector(width/2-200, height/2+63), new PVector(400, 50), "Vælg uddannelses institution", 24, color(200, 200, 200), 3, new ArrayList<dropdownObject>());

    dropdownMenus.add(uddannelsesInstitution);

    uddannelsesInstitution.objects.add(new dropdownObject(uddannelsesInstitution.pos, uddannelsesInstitution.size, "H. C. Ørsted Lyngby", 1, false));


    //setup teacher register screeen
    regUserLaererTB = new TextBox(new PVector(width/2-200, height/3.7), new PVector(400, 70), false, 3);
    regPasswordLaerer1 = new TextBox(new PVector(width/2-200, height/3.7+110), new PVector(400, 70), false, 3);
    regPasswordLaerer2 = new TextBox(new PVector(width/2-200, height/3.7+220), new PVector(400, 70), false, 3);
    regLaererID = new TextBox(new PVector(width/2-200, height/3.7+410), new PVector(400, 70), false, 3);

    textBoxes.add(regUserLaererTB);
    textBoxes.add(regPasswordLaerer1);
    textBoxes.add(regPasswordLaerer2);
    textBoxes.add(regLaererID);

    registerLaererBut = new Button(new PVector(width/2 + 30, height / 2 + 290), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 40, 3);
    backLaererBut = new Button(new PVector(width/2 -180, height / 2 + 290), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Tilbage", 50, 3);

    buttons.add(registerLaererBut);
    buttons.add(backLaererBut);

    //setup student results-screen
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 5);
    resultaterElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 5);

    buttons.add(logoutBut);
    buttons.add(resultaterElevBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 6);
    resultaterLaererBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 6);
    opretProeveBut = new Button(new PVector(width/4, height - 200), new PVector(width/2, 40), 40, color(205), color(225), color(225, 225, 235), "Opret opgavesæt", 40, 6);
    uddelProeveBut = new Button(new PVector(width/4, height - 100), new PVector(width/2, 40), 40, color(205), color(225), color(225, 225, 235), "Uddel opgavesæt", 40, 6);

    buttons.add(opretProeveBut);
    buttons.add(uddelProeveBut);
    buttons.add(logoutBut);
    buttons.add(resultaterLaererBut);

    //setup teacher results-screen
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 7);
    resultaterLaererBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 7);

    buttons.add(logoutBut);
    buttons.add(resultaterLaererBut);

    //setup tests screen
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 8);
    proeverElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 8);

    buttons.add(logoutBut);
    buttons.add(proeverElevBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 9);
    proeverLaererBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 9);

    buttons.add(logoutBut);
    buttons.add(proeverLaererBut);

    //Testscreen
    opgaveFremBut= new Button(new PVector(width-width/7, height - 900), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Frem", 24, 10);
    opgaveTilbageBut = new Button(new PVector(width-width/1.1, height - 900), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Tilbage", 24, 10);
    opgaveSlutBut = new Button(new PVector(width-width/7, height - 1050), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Opgaveslut", 24, 10);
    svar1But = new Button(new PVector(width-width/3., height - 750), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar1", 24, 10);
    svar2But = new Button(new PVector(width-width/3., height - 600), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar2", 24, 10);
    svar3But = new Button(new PVector(width-width/3., height - 450), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar3", 24, 10);
    svar4But = new Button(new PVector(width-width/3., height - 300), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar4", 24, 10);

    buttons.add(opgaveTilbageBut);
    buttons.add(opgaveFremBut);
    buttons.add(opgaveSlutBut);
    buttons.add(svar1But);
    buttons.add(svar2But);
    buttons.add(svar3But);
    buttons.add(svar4But);

    //setup OpretProeve screen

    opgaveTB = new TextBox(new PVector(width/2-400, height/3.7+40), new PVector(800, 70), false, 5);
    svar1TB = new TextBox(new PVector(width/2-400, height/3.7+140), new PVector(400, 70), false, 5);
    svar2TB = new TextBox(new PVector(width/2-400, height/3.7+240), new PVector(400, 70), false, 5);
    svar3TB = new TextBox(new PVector(width/2-400, height/3.7+340), new PVector(400, 70), false, 5);
    svar4TB = new TextBox(new PVector(width/2-400, height/3.7+440), new PVector(400, 70), false, 5);

    textBoxes.add(opgaveTB);
    textBoxes.add(svar1TB);
    textBoxes.add(svar2TB);
    textBoxes.add(svar3TB);
    textBoxes.add(svar4TB);

    annullerBut = new Button(new PVector(width-width/3., height/3.7), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar1", 24, 20);
    gemBut = new Button(new PVector(width-width/3., height/3.7), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar1", 24, 20);
    rsvar1But = new Button(new PVector(width/2+200, height/3.7+160), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "sæt rigtigt svar", 24, 20);
    rsvar2But = new Button(new PVector(width/2+200, height/3.7+260), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "sæt rigtigt svar", 24, 20);
    rsvar3But = new Button(new PVector(width/2+200, height/3.7+360), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "sæt rigtigt svar", 24, 20);
    rsvar4But = new Button(new PVector(width/2+200, height/3.7+460), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "sæt rigtigt svar", 24, 20);

    buttons.add(annullerBut);
    buttons.add(gemBut);
    buttons.add(rsvar1But);
    buttons.add(rsvar2But);
    buttons.add(rsvar3But);
    buttons.add(rsvar4But);
  }

  void manage() {

    if (enter) {
      gamestate +=1;
      enter = false;
    }

    switch(gamestate) {

      case 0:
      LoginElevScreen();
      break;

    
    case 1:
      LoginLaererScreen();
      break;

    
    case 2:
      ChooseRegister();
      break;

    
    case 3:
      RegisterScreenTeacher();
      break;

    
    case 4:
      RegisterScreenStudent();
      break;

    
    case 5:
      StudentProeveMenu();
      break;

    
    case 6:
      TeacherProeveMenu();
      break;

    
    case 7:
      TeacherUddelProeveMenu();
      break;

    
    case 8:
      StudentResultatMenu();
      break;

    
    case 9:
      TeacherResultatMenu();
      break;

    
    case 10:
      if (update == false) {
        opgaveID =1;
        antalOpgaver();
        setupTekst();
        update = true;
      }
      hentOpgave();
      updatetest();
      testscreen();
      break;

    
    default:
      gamestate = 0;
      break;
    }
  }

  void LoginElevScreen() {
    fill(240);
    stroke(6);
    strokeWeight(2);
    rect(width/2.8, height/5, 550, 600);
    if (registerScreenBut.clicked) {
      gamestate = 2;
    }
    if (laererLoginBut.clicked) {
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
    text("Elev-login", width/2.205, height/4);
  }
  
  void LoginLaererScreen() {
    fill(240);
    stroke(6);
    strokeWeight(2);
    rect(width/2.8, height/5, 550, 600);
    if (registerScreenBut.clicked) {
      gamestate = 2;
    }
    if (laererLoginBut.clicked) {
      gamestate = 0;
    }

    if (loginBut.clicked) {
      errorHandler.loginUpdate();
    }
    fill(0);
    textSize(32);
    text("Brugernavn", width/2-200, height/3.2-10);
    text("Adgangskode", width/2-200, height/2.4-10);
    textSize(48);
    text("Lærer-login", width/2.212, height/4);
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
    pushMatrix();
    translate(0, -sb1.spos);
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
    translate(0, 0);
    popMatrix();
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

  boolean showrect = true;
  void TeacherProeveMenu() {
    textFont(Comic);
    text("LÆRER", 10, 10, 99, 99);
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
    if (opretProeveBut.clicked) {
      showrect = false;
    }
  }

  void OpretProeve() {
  }

  void TeacherUddelProeveMenu() {

    pushMatrix();
    translate(0, -sb2.spos);    
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
    translate(0, 0);
    popMatrix();
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
    pushMatrix();
    translate(0, -sb3.spos);
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
    translate(0, 0);
    popMatrix();
  }
  void setupTekst() {
    for (int i = 0; i <= 24; i++)
    {
      opgavetekst[i] = "IkkeLoadet";
      elevSvarNR[i] = 0;
    }
  }
  void updatetest() {
    currentSvar1Tekst =opgaveSvar1[currentopgave-1];
    currentSvar2Tekst =opgaveSvar2[currentopgave-1];
    currentSvar3Tekst =opgaveSvar3[currentopgave-1];
    currentSvar4Tekst =opgaveSvar4[currentopgave-1];
    currentOpgaveTekst =opgavetekst[currentopgave-1];
  }
  void testscreen() {

    background(255);
    text(currentopgave+": "+currentOpgaveTekst, width/9.8, height/3.7, 999, 999);
    text(opgaveSvar1[currentopgave-1], width/1.3, height/3.4, 999, 999);
    text(opgaveSvar2[currentopgave-1], width/1.3, height/2.3, 999, 999);
    text(opgaveSvar3[currentopgave-1], width/1.3, height/1.75, 999, 999);
    text(opgaveSvar4[currentopgave-1], width/1.3, height/1.4, 999, 999);

    text("dit svar:"+elevSvarNR[currentopgave-1], width/1.43, height/4.2, 999, 999);
    textFont(Comic);
    text("Prøvesæt1", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);

    if (opgaveTilbageBut.clicked == true && currentopgave != 1) {
      currentopgave -= 1;
      gamestate = 9;
    }
    if (opgaveFremBut.clicked == true && currentopgave != maxopgaver) {
      currentopgave += 1;
      gamestate =9;
    }
    if (opgaveSlutBut.clicked == true) {
      tjekSvar();
      gamestate = 7;
      update = false;
      println(rigtigesvar);
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
    switch(elevSvarNR[currentopgave-1]) {
    case 1:
      svar1But.col = color(0, 200, 50);
      svar2But.col = color(150, 150, 200);
      svar3But.col = color(150, 150, 200);
      svar4But.col = color(150, 150, 200);
      break;

    case 2:
      svar1But.col = color(150, 150, 200);
      svar2But.col = color(0, 200, 50);
      svar3But.col = color(150, 150, 200);
      svar4But.col = color(150, 150, 200);
      break;

    case 3:
      svar1But.col = color(150, 150, 200);
      svar2But.col = color(150, 150, 200);
      svar3But.col = color(0, 200, 50);
      svar4But.col = color(150, 150, 200);
      break;

    case 4:
      svar1But.col = color(150, 150, 200);
      svar2But.col = color(150, 150, 200);
      svar3But.col = color(150, 150, 200);
      svar4But.col = color(0, 200, 50);
      break;

    default:
      svar1But.col = color(150, 150, 200);
      svar2But.col = color(150, 150, 200);
      svar3But.col = color(150, 150, 200);
      svar4But.col = color(150, 150, 200);
      break;
    }
  }
  float theta = 0, theta1 = radians(60), rad = 30;
  void loadingScreen() {
    rad = 5*cos(theta/2)+10+20;

    theta += 0.1;
    fill(0);
    textSize(48);
    pushMatrix();
    translate(width/2+250, height/2);
    text("Loading, please wait", -550, 15);
    rotate(theta);
    circle(0, rad, 10);
    rotate(theta1);
    circle(0, rad, 10);
    rotate(theta1);
    circle(0, rad, 10);
    rotate(theta1);
    circle(0, rad, 10);
    rotate(theta1);
    circle(0, rad, 10);
    rotate(theta1);
    circle(0, rad, 10);
    popMatrix();
  }
}
