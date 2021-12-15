String[] opgavetekstData = new String[25];
String[] opgaveSvar1Data = new String[25];
String[] opgaveSvar2Data = new String[25];
String[] opgaveSvar3Data = new String[25];
String[] opgaveSvar4Data = new String[25];
String lokalbrugernavn, opgavenavn, karakter="ingen givet";
boolean karaktergivet = false;
int lokalelevID, lokalklasseID;

java.sql.Statement Tstmt, Tstmt2, Tstmt3, Tstmt4, Tstmt5, Tstmt6, Tstmt7, Tstmt8, Tstmt9, Tstmt10;
ResultSet Trs, Trs2, Trs3, Trs4, Trs5, Trs6, Trs7, Trs8, Trs9, Trs10;
Connection Tconn, Tconn2, Tconn3, Tconn4, Tconn5, Tconn6, Tconn7, Tconn8, Tconn9, Tconn10; 
String TQUERY, TQUERY2, TQUERY3, TQUERY4, TQUERY5, TQUERY6, TQUERY7, TQUERY8, TQUERY9, TQUERY10;

java.sql.Statement rigtigesvarstmt1, rigtigesvarstmt2, rigtigesvarstmt3, rigtigesvarstmt4, rigtigesvarstmt5, rigtigesvarstmt6, rigtigesvarstmt7, rigtigesvarstmt8, rigtigesvarstmt9, rigtigesvarstmt10, rigtigesvarstmt11, rigtigesvarstmt12, rigtigesvarstmt13,
rigtigesvarstmt14, rigtigesvarstmt15, rigtigesvarstmt16, rigtigesvarstmt17, rigtigesvarstmt18, rigtigesvarstmt19, rigtigesvarstmt20, rigtigesvarstmt21, rigtigesvarstmt22, rigtigesvarstmt23, rigtigesvarstmt24, rigtigesvarstmt25;

ResultSet rigtigesvarrs1, rigtigesvarrs2, rigtigesvarrs3, rigtigesvarrs4, rigtigesvarrs5, rigtigesvarrs6, rigtigesvarrs7, rigtigesvarrs8, rigtigesvarrs9, rigtigesvarrs10, rigtigesvarrs11, rigtigesvarrs12, rigtigesvarrs13,
rigtigesvarrs14, rigtigesvarrs15, rigtigesvarrs16, rigtigesvarrs17, rigtigesvarrs18, rigtigesvarrs19, rigtigesvarrs20, rigtigesvarrs21, rigtigesvarrs22, rigtigesvarrs23, rigtigesvarrs24, rigtigesvarrs25; 

Connection rigtigesvarconn1, rigtigesvarconn2, rigtigesvarconn3, rigtigesvarconn4, rigtigesvarconn5, rigtigesvarconn6, rigtigesvarconn7, rigtigesvarconn8, rigtigesvarconn9, rigtigesvarconn10, rigtigesvarconn11, rigtigesvarconn12, rigtigesvarconn13,
rigtigesvarconn14, rigtigesvarconn15, rigtigesvarconn16, rigtigesvarconn17, rigtigesvarconn18, rigtigesvarconn19, rigtigesvarconn20, rigtigesvarconn21, rigtigesvarconn22, rigtigesvarconn23, rigtigesvarconn24, rigtigesvarconn25;

String rigtigesvarQUERY1, rigtigesvarQUERY2, rigtigesvarQUERY3, rigtigesvarQUERY4, rigtigesvarQUERY5, rigtigesvarQUERY6, rigtigesvarQUERY7, rigtigesvarQUERY8, rigtigesvarQUERY9, rigtigesvarQUERY10, rigtigesvarQUERY11, rigtigesvarQUERY12, rigtigesvarQUERY13,
rigtigesvarQUERY14, rigtigesvarQUERY15, rigtigesvarQUERY16, rigtigesvarQUERY17, rigtigesvarQUERY18, rigtigesvarQUERY19, rigtigesvarQUERY20, rigtigesvarQUERY21, rigtigesvarQUERY22, rigtigesvarQUERY23, rigtigesvarQUERY24, rigtigesvarQUERY25;

int opgaveID;
int Tjekker, rigtigesvar=0;


void hentOpgave() {   

String TQUERY = "SELECT opgaveTekst"+currentopgave+" FROM opgavetext WHERE opgaveID = "+opgaveID+";";
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

void tjekResultat(){

}

void uploadResultat(){}


void tjekSvar(){
//Problmer viser man bruge connection med samme navn så denne del er meget lang
  
if (1 <= maxopgaver){
  try {
    String rigtigesvarQUERY1 = "SELECT opgave1Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn1 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt1 = rigtigesvarconn1.createStatement();
    ResultSet rigtigesvarrs1 = rigtigesvarstmt1.executeQuery(rigtigesvarQUERY1);
    

    while (rigtigesvarrs1.next()) {
    if (elevSvarNR[1-1] == rigtigesvarrs1.getInt("opgave1Svar")){
    rigtigesvar += 1; 
    }
    }  
    rigtigesvarconn1.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (2 <= maxopgaver){
  try {
    String rigtigesvarQUERY2 = "SELECT opgave2Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn2 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt2 = rigtigesvarconn2.createStatement();
    ResultSet rigtigesvarrs2 = rigtigesvarstmt2.executeQuery(rigtigesvarQUERY2);
    

    while (rigtigesvarrs2.next()) {
     if (elevSvarNR[2-1] == rigtigesvarrs2.getInt("opgave2Svar")){
    rigtigesvar += 1; 
    }

    }  
    rigtigesvarconn2.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (3 <= maxopgaver){
  try {
    String rigtigesvarQUERY3 = "SELECT opgave3Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn3 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt3 = rigtigesvarconn3.createStatement();
    ResultSet rigtigesvarrs3 = rigtigesvarstmt3.executeQuery(rigtigesvarQUERY3);
    

    while (rigtigesvarrs3.next()) {
     if (elevSvarNR[3-1] == rigtigesvarrs3.getInt("opgave3Svar")){
    rigtigesvar += 1; 
    }

    }  
    rigtigesvarconn3.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (4 <= maxopgaver){
  try {
    String rigtigesvarQUERY4 = "SELECT opgave4Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn4 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt4 = rigtigesvarconn4.createStatement();
    ResultSet rigtigesvarrs4 = rigtigesvarstmt4.executeQuery(rigtigesvarQUERY4);
    

    while (rigtigesvarrs4.next()) {
     if (elevSvarNR[4-1] == rigtigesvarrs4.getInt("opgave4Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn4.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (5 <= maxopgaver){
  try {
    String rigtigesvarQUERY5 = "SELECT opgave5Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn5 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt5 = rigtigesvarconn5.createStatement();
    ResultSet rigtigesvarrs5 = rigtigesvarstmt5.executeQuery(rigtigesvarQUERY5);
    

    while (rigtigesvarrs5.next()) {
     if (elevSvarNR[5-1] == rigtigesvarrs5.getInt("opgave5Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn5.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (6 <= maxopgaver){
  try {
    String rigtigesvarQUERY6 = "SELECT opgave6Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn6 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt6 = rigtigesvarconn6.createStatement();
    ResultSet rigtigesvarrs6 = rigtigesvarstmt6.executeQuery(rigtigesvarQUERY6);
    

    while (rigtigesvarrs6.next()) {
     if (elevSvarNR[6-1] == rigtigesvarrs6.getInt("opgave6Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn6.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (7 <= maxopgaver){
  try {
    String rigtigesvarQUERY7 = "SELECT opgave7Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn7 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt7 = rigtigesvarconn7.createStatement();
    ResultSet rigtigesvarrs7 = rigtigesvarstmt7.executeQuery(rigtigesvarQUERY7);
    

    while (rigtigesvarrs7.next()) {
     if (elevSvarNR[7-1] == rigtigesvarrs7.getInt("opgave7Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn7.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (8 <= maxopgaver){
  try {
    String rigtigesvarQUERY8 = "SELECT opgave8Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn8 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt8 = rigtigesvarconn8.createStatement();
    ResultSet rigtigesvarrs8 = rigtigesvarstmt8.executeQuery(rigtigesvarQUERY8);
    

    while (rigtigesvarrs8.next()) {
     if (elevSvarNR[8-1] == rigtigesvarrs8.getInt("opgave8Svar")){
    rigtigesvar += 1; 
    }
 

    }  
    rigtigesvarconn8.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (9 <= maxopgaver){
  try {
    String rigtigesvarQUERY9 = "SELECT opgave9Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn9 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt9 = rigtigesvarconn9.createStatement();
    ResultSet rigtigesvarrs9 = rigtigesvarstmt9.executeQuery(rigtigesvarQUERY9);
    

    while (rigtigesvarrs9.next()) {
    if (elevSvarNR[9-1] == rigtigesvarrs9.getInt("opgave9Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn9.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (10 <= maxopgaver){
  try {
    String rigtigesvarQUERY10 = "SELECT opgave10Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn10 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt10 = rigtigesvarconn10.createStatement();
    ResultSet rigtigesvarrs10 = rigtigesvarstmt10.executeQuery(rigtigesvarQUERY10);
    

    while (rigtigesvarrs10.next()) {
     if (elevSvarNR[10-1] == rigtigesvarrs10.getInt("opgave10Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn10.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (11 <= maxopgaver){
  try {
    String rigtigesvarQUERY11 = "SELECT opgave11Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn11 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt11 = rigtigesvarconn11.createStatement();
    ResultSet rigtigesvarrs11 = rigtigesvarstmt11.executeQuery(rigtigesvarQUERY11);
    

    while (rigtigesvarrs11.next()) {
     if (elevSvarNR[11-1] == rigtigesvarrs11.getInt("opgave11Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn11.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (12 <= maxopgaver){
  try {
    String rigtigesvarQUERY12 = "SELECT opgave12Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn12 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt12 = rigtigesvarconn12.createStatement();
    ResultSet rigtigesvarrs12 = rigtigesvarstmt12.executeQuery(rigtigesvarQUERY12);
    

    while (rigtigesvarrs12.next()) {
     if (elevSvarNR[12-1] == rigtigesvarrs12.getInt("opgave12Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn12.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (13 <= maxopgaver){
  try {
    String rigtigesvarQUERY13 = "SELECT opgave13Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn13 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt13 = rigtigesvarconn13.createStatement();
    ResultSet rigtigesvarrs13 = rigtigesvarstmt13.executeQuery(rigtigesvarQUERY13);
    

    while (rigtigesvarrs13.next()) {
     if (elevSvarNR[13-1] == rigtigesvarrs13.getInt("opgave13Svar")){
    rigtigesvar += 1; 
    }
 

    }  
    rigtigesvarconn13.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (14 <= maxopgaver){
  try {
    String rigtigesvarQUERY14 = "SELECT opgave14Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn14 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt14 = rigtigesvarconn14.createStatement();
    ResultSet rigtigesvarrs14 = rigtigesvarstmt14.executeQuery(rigtigesvarQUERY14);
    

    while (rigtigesvarrs14.next()) {
     if (elevSvarNR[14-1] == rigtigesvarrs14.getInt("opgave14Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn14.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (15 <= maxopgaver){
  try {
    String rigtigesvarQUERY15 = "SELECT opgave15Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn15 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt15 = rigtigesvarconn15.createStatement();
    ResultSet rigtigesvarrs15 = rigtigesvarstmt15.executeQuery(rigtigesvarQUERY15);
    

    while (rigtigesvarrs15.next()) {
     if (elevSvarNR[15-1] == rigtigesvarrs15.getInt("opgave15Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn15.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (16 <= maxopgaver){
  try {
    String rigtigesvarQUERY16 = "SELECT opgave16Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn16 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt16 = rigtigesvarconn16.createStatement();
    ResultSet rigtigesvarrs16 = rigtigesvarstmt16.executeQuery(rigtigesvarQUERY16);
    

    while (rigtigesvarrs16.next()) {
     if (elevSvarNR[16-1] == rigtigesvarrs16.getInt("opgave16Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn16.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (17 <= maxopgaver){
  try {
    String rigtigesvarQUERY17 = "SELECT opgave17Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn17 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt17 = rigtigesvarconn17.createStatement();
    ResultSet rigtigesvarrs17 = rigtigesvarstmt17.executeQuery(rigtigesvarQUERY17);
    

    while (rigtigesvarrs17.next()) {
     if (elevSvarNR[17-1] == rigtigesvarrs17.getInt("opgave17Svar")){
    rigtigesvar += 1; 
    }
 

    }  
    rigtigesvarconn17.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (18 <= maxopgaver){
  try {
    String rigtigesvarQUERY18 = "SELECT opgave18Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn18 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt18 = rigtigesvarconn18.createStatement();
    ResultSet rigtigesvarrs18 = rigtigesvarstmt18.executeQuery(rigtigesvarQUERY18);
    

    while (rigtigesvarrs18.next()) {
     if (elevSvarNR[18-1] == rigtigesvarrs18.getInt("opgave18Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn18.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (19 <= maxopgaver){
  try {
    String rigtigesvarQUERY19 = "SELECT opgave19Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn19 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt19 = rigtigesvarconn19.createStatement();
    ResultSet rigtigesvarrs19 = rigtigesvarstmt19.executeQuery(rigtigesvarQUERY19);
    

    while (rigtigesvarrs19.next()) {
     if (elevSvarNR[19-1] == rigtigesvarrs19.getInt("opgave19Svar")){
    rigtigesvar += 1; 
    }
 

    }  
    rigtigesvarconn19.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (20 <= maxopgaver){
  try {
    String rigtigesvarQUERY20 = "SELECT opgave20Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn20 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt20 = rigtigesvarconn20.createStatement();
    ResultSet rigtigesvarrs20 = rigtigesvarstmt20.executeQuery(rigtigesvarQUERY20);
    

    while (rigtigesvarrs20.next()) {
     if (elevSvarNR[20-1] == rigtigesvarrs20.getInt("opgave20Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn20.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (21 <= maxopgaver){
  try {
    String rigtigesvarQUERY21 = "SELECT opgave21Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn21 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt21 = rigtigesvarconn21.createStatement();
    ResultSet rigtigesvarrs21 = rigtigesvarstmt21.executeQuery(rigtigesvarQUERY21);
    

    while (rigtigesvarrs21.next()) {
     if (elevSvarNR[21-1] == rigtigesvarrs21.getInt("opgave21Svar")){
    rigtigesvar += 1; 
    }
 

    }  
    rigtigesvarconn21.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (22 <= maxopgaver){
  try {
    String rigtigesvarQUERY22 = "SELECT opgave22Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn22 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt22 = rigtigesvarconn22.createStatement();
    ResultSet rigtigesvarrs22 = rigtigesvarstmt22.executeQuery(rigtigesvarQUERY22);
    

    while (rigtigesvarrs22.next()) {
     if (elevSvarNR[22-1] == rigtigesvarrs22.getInt("opgave22Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn22.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (23 <= maxopgaver){
  try {
    String rigtigesvarQUERY23 = "SELECT opgave23Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn23 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt23 = rigtigesvarconn23.createStatement();
    ResultSet rigtigesvarrs23 = rigtigesvarstmt23.executeQuery(rigtigesvarQUERY23);
    

    while (rigtigesvarrs23.next()) {
     if (elevSvarNR[23-1] == rigtigesvarrs23.getInt("opgave23Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn23.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (24 <= maxopgaver){
  try {
    String rigtigesvarQUERY24 = "SELECT opgave24Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn24 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt24 = rigtigesvarconn24.createStatement();
    ResultSet rigtigesvarrs24 = rigtigesvarstmt24.executeQuery(rigtigesvarQUERY24);
    

    while (rigtigesvarrs24.next()) {
     if (elevSvarNR[24-1] == rigtigesvarrs24.getInt("opgave24Svar")){
    rigtigesvar += 1; 
    }


    }  
    rigtigesvarconn24.close();
  }
  catch(Exception e) {
    println(e);
  }
}
if (25 <= maxopgaver){
  try {
    String rigtigesvarQUERY25 = "SELECT opgave25Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
    Connection rigtigesvarconn25 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement rigtigesvarstmt25 = rigtigesvarconn25.createStatement();
    ResultSet rigtigesvarrs25 = rigtigesvarstmt25.executeQuery(rigtigesvarQUERY25);
    

    while (rigtigesvarrs25.next()) {
     if (elevSvarNR[25-1] == rigtigesvarrs25.getInt("opgave25Svar")){
    rigtigesvar += 1; 
    }
    }  
    rigtigesvarconn25.close();
  }
  catch(Exception e) {
    println(e);
  }
}
}

//Find elevprøver
void elevLoadOpgaver(){
String TQUERY6 = "SELECT elevID FROM elev WHERE brugernavn = '"+lokalbrugernavn+"';";
String TQUERY7 = "SELECT klasseID FROM elev WHERE elevID = '"+lokalelevID+"';";
//lokalklasseID = Trs7.getInt("klasseID");
lokalklasseID = 123451;
String TQUERY8 = "SELECT opgaveantalklasse FROM klasse WHERE klasseID = '"+lokalklasseID+"';";
//String TQUERY9del1 = "SELECT TOP "+opgaveantalklasse+" opgaveID FROM klasseopgaver WHERE klasseID ORDER BY ID = '"+lokalklasseID+"'; ";
String TQUERY10 = "SELECT opgaveNavn FROM klasseopgaver WHERE opgaveID = '"+lokalklasseID+"';";
String TQUERY11 = "SELECT opgaveOpen FROM klasseopgaver WHERE opgaveID = '"+lokalklasseID+"';";
/*
if (Trs11 != -1)
String TQUERY12 SELECT opgaveAntal FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID";
String TQUERY13 SELECT rigtigeSvar FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID";
String TQUERY14 SELECT opgaveAntal FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID";
String TQUERY15 SELECT karakterVis FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID";
*/
  try {
    Connection Tconn6 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt6 = Tconn.createStatement();
    ResultSet Trs6 = Tstmt6.executeQuery(TQUERY6);

    while (Trs6.next()) {
   // lokalelevID = Trs6.getInt("elevID");
    println(Trs6);
    }
    Tconn6.close();
  }
  catch(Exception e) {
    println(e);
  }
}

/*
 


 //Uddel elevprøver
 void uddelOpgaver(){
   int valgtklasseID =0;
   int valgtopgaveID =0;
 String TQUERYx = "SELECT opgaveantalklasse FROM klasse WHERE klasseID = "+valgtklasseID+";";
 nyopgaveantal=Trsx+1
 String TQUERYx = "klasse SET opgaveantalklasse = "+nyopgaveantal+"  WHERE klasseID = "+valgtklasseID+";";
 String TQUERYx = "SELECT opgaveNavn FROM opgavetabel WHERE opgaveID = "+valgtopgaveID+";"; 
 Trsx = opgavenavn;
 
 String TQUERYx = "SELECT elevAntal FROM klasse WHERE klasseID = "+valgtklasseID+";";
 if elevAntal >= 1; 
 {
 String TQUERYx = "SELECT elevID1 FROM klasse WHERE klasseID = "+valgtklasseID+";";
  if (karaktergivet == true)
 {
   karakter ="er givet"
 }
 String TQUERYx = "INSERT INTO klasseopgaver (klasseID, opgaveID, opgavenavn, karakter) VALUES ("+valgtklasseID+", "+valgtopgaveID+", "+opgavenavn+", '"+karakter+"');";
   
 } 
 
 
 }
 void OpretOpgaver(){
 String TQUERYx = "SELECT opgaveID, MAX(opgaveID) FROM opgavetabel GROUP BY opgaveID";
 maxID2=Trsx+1;
 String TQUERYx = "INSERT INTO opgavetabel (opgaveID, opgaveNavn, opgaveAntal) VALUES (maxID2, '"+opgaveNavn+"', "+opgaveAntal+" );");
 
 String TQUERYx = "INSERT INTO opgavetext(opgaveID, opgaveTekst1,opgaveTekst2,opgaveTekst3,opgaveTekst4,opgaveTekst5,opgaveTekst6,opgaveTekst7,opgaveTekst8,opgaveTekst9,opgaveTekst10,opgaveTekst11,opgaveTekst12,opgaveTekst13,opgaveTekst14,opgaveTekst15,opgaveTekst16
 ,opgaveTekst17,opgaveTekst18,opgaveTekst19,opgaveTekst20,opgaveTekst21,opgaveTekst22,opgaveTekst23,opgaveTekst24,opgaveTekst25) 
 VALUES (”maxID2”, ’"+opgavetekst[1-1]+"’, ’"+opgavetekst[2-1]+"’, ’"+opgavetekst[3-1]+"’, ’"+opgavetekst[4-1]+"’, ’"+opgavetekst[5-1]+"’, ’"+opgavetekst[6-1]+"’, ’"+opgavetekst[7-1]+"’, ’"+opgavetekst[8-1]+"’, ’"+opgavetekst[9-1]+"’, ’"+opgavetekst[10-1]+"’,
  ’"+opgavetekst[11-1]+"’, ’"+opgavetekst[12-1]+"’, ’"+opgavetekst[13-1]+"’, ’"+opgavetekst[14-1]+"’, ’"+opgavetekst[15-1]+"’, ’"opgavetekst[16-1]+"’, ’"+opgavetekst[17-1]+"’, 
  ’"+opgavetekst[18-1]+"’, ’"+opgavetekst[19-1]+"’, ’"+opgavetekst[20-1]+"’, ’"+opgavetekst[21-1]+"’, ’"+opgavetekst[22-1]+"’, ’"+opgavetekst[23-1]+"’, ’"+opgavetekst[24-1]+"’, ’"+opgavetekst[25-1]+"’);";
 
 String TQUERYx = "INSERT INTO opgavesvar1 (opgaveID, opgave1Svar1,opgave2Svar1,opgave3Svar1,opgave4Svar1,opgave5Svar1,opgave6Svar1,opgave7Svar1,opgave8Svar1,opgave9Svar1,opgave10Svar1,opgave11Svar1,opgave12Svar1,opgave13Svar1,opgave14Svar1,opgave15Svar1,opgave16Svar1
 ,opgave17Svar1,opgave18Svar1,opgave19Svar1,opgave20Svar1,opgave21Svar1,opgave22Svar1,opgave23Svar1,opgave24Svar1,opgave25Svar1) 
 VALUES (”maxID2”, ’"+opgaveSvar1[1-1]+"’, ’"+opgaveSvar1[2-1]+"’, ’"+opgaveSvar1[3-1]+"’, ’"+opgaveSvar1[4-1]+"’, ’"+opgaveSvar1[5-1]+"’, ’"+opgaveSvar1[6-1]+"’, ’"+opgaveSvar1[7-1]+"’, ’"+opgaveSvar1[8-1]+"’, ’"+opgaveSvar1[9-1]+"’, ’"+opgaveSvar1[10-1]+"’,
  ’"+opgaveSvar1[11-1]+"’, ’"+opgaveSvar1[12-1]+"’, ’"+opgaveSvar1[13-1]+"’, ’"+opgaveSvar1[14-1]+"’, ’"+opgaveSvar1[15-1]+"’, ’"opgaveSvar1[16-1]+"’, ’"+opgaveSvar1[17-1]+"’, 
  ’"+opgaveSvar1[18-1]+"’, ’"+opgaveSvar1[19-1]+"’, ’"+opgaveSvar1[20-1]+"’, ’"+opgaveSvar1[21-1]+"’, ’"+opgaveSvar1[22-1]+"’, ’"+opgaveSvar1[23-1]+"’, ’"+opgaveSvar1[24-1]+"’, ’"+opgaveSvar1[25-1]+"’);";

 String TQUERYx = "INSERT INTO opgavesvar2 (opgaveID, opgave1Svar2,opgave2Svar2,opgave3Svar2,opgave4Svar2,opgave5Svar2,opgave6Svar2,opgave7Svar2,opgave8Svar2,opgave9Svar2,opgave10Svar2,opgave11Svar2,opgave12Svar2,opgave13Svar2,opgave14Svar2,opgave15Svar2,opgave16Svar2
 ,opgave17Svar2,opgave18Svar2,opgave19Svar2,opgave20Svar2,opgave21Svar2,opgave22Svar2,opgave23Svar2,opgave24Svar2,opgave25Svar2) 
 VALUES (”maxID2”, ’"+opgaveSvar2[1-1]+"’, ’"+opgaveSvar2[2-1]+"’, ’"+opgaveSvar2[3-1]+"’, ’"+opgaveSvar2[4-1]+"’, ’"+opgaveSvar2[5-1]+"’, ’"+opgaveSvar2[6-1]+"’, ’"+opgaveSvar2[7-1]+"’, ’"+opgaveSvar2[8-1]+"’, ’"+opgaveSvar2[9-1]+"’, ’"+opgaveSvar2[10-1]+"’,
  ’"+opgaveSvar2[11-1]+"’, ’"+opgaveSvar2[12-1]+"’, ’"+opgaveSvar2[13-1]+"’, ’"+opgaveSvar2[14-1]+"’, ’"+opgaveSvar2[15-1]+"’, ’"opgaveSvar2[16-1]+"’, ’"+opgaveSvar2[17-1]+"’, 
  ’"+opgaveSvar2[18-1]+"’, ’"+opgaveSvar2[19-1]+"’, ’"+opgaveSvar2[20-1]+"’, ’"+opgaveSvar2[21-1]+"’, ’"+opgaveSvar2[22-1]+"’, ’"+opgaveSvar2[23-1]+"’, ’"+opgaveSvar2[24-1]+"’, ’"+opgaveSvar2[25-1]+"’);";

 String TQUERYx = "INSERT INTO opgavesvar3 (opgaveID, opgave1Svar3,opgave2Svar3,opgave3Svar3,opgave4Svar3,opgave5Svar3,opgave6Svar3,opgave7Svar3,opgave8Svar3,opgave9Svar3,opgave10Svar3,opgave11Svar3,opgave12Svar3,opgave13Svar3,opgave14Svar3,opgave15Svar3,opgave16Svar3
 ,opgave17Svar3,opgave18Svar3,opgave19Svar3,opgave20Svar3,opgave21Svar3,opgave22Svar3,opgave23Svar3,opgave24Svar3,opgave25Svar3) 
 VALUES (”maxID2”, ’"+opgaveSvar3[1-1]+"’, ’"+opgaveSvar3[2-1]+"’, ’"+opgaveSvar3[3-1]+"’, ’"+opgaveSvar3[4-1]+"’, ’"+opgaveSvar3[5-1]+"’, ’"+opgaveSvar3[6-1]+"’, ’"+opgaveSvar3[7-1]+"’, ’"+opgaveSvar3[8-1]+"’, ’"+opgaveSvar3[9-1]+"’, ’"+opgaveSvar3[10-1]+"’,
  ’"+opgaveSvar3[11-1]+"’, ’"+opgaveSvar3[12-1]+"’, ’"+opgaveSvar3[13-1]+"’, ’"+opgaveSvar3[14-1]+"’, ’"+opgaveSvar3[15-1]+"’, ’"opgaveSvar3[16-1]+"’, ’"+opgaveSvar3[17-1]+"’, 
  ’"+opgaveSvar3[18-1]+"’, ’"+opgaveSvar3[19-1]+"’, ’"+opgaveSvar3[20-1]+"’, ’"+opgaveSvar3[21-1]+"’, ’"+opgaveSvar3[22-1]+"’, ’"+opgaveSvar3[23-1]+"’, ’"+opgaveSvar3[24-1]+"’, ’"+opgaveSvar3[25-1]+"’);";

 String TQUERYx = "INSERT INTO opgavesvar4 (opgaveID, opgave1Svar4,opgave2Svar4,opgave3Svar4,opgave4Svar4,opgave5Svar4,opgave6Svar4,opgave7Svar4,opgave8Svar4,opgave9Svar4,opgave10Svar4,opgave11Svar4,opgave12Svar4,opgave13Svar4,opgave14Svar4,opgave15Svar4,opgave16Svar4
 ,opgave17Svar4,opgave18Svar4,opgave19Svar4,opgave20Svar4,opgave21Svar4,opgave22Svar4,opgave23Svar4,opgave24Svar4,opgave25Svar4) 
 VALUES (”maxID2”, ’"+opgaveSvar4[1-1]+"’, ’"+opgaveSvar4[2-1]+"’, ’"+opgaveSvar4[3-1]+"’, ’"+opgaveSvar4[4-1]+"’, ’"+opgaveSvar4[5-1]+"’, ’"+opgaveSvar4[6-1]+"’, ’"+opgaveSvar4[7-1]+"’, ’"+opgaveSvar4[8-1]+"’, ’"+opgaveSvar4[9-1]+"’, ’"+opgaveSvar4[10-1]+"’,
  ’"+opgaveSvar4[11-1]+"’, ’"+opgaveSvar4[12-1]+"’, ’"+opgaveSvar4[13-1]+"’, ’"+opgaveSvar4[14-1]+"’, ’"+opgaveSvar4[15-1]+"’, ’"opgaveSvar4[16-1]+"’, ’"+opgaveSvar4[17-1]+"’, 
  ’"+opgaveSvar4[18-1]+"’, ’"+opgaveSvar4[19-1]+"’, ’"+opgaveSvar4[20-1]+"’, ’"+opgaveSvar4[21-1]+"’, ’"+opgaveSvar4[22-1]+"’, ’"+opgaveSvar4[23-1]+"’, ’"+opgaveSvar4[24-1]+"’, ’"+opgaveSvar4[25-1]+"’);";
 
 
 String TQUERYx = "INSERT INTO opgavesvarark (opgaveID, opgave1Svar,opgave2Svar,opgave3Svar,opgave4Svar,opgave5Svar,opgave6Svar,opgave7Svar,opgave8Svar,opgave9Svar,opgave10Svar,opgave11Svar,opgave12Svar,opgave13Svar,opgave14Svar,opgave15Svar,opgave16Svar
 ,opgave17Svar,opgave18Svar,opgave19Svar,opgave20Svar,opgave21Svar,opgave22Svar,opgave23Svar,opgave24Svar,opgave25Svar) 
 VALUES ("+maxID2+", "+realtSvarNR[1-1]+", "+realtSvarNR[2-1]+", "+realtSvarNR[3-1]+", "+realtSvarNR[4-1]+", "+realtSvarNR[5-1]+", "+realtSvarNR[6-1]+", "+realtSvarNR[7-1]+", "+realtSvarNR[8-1]+", "+realtSvarNR[9-1]+", "+realtSvarNR[10-1]+",
  "+realtSvarNR[11-1]+", "+realtSvarNR[12-1]+", "+realtSvarNR[13-1]+", "+realtSvarNR[14-1]+", "+realtSvarNR[15-1]+", "+realtSvarNR[16-1]+", "+realtSvarNR[17-1]+", 
  "+realtSvarNR[18-1]+", "+realtSvarNR[19-1]+", "+realtSvarNR[20-1]+", "+realtSvarNR[21-1]+", "+realtSvarNR[22-1]+", "+realtSvarNR[23-1]+", "+realtSvarNR[24-1]+", "+realtSvarNR[25-1]+");";
 }
 */
