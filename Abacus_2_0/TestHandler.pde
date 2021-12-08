String[] opgavetekstData = new String[25];
String[] opgaveSvar1Data = new String[25];
String[] opgaveSvar2Data = new String[25];
String[] opgaveSvar3Data = new String[25];
String[] opgaveSvar4Data = new String[25];
java.sql.Statement Tstmt, Tstmt2, Tstmt3, Tstmt4, Tstmt5, Tstmt6, Tstmt7, Tstmt8, Tstmt9, Tstmt10;
ResultSet Trs, Trs2, Trs3, Trs4, Trs5, Trs6, Trs7, Trs8, Trs9, Trs10;
Connection Tconn, Tconn2, Tconn3, Tconn4, Tconn5, Tconn6, Tconn7, Tconn8, Tconn9, Tconn10; 
String TQUERY, TQUERY2, TQUERY3, TQUERY4, TQUERY5, TQUERY6, TQUERY7, TQUERY8, TQUERY9, TQUERY10;
int opgaveID;
int Tjekker, rigtigesvar=0;


void hentOpgave() {   

String TQUERY = "SELECT opgaveTekst"+currentopgave+" FROM opgavetext WHERE opgaveID = 1;";
  String TQUERY2 = "SELECT opgave"+currentopgave+"Svar1 FROM opgavesvar1 WHERE opgaveID = "+opgaveID+";";
  String TQUERY3 = "SELECT opgave"+currentopgave+"Svar2 FROM opgavesvar2 WHERE opgaveID = "+opgaveID+";";
  String TQUERY4 = "SELECT opgave"+currentopgave+"Svar3 FROM opgavesvar3 WHERE opgaveID = "+opgaveID+";";
  String TQUERY5 = "SELECT opgave"+currentopgave+"Svar4 FROM opgavesvar4 WHERE opgaveID = "+opgaveID+";";
  try {
    Connection Tconn = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt = Tconn.createStatement();
    ResultSet Trs = Tstmt.executeQuery(TQUERY);

    while (Trs.next()) {
      opgavetekst[currentopgave-1] = Trs.getString("opgaveTekst"+currentopgave);
    }
    Tconn.close();
  }
  catch(Exception e) {
    println(e);
  }
  //svar1
  try {


    Connection Tconn2= DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt2= Tconn2.createStatement();
    ResultSet Trs2= Tstmt2.executeQuery(TQUERY2);

    while (Trs2.next()) {
      opgaveSvar1[currentopgave-1] = Trs2.getString("opgave"+currentopgave+"Svar1");
    }
    Tconn2.close();
  }
  catch(Exception e) {
    println(e);
  }
  //svar2
  try {


    Connection Tconn3= DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt3= Tconn3.createStatement();
    ResultSet Trs3= Tstmt3.executeQuery(TQUERY3);

    while (Trs3.next()) {
      opgaveSvar2[currentopgave-1] = Trs3.getString("opgave"+currentopgave+"Svar2");
    }
    Tconn3.close();
  }
  catch(Exception e) {
    println(e);
  }
  //svar3
  try {


    Connection Tconn4= DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt4= Tconn4.createStatement();
    ResultSet Trs4= Tstmt4.executeQuery(TQUERY4);

    while (Trs4.next()) {
      opgaveSvar3[currentopgave-1] = Trs4.getString("opgave"+currentopgave+"Svar3");
    }
    Tconn4.close();
  }
  catch(Exception e) {
    println(e);
  }
  //svar4
  try {


    Connection Tconn5= DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt5= Tconn5.createStatement();
    ResultSet Trs5= Tstmt5.executeQuery(TQUERY5);

    while (Trs5.next()) {
      opgaveSvar4[currentopgave-1] = Trs5.getString("opgave"+currentopgave+"Svar4");
    }
    Tconn5.close();
  }
  catch(Exception e) {
    println(e);
  }
}

void antalOpgaver(){
String TQUERY6 = "SELECT opgaveAntal FROM opgavetabel WHERE opgaveID = "+opgaveID+";";
 try {

    Connection Tconn6= DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt6= Tconn6.createStatement();
    ResultSet Trs6= Tstmt6.executeQuery(TQUERY6);

    while (Trs6.next()) {
      maxopgaver = Trs6.getInt("opgaveAntal");
    }
    Tconn6.close();
  }
  catch(Exception e) {
    println(e);
  }
}
void tjekSvar(){

for (int i = 1; i <= maxopgaver; i++) {
  try {
    Connection Tconn7 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt7 = Tconn7.createStatement();
    ResultSet Trs7 = Tstmt7.executeQuery("SELECT opgave"+i+"Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+"");
    

    while (Trs7.next()) {
   if  (Tjekker == Trs7.getInt("opgave"+i+"Svar"))
     rigtigesvar += 1; 

    }  
    Tconn7.close();
  }
  catch(Exception e) {
    println(e);
  }
  
}
}
