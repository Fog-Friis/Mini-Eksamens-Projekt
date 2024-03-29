int gamestate;
TextBox regUserLaererTB, regLaererID, regPasswordLaerer1, regPasswordLaerer2, regUserElevTB, regPasswordElevTB, regVerifikationElevTB,OpretklasseTB;
TextBox logUserTB, logPasswordTB,  nameTB,  UlogUserTB, UlogPasswordTB;

TextBox[] opgaveTB, svar1TB, svar2TB, svar3TB, svar4TB;

Button loginBut, registerScreenBut, laererLoginBut, elevLoginBut, Test1But;
Button ElevRegisterBut, LaererRegisterBut, TilbageBut;
Button registerElevBut, backElevBut, registerLaererBut, backLaererBut, OpretklasseBut;
Button logoutBut, resultaterElevBut;
Button resultaterLaererBut, resultaterLaererBut2;
Button proeverElevBut;
Button proeverLaererBut, opretProeveBut, uddelProeveBut;
Button opgaveTilbageBut, opgaveFremBut, opgaveSlutBut, svar1But, svar2But, svar3But, svar4But;

Button annullerBut, gemBut, rsvar1But, rsvar2But, rsvar3But, rsvar4But, powerBut, gemAlleBut;

Scrollbar sb1, sb2, sb3, sb4;

DropdownMenu opgaveliste;

int[] elevSvarNR = new int[25];
int[] realtSvarNR = new int[25];
int currentopgave =1, maxopgaver;
String[] opgavetekst = new String[25];
String[] opgaveSvar1 = new String[25];
String[] opgaveSvar2 = new String[25];
String[] opgaveSvar3 = new String[25];
String[] opgaveSvar4 = new String[25];
String skole = "H. C. Ørsted Lyngby";
String currentOpgaveTekst, currentSvar1Tekst, currentSvar2Tekst, currentSvar3Tekst, currentSvar4Tekst;
boolean update = false;
DropdownMenu uddannelsesInstitution;
DropdownMenu klasseValg, testValg;

PFont Comic;
PFont norm;

class GameStateManager {

  void setupManager() {

    //setup scroll bars
    sb1 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 3);
    sb2 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 400, 6);    
    sb3 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 7);
    sb4 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 9);

    norm = createFont("Arial", 18);
    Comic = createFont("Comic Sans MS", 18);

    //setup login screen
    logUserTB = new TextBox(new PVector(width/2-200, height/3.2), new PVector(400, 70), false, 0);
    logPasswordTB = new TextBox(new PVector(width/2-200, height/2.4), new PVector(400, 70), false, 0);

    textBoxes.add(logUserTB);
    textBoxes.add(logPasswordTB);

    loginBut = new Button(new PVector(width/2 + 30, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Login", 50, 0);
    registerScreenBut = new Button(new PVector(width/2 - 180, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 40, 0);
    laererLoginBut = new Button(new PVector(width/2-180, height/2+120), new PVector(365, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Lærer-login", 50, 0);

    buttons.add(laererLoginBut);
    buttons.add(loginBut);
    buttons.add(registerScreenBut);

    UlogUserTB = new TextBox(new PVector(width/2-200, height/3.2), new PVector(400, 70), false, 1);
    UlogPasswordTB = new TextBox(new PVector(width/2-200, height/2.4), new PVector(400, 70), false, 1);

    textBoxes.add(UlogUserTB);
    textBoxes.add(UlogPasswordTB);

    loginBut = new Button(new PVector(width/2 + 30, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Login", 50, 1);
    registerScreenBut = new Button(new PVector(width/2 - 180, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 40, 1);
    elevLoginBut = new Button(new PVector(width/2-180, height/2+120), new PVector(365, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Elev-login", 50, 1);

    buttons.add(elevLoginBut);
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
    registerElevBut = new Button(new PVector(width/2 + 30, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 40, 4);
    backElevBut = new Button(new PVector(width/2 -180, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Tilbage", 50, 4);

    buttons.add(registerElevBut);
    buttons.add(backElevBut);

    uddannelsesInstitution= new DropdownMenu(new PVector(width/2-200, height/2+63), new PVector(400, 50), "Vælg uddannelses institution", 24, color(200, 200, 200), 3, new ArrayList<dropdownObject>());

    dropdownMenus.add(uddannelsesInstitution);

    uddannelsesInstitution.objects.add(new dropdownObject(uddannelsesInstitution.pos, uddannelsesInstitution.size, skole, 1, false));


    //setup teacher register screeen
    regUserLaererTB = new TextBox(new PVector(width/2-200, height/3.7), new PVector(400, 70), false, 3);
    regPasswordLaerer1 = new TextBox(new PVector(width/2-200, height/3.7+110), new PVector(400, 70), false, 3);
    regPasswordLaerer2 = new TextBox(new PVector(width/2-200, height/3.7+220), new PVector(400, 70), false, 3);
   // regLaererID = new TextBox(new PVector(width/2-200, height/3.7+410), new PVector(400, 70), false, 3);

    textBoxes.add(regUserLaererTB);
    textBoxes.add(regPasswordLaerer1);
    textBoxes.add(regPasswordLaerer2);
  //  textBoxes.add(regLaererID);

    registerLaererBut = new Button(new PVector(width/2 + 30, height / 2 + 290), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 40, 3);
    backLaererBut = new Button(new PVector(width/2 -180, height / 2 + 290), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Tilbage", 50, 3);

    buttons.add(registerLaererBut);
    buttons.add(backLaererBut);

    //setup student results-screen
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 5);
    resultaterElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 5);
    Test1But = new Button(new PVector(width-500, height/3), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Test", 24, 5);
    
    buttons.add(Test1But);
    buttons.add(logoutBut);
    buttons.add(resultaterElevBut);
    //Teacher menu
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 6);
    resultaterLaererBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 6);
    opretProeveBut = new Button(new PVector(width/4, height - 200), new PVector(width/2, 40), 40, color(205), color(225), color(225, 225, 235), "Opret opgavesæt", 40, 6);
    uddelProeveBut = new Button(new PVector(width/4, height - 100), new PVector(width/2, 40), 40, color(205), color(225), color(225, 225, 235), "Uddel opgavesæt", 40, 6);
    OpretklasseBut = new Button(new PVector(width/2+500, height - 600 ), new PVector(200, 40), 40, color(205), color(225), color(225, 225, 235), "Opret klasse", 40, 6);
    OpretklasseTB = new TextBox(new PVector(width/2, height-612), new PVector(400, 70), false, 6);

    textBoxes.add(OpretklasseTB);
    buttons.add(opretProeveBut);
    buttons.add(uddelProeveBut);
    buttons.add(logoutBut);
    buttons.add(resultaterLaererBut);
    buttons.add(OpretklasseBut);
    
    //setup teacher results-screen
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 7);
    resultaterLaererBut2 = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 7);

    buttons.add(logoutBut);
    buttons.add(resultaterLaererBut2);

    //setup tests screen
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 8);
    proeverElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 8);

    buttons.add(logoutBut);
    buttons.add(proeverElevBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 9);
    proeverLaererBut = new Button(new PVector(width-width/3.4/*-120*/, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 9);

    buttons.add(logoutBut);
    buttons.add(proeverLaererBut);

    //Testscreen
    opgaveFremBut= new Button(new PVector(width-width/7, height - 900), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Frem", 24, 10);
    opgaveTilbageBut = new Button(new PVector(width-width/1.1, height - 900), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Tilbage", 24, 10);
    opgaveSlutBut = new Button(new PVector(width-100, height - 1050), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Opgaveslut", 24, 10);
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
    opgaveTB = new TextBox[25];
    svar1TB = new TextBox[25];
    svar2TB = new TextBox[25];
    svar3TB = new TextBox[25];
    svar4TB = new TextBox[25];

    int i=1;
    while (i <= 25) {
      opgaveTB[i-1] = new TextBox(new PVector(width/2-300, height/3), new PVector(800, 70), false, 20);
      svar1TB[i-1] = new TextBox(new PVector(width/2-300, height/3+100), new PVector(400, 70), false, 20);
      svar2TB[i-1] = new TextBox(new PVector(width/2-300, height/3+200), new PVector(400, 70), false, 20);
      svar3TB[i-1] = new TextBox(new PVector(width/2-300, height/3+300), new PVector(400, 70), false, 20);
      svar4TB[i-1] = new TextBox(new PVector(width/2-300, height/3+400), new PVector(400, 70), false, 20);

      textBoxes.add(opgaveTB[i-1]);
      textBoxes.add(svar1TB[i-1]);
      textBoxes.add(svar2TB[i-1]);
      textBoxes.add(svar3TB[i-1]);
      textBoxes.add(svar4TB[i-1]);
      i++;
    }
    nameTB = new TextBox(new PVector(width/2-180, height/6.8+60), new PVector(600, 70), false, 20);
    annullerBut = new Button(new PVector(width/4-180, height/4.5), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "annuller", 24, 20);
    gemBut = new Button(new PVector(width-width/4+100, height/4.5), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "gem", 24, 20);
    rsvar1But = new Button(new PVector(width/2+300, height/3+120), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "sæt rigtigt svar", 24, 20);
    rsvar2But = new Button(new PVector(width/2+300, height/3+220), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "sæt rigtigt svar", 24, 20);
    rsvar3But = new Button(new PVector(width/2+300, height/3+320), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "sæt rigtigt svar", 24, 20);
    rsvar4But = new Button(new PVector(width/2+300, height/3+420), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "sæt rigtigt svar", 24, 20);
    powerBut = new Button(new PVector(width/2+550, height/3+25), new PVector(20, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "^", 24, 20);
    gemAlleBut = new Button(new PVector(width-width/4+100, height/3+575), new PVector(160, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Gem opgavesæt", 24, 20);
   
    textBoxes.add(nameTB);
    buttons.add(annullerBut);
    buttons.add(gemBut);
    buttons.add(rsvar1But);
    buttons.add(rsvar2But);
    buttons.add(rsvar3But);
    buttons.add(rsvar4But);
    buttons.add(powerBut);
    buttons.add(gemAlleBut);
    
    opgaveliste = new DropdownMenu(new PVector(width/4-200, height/3), new PVector(300, 50), "Opgaver", 24, color(200, 200, 200), 6, new ArrayList<dropdownObject>());
    dropdownMenus.add(opgaveliste);

    int k = 1;
    while (k <= 25) {
      opgaveliste.objects.add(new dropdownObject(new PVector(opgaveliste.pos.x, opgaveliste.pos.y), new PVector(opgaveliste.size.x, opgaveliste.size.y), "opgave " + k, k, false));
    
      realtSvarNR[k-1] = 0;
      opgaveSvar1[k-1] = "";
      opgaveSvar2[k-1] = "";
      opgaveSvar3[k-1] = "";
      opgaveSvar4[k-1] = "";
      opgavetekst[k-1] = "";

      k++;
    }
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
      hashing (logPasswordTB.Text);
      elevLoginCheck();
      
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
    if (elevLoginBut.clicked) {
      gamestate = 0;
    }

    if (loginBut.clicked) {
      hashing (UlogPasswordTB.Text);
      underviserLoginCheck();
    }
    fill(0);
    textSize(32);
    text("Brugernavn", width/2-200, height/3.2-10);
    text("Adgangskode", width/2-200, height/2.4-10);
    textSize(48);
    text("Lærer-login", width/2-130, height/4);
  }

  void ChooseRegister() {
    fill(240);
    stroke(6);
    rect(width/2.8, height/6.8, 550, 700);
    fill(0);
    textSize(24);
    text("Hvilken bruger vil du gerne registreres som?", width/2.73, height/5.6, 550, 500);
    fill(100);
    textSize(23);
    text("Er du lærer eller elev?", width/2.265, height/4.2, 550, 500);
    fill(200);
    if (TilbageBut.clicked) {
      gamestate = 0;
    }
    if (ElevRegisterBut.clicked) {
      gamestate = 4;
    }
    if (LaererRegisterBut.clicked) {
      gamestate = 3;
    }
  }

  void RegisterScreenStudent() {
    fill(240);
    stroke(6);
    rect(width/2.8, height/6.8, 550, 700);

    if (backElevBut.clicked) {
      gamestate = 2;
    }
    if (registerElevBut.clicked) {
            hashing (logPasswordTB.Text);
            elevRegister();
            gamestate =5;
      }
    
    fill(0);
    textSize(32);
    text("Brugernavn", width/2-200, height/3.7+10);
    text("Adgangskode", width/2-200, height/3.7+140);
    text("Uni-login", width/2-200, height/3.7-22);
    text("Klassekode", width/2-200, height/3.7+270);
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
      gamestate = 2;
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
   // text("Lære-ID", width/2-200, height/3.7+400);
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
    if (Test1But.clicked) {
      gamestate = 10;
    }
    if (resultaterElevBut.clicked) {
      gamestate = 8;
    }
  }

  void hideTBs() {
    int j = 0;
    while (j<=24) {

      opgaveTB[j].visible = 20;
      svar1TB[j].visible = 20;
      svar2TB[j].visible = 20;
      svar3TB[j].visible = 20;
      svar4TB[j].visible = 20;

      j++;
    }
    if (showButs) {
      opgaveTB[valgtOpgave-1].visible = 6;
      svar1TB[valgtOpgave-1].visible = 6;
      svar2TB[valgtOpgave-1].visible = 6;
      svar3TB[valgtOpgave-1].visible = 6;
      svar4TB[valgtOpgave-1].visible = 6;
    }
  }

  boolean showButs = false;
  //int j = 1;
  void TeacherProeveMenu() {
    pushMatrix();
    translate(0, -sb2.spos);
    textFont(Comic);
    text("LÆRER", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Prøver:", width/9.8, height/4.7, 999, 999);
    text("Status:", width-width/3.84, height/4.7, 999, 999);
    rect(0, height/3.6, width, 2);
    if (OpretklasseBut.clicked){
    klassenavn = OpretklasseTB.Text;
    opretKlasse();
    

    }
    if (logoutBut.clicked) {
      gamestate = 0;
    }
    
    if (gemAlleBut.clicked){
      /*
            annullerBut.visible = 6;
      gemBut.visible = 6;
      rsvar1But.visible = 6;
      rsvar2But.visible = 6;
      rsvar3But.visible = 6;
      rsvar4But.visible = 6;
      powerBut.visible = 6;
      nameTB.visible = 6;
      gemAlleBut.visible = 6;
      
      opgaveTB[valgtOpgave-1].visible = 6;
      svar1TB[valgtOpgave-1].visible = 6;
      svar2TB[valgtOpgave-1].visible = 6;
      svar3TB[valgtOpgave-1].visible = 6;
      svar4TB[valgtOpgave-1].visible = 6;

      opgaveliste.visible = 6;

      uddelProeveBut.visible = 20;
      opretProeveBut.visible = 20;
      */
      showButs = false;
       OpretOpgaver();

    }
    if (resultaterLaererBut.clicked) {
      gamestate = 9;

    }
if (annullerBut.clicked){    
        showButs = false;
       

}
    if (uddelProeveBut.clicked) {
      gamestate = 7;
    }
    if (opretProeveBut.clicked) {

      showButs = true;
      rigtigtSvar = realtSvarNR[valgtOpgave-1];
      rigtigtSvar = 0;
      opgaveTB[valgtOpgave-1].Text = opgavetekst[valgtOpgave-1];
      svar1TB[valgtOpgave-1].Text = opgaveSvar1[valgtOpgave-1];
      svar2TB[valgtOpgave-1].Text = opgaveSvar2[valgtOpgave-1];
      svar3TB[valgtOpgave-1].Text = opgaveSvar3[valgtOpgave-1];
      svar4TB[valgtOpgave-1].Text = opgaveSvar4[valgtOpgave-1];
    }
    if (showButs == true) {
      annullerBut.visible = 6;
      gemBut.visible = 6;
      rsvar1But.visible = 6;
      rsvar2But.visible = 6;
      rsvar3But.visible = 6;
      rsvar4But.visible = 6;
      powerBut.visible = 6;
      nameTB.visible = 6;
      gemAlleBut.visible = 6;
      
      opgaveTB[valgtOpgave-1].visible = 6;
      svar1TB[valgtOpgave-1].visible = 6;
      svar2TB[valgtOpgave-1].visible = 6;
      svar3TB[valgtOpgave-1].visible = 6;
      svar4TB[valgtOpgave-1].visible = 6;

      opgaveliste.visible = 6;
      OpretklasseBut.visible = 20;
      OpretklasseTB.visible = 20;
      uddelProeveBut.visible = 20;
      opretProeveBut.visible = 20;

    } else {
    nameTB.visible = 20;
      gemAlleBut.visible = 20;
      annullerBut.visible = 20;
      gemBut.visible = 20;
      rsvar1But.visible = 20;
      rsvar2But.visible = 20;
      rsvar3But.visible = 20;
      rsvar4But.visible = 20;
      powerBut.visible = 20;
      
      hideTBs();
      opgaveliste.visible = 20;
      OpretklasseBut.visible = 6;
       OpretklasseTB.visible = 6;
      uddelProeveBut.visible = 6;
      opretProeveBut.visible = 6;
      OpretklasseTB.visible = 6;
    }    
    popMatrix();
  }

  int valgtOpgave = 1;
  int rigtigtSvar = 0;
  void OpretProeve() {

    if (powerBut.clicked) {
      opgaveTB[valgtOpgave-1].addText('^');
    }

    if (annullerBut.visible == gamestate && annullerBut.clicked) {
      showButs = false;
      
    }

    stroke(0);
    fill(240);
    rect(200, height/5.5, width-400, 800);
    fill(0);
    textSize(36);
    text("Navn:", width/2-280, height/6.8+60, 999, 100);

    if (gemBut.clicked) {
      realtSvarNR[valgtOpgave-1] = rigtigtSvar;
      opgaveSvar1[valgtOpgave-1] = svar1TB[valgtOpgave-1].Text;
      opgaveSvar2[valgtOpgave-1] = svar2TB[valgtOpgave-1].Text;
      opgaveSvar3[valgtOpgave-1] = svar3TB[valgtOpgave-1].Text;
      opgaveSvar4[valgtOpgave-1] = svar4TB[valgtOpgave-1].Text;
      opgavetekst[valgtOpgave-1] = opgaveTB[valgtOpgave-1].Text;
    }

    for (dropdownObject o : opgaveliste.objects) {
      if (o.clicked) {

        rigtigtSvar = realtSvarNR[valgtOpgave-1];
        valgtOpgave = o.number;

        opgaveTB[valgtOpgave-1].visible = 6;
        svar1TB[valgtOpgave-1].visible = 6;
        svar2TB[valgtOpgave-1].visible = 6;
        svar3TB[valgtOpgave-1].visible = 6;
        svar4TB[valgtOpgave-1].visible = 6;

        hideTBs();

        opgaveTB[valgtOpgave-1].Text = opgavetekst[valgtOpgave-1];
        opgaveTB[valgtOpgave-1].TextLength = opgavetekst[valgtOpgave-1].length();        

        println(opgaveTB[valgtOpgave-1].TextLength);

        svar1TB[valgtOpgave-1].Text = opgaveSvar1[valgtOpgave-1];
        svar1TB[valgtOpgave-1].TextLength = opgaveSvar1[valgtOpgave-1].length();

        svar2TB[valgtOpgave-1].Text = opgaveSvar2[valgtOpgave-1];
        svar2TB[valgtOpgave-1].TextLength = opgaveSvar2[valgtOpgave-1].length();

        svar3TB[valgtOpgave-1].Text = opgaveSvar3[valgtOpgave-1];
        svar3TB[valgtOpgave-1].TextLength = opgaveSvar3[valgtOpgave-1].length();

        svar4TB[valgtOpgave-1].Text = opgaveSvar4[valgtOpgave-1];
        svar4TB[valgtOpgave-1].TextLength = opgaveSvar4[valgtOpgave-1].length();
      }

      if (o.number == valgtOpgave) {
        text(o.Text + ":", width/2-300, height/3.5, 999, 100);
      }
    }
    if (rsvar1But.clicked) {
      rigtigtSvar = 1;
    } else if (rsvar2But.clicked) { 
      rigtigtSvar = 2;
    } else if (rsvar3But.clicked) { 
      rigtigtSvar = 3;
    } else if (rsvar4But.clicked) { 
      rigtigtSvar = 4;
    }

    color marked = color(0, 200, 50);
    color unmarked = color(150, 150, 200);

    switch(rigtigtSvar) {

    case 1:
      rsvar1But.col = marked;
      rsvar2But.col = unmarked;
      rsvar3But.col = unmarked;
      rsvar4But.col = unmarked;
      break;

    case 2:
      rsvar1But.col = unmarked;
      rsvar2But.col = marked;
      rsvar3But.col = unmarked;
      rsvar4But.col = unmarked;      
      break;

    case 3:
      rsvar1But.col = unmarked;
      rsvar2But.col = unmarked;
      rsvar3But.col = marked;
      rsvar4But.col = unmarked;
      break;

    case 4:
      rsvar1But.col = unmarked;
      rsvar2But.col = unmarked;
      rsvar3But.col = unmarked;
      rsvar4But.col = marked;
      break;

    default:
      rsvar1But.col = unmarked;
      rsvar2But.col = unmarked;
      rsvar3But.col = unmarked;
      rsvar4But.col = unmarked;
      break;
    }
  }

  void TeacherUddelProeveMenu() {

    pushMatrix();
    translate(0, -sb3.spos);    
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
    if (resultaterLaererBut2.clicked) {
      gamestate = 9;
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
    
    if ((rigtigesvar*100)/maxopgaver >= 0 && (rigtigesvar*100)/maxopgaver < 25)
    {karakter = "-3";}
    else if ((rigtigesvar*100)/maxopgaver >= 0 && (rigtigesvar*100)/maxopgaver < 50)
    {karakter = "0";}
    else if ((rigtigesvar*100)/maxopgaver >= 0 && (rigtigesvar*100)/maxopgaver < 60)
    {karakter = "2";}
    else if ((rigtigesvar*100)/maxopgaver >= 0 && (rigtigesvar*100)/maxopgaver < 70)
    {karakter = "4";}
    else if ((rigtigesvar*100)/maxopgaver >= 0 && (rigtigesvar*100)/maxopgaver < 80)
    {karakter = "7";}
    else if ((rigtigesvar*100)/maxopgaver >= 0 && (rigtigesvar*100)/maxopgaver < 90)
    {karakter = "10";}
    else if ((rigtigesvar*100)/maxopgaver >= 0 && (rigtigesvar*100)/maxopgaver < 1000)
    {karakter = "12";}
    textSize(32);
    text(karakter, width-width/3.84, height/3, 999, 999);
    text(rigtigesvar+" ud af "+maxopgaver, width/9.8, height/3, 999, 999);
    if (logoutBut.clicked) {
      gamestate = 0;
    }
    if (proeverElevBut.clicked) {
      gamestate = 5;
    }
  }
  void TeacherResultatMenu() {
    pushMatrix();
    translate(0, -sb4.spos);
    textFont(Comic);
    text("LÆRER", 10, 10, 99, 99);
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
      gamestate = 6;
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
    text("Tid ialt: "+previousTime+" min", width/50, height-(height-100));
    //text("dit svar:"+elevSvarNR[currentopgave-1], width/1.43, height/4.2, 999, 999);
    //textFont(Comic);
   // text("Prøvesæt1", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);

    if (opgaveTilbageBut.clicked == true && currentopgave != 1) {
      currentopgave -= 1;
      gamestate = 10;
    }
    if (opgaveFremBut.clicked == true && currentopgave != maxopgaver) {
      currentopgave += 1;
      gamestate =10;
    }
    if (opgaveSlutBut.clicked == true) {
      tjekSvar();
      gamestate = 8;
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

    color marked = color(0, 200, 50);
    color unmarked = color(150, 150, 200);

    switch(elevSvarNR[currentopgave-1]) {
    case 1:
      svar1But.col = marked;
      svar2But.col = unmarked;
      svar3But.col = unmarked;
      svar4But.col = unmarked;
      break;

    case 2:
      svar1But.col = unmarked;
      svar2But.col = marked;
      svar3But.col = unmarked;
      svar4But.col = unmarked;
      break;

    case 3:
      svar1But.col = unmarked;
      svar2But.col = unmarked;
      svar3But.col = marked;
      svar4But.col = unmarked;
      break;

    case 4:
      svar1But.col = unmarked;
      svar2But.col = unmarked;
      svar3But.col = unmarked;
      svar4But.col = marked;
      break;

    default:
      svar1But.col = unmarked;
      svar2But.col = unmarked;
      svar3But.col = unmarked;
      svar4But.col = unmarked;
      break;
    }
  }

  float theta = 0, theta1 = radians(60), rad = 30;
  void loadingScreen() {
    rad = 5*cos(theta/2)+10+20;

    theta += 0.1;
    background(255);
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
