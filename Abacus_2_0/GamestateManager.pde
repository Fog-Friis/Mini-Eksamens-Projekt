int gamestate;
TextBox regUserLaererTB, regEmailLaererTB, regPasswordLaerer1, regPasswordLaerer2, regUserElevTB, regPasswordElevTB, regVerifikationElevTB;
TextBox logUserTB, logPasswordTB;

Button loginBut, registerScreenBut;
Button ElevRegisterBut, LaererRegisterBut, TilbageBut;
Button registerBut, backBut;
Button logoutBut, resultaterElevBut;
Button resultaterLaererBut;
Button proeverElevBut;
Button proeverLaererBut, opretProeveBut, uddelProeveBut;
Button opgaveTilbageBut, opgaveFremBut, opgaveSlutBut, svar1But, svar2But, svar3But, svar4But;

int[] elevSvarNR = new int[25];
int[] realtSvarNR = new int[25];
int currentopgave =1, maxopgaver=10;
String[] opgavetekst = new String[25];
String[] opgaveSvar1 = new String[25];
String[] opgaveSvar2 = new String[25];
String[] opgaveSvar3 = new String[25];
String[] opgaveSvar4 = new String[25];
String currentOpgaveTekst;
boolean update = false;
DropdownMenu uddannelsesInstitution;
DropdownMenu klasseValg;

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

    registerBut = new Button(new PVector(width/2 + 30, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Register", 50, 3);
    backBut = new Button(new PVector(width/2 -180, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Tilbage", 50, 3);

    buttons.add(registerBut);
    buttons.add(backBut);

    uddannelsesInstitution= new DropdownMenu(new PVector(width/2-200, height/2), new PVector(400, 50), "Vælg uddannelses institution", 24, 1, 2);

    dropdownMenus.add(uddannelsesInstitution);

    uddannelsesInstitution.objects.add(new dropdownObject(uddannelsesInstitution.pos, uddannelsesInstitution.size, "H. C. Ørsted Lyngby", 1, false)); 

    //setup register screeen
    regUserLaererTB = new TextBox(new PVector(width/2-200, height/3.7), new PVector(400, 70), false, 2);
    regEmailLaererTB = new TextBox(new PVector(width/2-200, height/3.7+110), new PVector(400, 70), false, 2);
    regPasswordLaerer1 = new TextBox(new PVector(width/2-200, height/3.7+220), new PVector(400, 70), false, 2);
    regPasswordLaerer2 = new TextBox(new PVector(width/2-200, height/3.7+330), new PVector(400, 70), false, 2);

    textBoxes.add(regUserLaererTB);
    textBoxes.add(regEmailLaererTB);
    textBoxes.add(regPasswordLaerer1);
    textBoxes.add(regPasswordLaerer2);

    registerBut = new Button(new PVector(width/2 + 30, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Register", 50, 2);
    backBut = new Button(new PVector(width/2 -180, height / 2 + 190), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Tilbage", 50, 2);

    buttons.add(registerBut);
    buttons.add(backBut);

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

    klasseValg= new DropdownMenu(new PVector(width/2, height/2), new PVector(500, 50), "Vælg uddannelses institution", 40, 10, 6);

    dropdownMenus.add(klasseValg);

    uddannelsesInstitution.objects.add(new dropdownObject(uddannelsesInstitution.pos, uddannelsesInstitution.size, "3a2 I guess (database her)", 1, false)); 

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 7);
    proeverElevBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 7);

    buttons.add(logoutBut);
    buttons.add(proeverElevBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 8);
    proeverLaererBut = new Button(new PVector(width-width/3.4, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 8);

    buttons.add(logoutBut);
    buttons.add(proeverLaererBut);

    //Testscreen
    opgaveFremBut= new Button(new PVector(width-width/7, height - 900), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Frem", 24, 9);
    opgaveTilbageBut = new Button(new PVector(width-width/1.1, height - 900), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Tilbage", 24, 9);
    opgaveSlutBut = new Button(new PVector(width-width/7, height - 1050), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Opgaveslut", 24, 9);
    svar1But = new Button(new PVector(width-width/2.5, height - 750), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar1", 24, 9);
    svar2But = new Button(new PVector(width-width/2.5, height - 600), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar2", 24, 9);
    svar3But = new Button(new PVector(width-width/2.5, height - 450), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar3", 24, 9);
    svar4But = new Button(new PVector(width-width/2.5, height - 300), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar4", 24, 9);

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
      RegisterScreenStudent();
      break;

    case 3:
      RegisterScreenTeacher();
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
      updatetest();
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

  void RegisterScreenTeacher() {
    fill(240);
    stroke(6);
    rect(width/2.8, height/6.8, 550, 700);

    if (backBut.clicked) {
      gamestate = 0;
    }
    if (registerBut.clicked) {
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

  void RegisterScreenStudent() {
    fill(240);
    stroke(6);
    rect(width/2.8, height/6.8, 550, 700);

    if (backBut.clicked) {
      gamestate = 0;
    }
    if (registerBut.clicked) {
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
    text("Lære-ID", width/2-200, height/3.7+320);
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
    currentopgave = 1;
    currentOpgaveTekst =opgavetekst[currentopgave-1];
    /*
    opgavetekst[0]= 
      opgaveSvar1[0]= 
      opgaveSvar2[0]= 
      opgaveSvar3[0]= 
      opgaveSvar4[0]= 

      opgavetekst[1]= 
      opgaveSvar1[1]= 
      opgaveSvar2[1]= 
      opgaveSvar3[1]= 
      opgaveSvar4[1]= 

      opgavetekst[2]= 
      opgaveSvar1[2]= 
      opgaveSvar2[2]= 
      opgaveSvar3[2]= 
      opgaveSvar4[2]= 

      opgavetekst[3]= 
      opgaveSvar1[3]= 
      opgaveSvar2[3]= 
      opgaveSvar3[3]= 
      opgaveSvar4[3]= 

      opgavetekst[4]= 
      opgaveSvar1[4]= 
      opgaveSvar2[4]= 
      opgaveSvar3[4]= 
      opgaveSvar4[4]= 

      opgavetekst[5]= 
      opgaveSvar1[5]= 
      opgaveSvar2[5]= 
      opgaveSvar3[5]= 
      opgaveSvar4[5]= 

      opgavetekst[6]= 
      opgaveSvar1[6]= 
      opgaveSvar2[6]= 
      opgaveSvar3[6]= 
      opgaveSvar4[6]= 

      opgavetekst[7]= 
      opgaveSvar1[7]= 
      opgaveSvar2[7]= 
      opgaveSvar3[7]= 
      opgaveSvar4[7]= 

      opgavetekst[8]= 
      opgaveSvar1[8]= 
      opgaveSvar2[8]= 
      opgaveSvar3[8]= 
      opgaveSvar4[8]= 

      opgavetekst[9]= 
      opgaveSvar1[9]= 
      opgaveSvar2[9]= 
      opgaveSvar3[9]= 
      opgaveSvar4[9]=
      */
  }
  //Checker antal maxopgaver
  /*
    if (maxopgaver >= 11)
   {
   opgavetekst[10]=
   opgaveSvar1[10]=
   opgaveSvar2[10]=
   opgaveSvar3[10]=
   opgaveSvar4[10]=
   }
   if (maxopgaver >= 12)
   {
   opgavetekst[11]= 
   opgaveSvar1[11]=
   opgaveSvar2[11]=
   opgaveSvar3[11]=
   opgaveSvar4[11]=
   }
   if (maxopgaver >= 13)
   {
   opgavetekst[12]= 
   opgaveSvar1[12]=
   opgaveSvar2[12]=
   opgaveSvar3[12]=
   opgaveSvar4[12]=
   }
   if (maxopgaver >= 14)
   {
   opgavetekst[13]= 
   opgaveSvar1[13]=
   opgaveSvar2[13]=
   opgaveSvar3[13]=
   opgaveSvar4[13]=
   }
   if (maxopgaver >= 15)
   {
   opgavetekst[14]=
   opgaveSvar1[14]=
   opgaveSvar2[14]=
   opgaveSvar3[14]=
   opgaveSvar4[14]=
   }
   if (maxopgaver >= 16)
   {
   opgavetekst[15]= 
   opgaveSvar1[15]=
   opgaveSvar2[15]=
   opgaveSvar3[15]=
   opgaveSvar4[15]=
   }
   if (maxopgaver >= 17)
   {
   opgavetekst[16]=
   opgaveSvar1[16]=
   opgaveSvar2[16]=
   opgaveSvar3[16]=
   opgaveSvar4[16]=
   }
   if (maxopgaver >= 18)
   {
   opgavetekst[17]= 
   opgaveSvar1[17]=
   opgaveSvar2[17]=
   opgaveSvar3[17]=
   opgaveSvar4[17]=
   }
   if (maxopgaver >= 19)
   {
   opgavetekst[18]= 
   opgaveSvar1[18]=
   opgaveSvar2[18]=
   opgaveSvar3[18]=
   opgaveSvar4[18]=
   }
   if (maxopgaver >= 20)
   {
   opgavetekst[19]=
   opgaveSvar1[19]=
   opgaveSvar2[19]=
   opgaveSvar3[19]=
   opgaveSvar4[19]=
   }
   if (maxopgaver >= 21)
   {
   opgavetekst[20]= 
   opgaveSvar1[20]=
   opgaveSvar2[20]=
   opgaveSvar3[20]=
   opgaveSvar4[20]=
   }
   if (maxopgaver >= 22)
   {
   opgavetekst[21]=
   opgaveSvar1[21]=
   opgaveSvar2[21]=
   opgaveSvar3[21]=
   opgaveSvar4[21]=
   }
   if (maxopgaver >= 23)
   {
   opgavetekst[22]= 
   opgaveSvar1[22]=
   opgaveSvar2[22]=
   opgaveSvar3[22]=
   opgaveSvar4[22]=
   }
   if (maxopgaver >= 24)
   {
   opgavetekst[23]=
   opgaveSvar1[23]=
   opgaveSvar2[23]=
   opgaveSvar3[23]=
   opgaveSvar4[23]=
   }
   if (maxopgaver >=25 )
   {
   opgavetekst[24]= 
   opgaveSvar1[24]=
   opgaveSvar2[24]=
   opgaveSvar3[24]=
   opgaveSvar4[24]=
   }
   */

  void testscreen() {

    if (update == false) {
      updatetest();
      update = true;
    }
    background(255);
    text(currentopgave+": "+currentOpgaveTekst, width/9.8, height/4.7, 999, 999);
    text(opgaveSvar1[currentopgave-1], width/1.45, height/3.4, 999, 999);
    text(opgaveSvar2[currentopgave-1], width/1.45, height/2.3, 999, 999);
    text(opgaveSvar3[currentopgave-1], width/1.45, height/1.75, 999, 999);
    text(opgaveSvar4[currentopgave-1], width/1.45, height/1.4, 999, 999);

    text("dit svar:"+elevSvarNR[currentopgave-1], width/1.43, height/4.2, 999, 999);
    textFont(Comic);
    text("Prøvesæt1", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);   




    if (opgaveTilbageBut.clicked == true && currentopgave != 1) {
      currentopgave -= 1;
      currentOpgaveTekst =opgavetekst[currentopgave-1];
    }
    if (opgaveFremBut.clicked == true && currentopgave != maxopgaver) {
      currentopgave += 1;
      currentOpgaveTekst =opgavetekst[currentopgave-1];
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
