String[] opgavetekstData = new String[25];
String[] opgaveSvar1Data = new String[25];
String[] opgaveSvar2Data = new String[25];
String[] opgaveSvar3Data = new String[25];
String[] opgaveSvar4Data = new String[25];
String lokalbrugernavn;
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
String TQUERY9 = "SELECT elevID FROM elev WHERE brugernavn = '"+lokalbrugernavn+"';";
String TQUERY7 = "SELECT klasseID FROM elev WHERE elevID = '"+lokalelevID+"';";
//lokalklasseID = Trs7.getInt("klasseID");
String TQUERY8 = "SELECT opgaveantalklasse FROM klasse WHERE klasseID = '"+lokalklasseID+"';";
lokalklasseID = 123451;
String TQUERY6 = "SELECT opgaveID FROM klasseopgaver WHERE klasseID = '"+lokalklasseID+"';";
String TQUERY10 = "SELECT opgaveNavn FROM klasseopgaver WHERE klasseID = '"+lokalklasseID+"';";
//https://stackoverflow.com/questions/7332731/sql-server-select-top-10-20-results
//http://www-db.deis.unibo.it/courses/TW/DOCS/w3schools/sql/sql_top.asp.html
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
 //Uddel elevprøver
 void uddelOpgaver(){
 }
 
 void OpretOpgaver(){
 //String TQUERYx = "SELECT opgaveID, MAX(opgaveID) FROM opgavetabel GROUP BY opgaveID";
 //maxID2=Trsx
 //String TQUERYx = "INSERT INTO () VALUES ( );");
 }
 //Oprette prøver
