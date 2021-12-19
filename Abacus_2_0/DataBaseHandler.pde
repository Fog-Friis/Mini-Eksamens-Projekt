import java.sql.*;
boolean underviserlogin = false;
String USER = "root";
  String PASS = "";
  String DB_URL = "jdbc:mysql://localhost:3306/mep";
int lokalunderviserID, klasse1, klasse2, klasse3, klasse4, klasse5;
String knavn1, knavn2, knavn3, knavn4, knavn5;
/*
  java.sql.Statement stmt, stmt2, stmt3, stmt4, stmt5, stmt6, stmt7, stmt8, stmt9, stmt10, stmt11;
  ResultSet rs, rs2, rs3, rs4, rs5, rs6, rs7, rs8, rs9, rs10, rs11;
  Connection conn, conn2, conn3, conn4, conn5, conn6, conn7, conn8, conn9, conn10, conn11; 
  */
  String test, klassenavn;
  String hashedPassword = "testpassword";
  int maxID = 0, maxID2 = -1;
  int klasseAntal, elevAntal;
  String usernameInput, passwordInput;

//  String QUERY, QUERY2, QUERY3, QUERY4, QUERY5, QUERY6, QUERY7, QUERY8, QUERY9, QUERY10, QUERY11;
  String result;
void elevLoginCheck(){
  
      try{
      lokalbrugernavn = logUserTB.Text;
      hashedPassword = outputString;
       String QUERY = "SELECT password FROM elev WHERE brugernavn = '"+lokalbrugernavn+"';";
      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(QUERY);

      while (rs.next()) {
          test = rs.getString("password"); 
        if (test.equals(hashedPassword) == true){
          //Skift gamestate     
          }
        else{
            
             System.out.print("password don't match");
        }
              
      }
      conn.close();
    }
    catch(Exception e){
      println(e);  
    }
}

void underviserLoginCheck(){
    lokalbrugernavn = logUserTB.Text;
  try{    
      hashedPassword = outputString;
       String QUERY8 = "SELECT password FROM underviser WHERE brugernavn = '"+logUserTB.Text+"';";
      Connection conn8 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt8 = conn8.createStatement();
      ResultSet rs8 = stmt8.executeQuery(QUERY8);

      while (rs8.next()) {
          test = rs8.getString("password"); 
        if (test.equals(hashedPassword) == true){
          //Skift gamestate     
          }
        else{
            
             System.out.print("password don't match");
        }
      }
      conn8.close();
    }
    catch(Exception e){
      println(e);  
    }
}
    
  void elevRegister(){
    try{
          
       String QUERY2 = "SELECT elevID, MAX(elevID) FROM elev GROUP BY elevID";      
     Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt2 = conn2.createStatement(); 
     ResultSet rs2 = stmt2.executeQuery(QUERY2);
     
     while (rs2.next()) {
     maxID = ((int)rs2.getInt("elevID"));
     maxID2 = maxID+1;

    }
    conn2.close();
  }
 
  catch(Exception e){
    println(e);  
  }   
 
   try {
     hashedPassword = outputString;
         lokalbrugernavn = regUserElevTB.Text;
     String QUERY3 = ("INSERT INTO elev (elevID, brugernavn, password, klasseID) VALUES ( "+maxID2+", '"+regUserElevTB.Text+"', '"+hashedPassword+"', '"+regVerifikationElevTB.Text+"');");
      Connection conn3 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt3 = conn3.createStatement();
      stmt3.executeUpdate(QUERY3);
    conn3.close();
       
}
catch(Exception e){
    println(e);      
  }  

  try{
    
      
     // String QUERY4 = "SELECT underviserID, MAX(underviserID) FROM underviser GROUP BY underviserID";
       String QUERY4 = "SELECT elevID, MAX(elevID) FROM elev GROUP BY elevID";
       
     Connection conn4 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt4 = conn4.createStatement(); 
     ResultSet rs4 = stmt4.executeQuery(QUERY4);
     
     while (rs4.next()) {
     maxID2 = ((int)rs4.getInt("elevID"));
            
    }
    conn4.close();
  }
  
 
  catch(Exception e){
    println(e);  
  } 
if (maxID2 == maxID){
  println("Username in use");
}
else{
  
 try{
    
     String QUERY13 = "SELECT elevAntal FROM klasse WHERE klasseID ="+regVerifikationElevTB.Text+";";
       
     Connection conn13 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt13 = conn13.createStatement(); 
     ResultSet rs13 = stmt13.executeQuery(QUERY13);
     
     while (rs13.next()) {
     elevAntal = ((int)rs13.getInt("elevAntal"));
     elevAntal = elevAntal+1;       
    }
    conn13.close();
  }
catch(Exception e){
    println(e);  
  }
  
  try {
     String QUERY14 = "UPDATE klasse SET elevAntal = "+elevAntal+"  WHERE klasseID = "+regVerifikationElevTB.Text+";";
      Connection conn14 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt14 = conn14.createStatement();
      stmt14.executeUpdate(QUERY14);
      conn14.close();
}
catch(Exception e){
    println(e);      
  }
  try {
     
     String QUERY15 = ("INSERT INTO klasse (elevID"+elevAntal+") VALUES ( "+maxID2+");");
      Connection conn15 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt15 = conn15.createStatement();
      stmt3.executeUpdate(QUERY15);
    conn15.close();
}
catch(Exception e){
    println(e);      
  }  

}

}

void underviserRegister(){
    try{

       String QUERY9 = "SELECT underviserID, MAX(underviserID) FROM underviser GROUP BY underviserID";
       
     Connection conn9 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt9 = conn9.createStatement(); 
     ResultSet rs9 = stmt9.executeQuery(QUERY9);
     
     while (rs9.next()) {
     maxID = ((int)rs9.getInt("underviserID"));
     maxID2 = maxID+1;

    }
    conn9.close();
  }
 
  catch(Exception e){
    println(e);  
  }
try {
     hashedPassword = outputString;
     lokalbrugernavn = regUserLaererTB.Text;   
     String QUERY10 = ("INSERT INTO underviser (underviserID, brugernavn, password, skole, klasseAntal ) VALUES ("+maxID2+", '"+lokalbrugernavn+"', '"+hashedPassword+"','"+skole+"', "+0+");");    
   
      Connection conn10 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt10 = conn10.createStatement();
      stmt10.executeUpdate(QUERY10);
    conn10.close();
       
}
catch(Exception e){
    println(e);      
  }  
}



void opretKlasse(){
result = "";

for (int i = 0; i <= 6; i++) {
  result +=(int(random (10)));
}
    try{

      String QUERY5 = "SELECT underviserID FROM underviser WHERE brugernavn = '"+lokalbrugernavn+"';";
       
     Connection conn5 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt5 = conn5.createStatement(); 
     ResultSet rs5 = stmt5.executeQuery(QUERY5);
     
     while (rs5.next()) {
     maxID = ((int)rs5.getInt("underviserID"));
     result += maxID;
    
    }
    conn5.close();
  }
 
  catch(Exception e){
    println(e);  
  } 
  
  try {
      maxID2 = Integer.parseInt(result);
} catch (NumberFormatException e) {

}   
   try {
     String QUERY6 = ("INSERT INTO klasse (klasseID, klassenavn, underviserID) VALUES ("+maxID2+", '"+klassenavn+"', "+maxID+");");
      Connection conn6 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt6 = conn6.createStatement();
      stmt6.executeUpdate(QUERY6);
      conn6.close();
}
catch(Exception e){
    println(e);      
  } 
  try {
     String QUERY7 = "SELECT klasseAntal FROM underviser WHERE brugernavn = '"+lokalbrugernavn+"';";
      Connection conn7 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt7 = conn7.createStatement();
      stmt7.executeUpdate(QUERY7);
       while (rs7.next()) {
     klasseAntal = ((int)rs7.getInt("klasseAntal"));
     klasseAntal = klasseAntal+1;
      }
      conn7.close();
     
}
catch(Exception e){
    println(e);      
  } 
  
  try {
     String QUERY12 = "UPDATE underviser SET klasseAntal = "+klasseAntal+"  WHERE klasseID = "+maxID+";";
      Connection conn12 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt12 = conn12.createStatement();
      stmt12.executeUpdate(QUERY12);
      conn12.close();
}
catch(Exception e){
    println(e);      
  } 
  
}

void findKlasse(){
 
  try{

      String QUERY18 = "SELECT underviserID FROM underviser WHERE brugernavn = '"+lokalbrugernavn+"';";
       
     Connection conn18 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt18 = conn18.createStatement(); 
     ResultSet rs18 = stmt18.executeQuery(QUERY18);
     
     while (rs18.next()) {
     maxID = ((int)rs18.getInt("underviserID"));
     
    
    }
    conn18.close();
  }
 catch(Exception e){
    println(e);      
  } 
  
  try {
     String QUERY16 = "SELECT klasseAntal FROM underviser WHERE brugernavn = '"+lokalbrugernavn+"';";
      Connection conn16 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt16 = conn16.createStatement();
      ResultSet rs16 = stmt16.executeQuery(QUERY16);
      
      while (rs16.next()) {
     klasseAntal = ((int)rs16.getInt("klasseAntal"));
    }
      conn16.close();
}
catch(Exception e){
    println(e);      
  }
  
  if (klasseAntal >= enplusside){
  try {
  String QUERY17 = "SELECT klasseID FROM klasse WHERE underviserID ORDER BY ID = "+maxID+" DESC LIMIT (1,"+enplusside+");";
  Connection conn17 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt17 = conn17.createStatement(); 
     ResultSet rs17 = stmt17.executeQuery(QUERY17);
     while (rs17.next()) {
      klasse1 = ((int)rs17.getInt("karakterVis"));
    }
    conn17.close();
  }
  catch(Exception e){
    println(e);  
  }
  try {
  String QUERY23 = "SELECT klassenavn FROM klasse WHERE klasseID = "+klasse1+";";
  Connection conn23 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt23 = conn23.createStatement(); 
     ResultSet rs23 = stmt23.executeQuery(QUERY23);
     while (rs23.next()) {
      knavn1 = rs23.getString("klassenavn");
    }
    conn23.close();
  }
  catch(Exception e){
    println(e);  
  }
  
  }if (klasseAntal >= toplusside){
  try {
  String QUERY19 = "SELECT klasseID FROM klasse WHERE underviserID ORDER BY ID = "+maxID+" DESC LIMIT (1,"+toplusside+");";
  Connection conn19 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt19 = conn19.createStatement(); 
     ResultSet rs19 = stmt19.executeQuery(QUERY19);
     while (rs19.next()) {
      klasse2 = ((int)rs19.getInt("karakterVis"));
    }
    conn19.close();
  }
  catch(Exception e){
    println(e);  
  }
  try {
  String QUERY24 = "SELECT klassenavn FROM klasse WHERE klasseID = "+klasse2+";";
  Connection conn24 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt24 = conn24.createStatement(); 
     ResultSet rs24 = stmt24.executeQuery(QUERY24);
     while (rs24.next()) {
      knavn2= rs24.getString("klassenavn");
    }
    conn24.close();
  }
  catch(Exception e){
    println(e);  
  }
  }if (klasseAntal >= treplusside){
  try {
  String QUERY20 = "SELECT klasseID FROM klasse WHERE underviserID ORDER BY ID = "+maxID+" DESC LIMIT (1,"+treplusside+");";
  Connection conn20 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt20 = conn20.createStatement(); 
     ResultSet rs20 = stmt20.executeQuery(QUERY20);
     while (rs20.next()) {
      klasse3 = ((int)rs20.getInt("karakterVis"));
    }
    conn20.close();
  }
  catch(Exception e){
    println(e);  
  }
  try {
  String QUERY25 = "SELECT klassenavn FROM klasse WHERE klasseID = "+klasse3+";";
  Connection conn25 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt25 = conn25.createStatement(); 
     ResultSet rs25 = stmt25.executeQuery(QUERY25);
     while (rs25.next()) {
      knavn3= rs25.getString("klassenavn");
    }
    conn25.close();
  }
  catch(Exception e){
    println(e);  
  }
  
  }if (klasseAntal >= fireplusside){
  try {
  String QUERY21 = "SELECT klasseID FROM klasse WHERE underviserID ORDER BY ID = "+maxID+" DESC LIMIT (1,"+fireplusside+");";
  Connection conn21 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt21 = conn21.createStatement(); 
     ResultSet rs21 = stmt21.executeQuery(QUERY21);
     while (rs21.next()) {
      klasse4 = ((int)rs21.getInt("karakterVis"));
    }
    conn21.close();
  }
  catch(Exception e){
    println(e);  
  }
    try {
  String QUERY26 = "SELECT klassenavn FROM klasse WHERE klasseID = "+klasse4+";";
  Connection conn26 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt26 = conn26.createStatement(); 
     ResultSet rs26 = stmt26.executeQuery(QUERY26);
     while (rs26.next()) {
      knavn4= rs26.getString("klassenavn");
    }
    conn26.close();
  }
  catch(Exception e){
    println(e);  
  }
  }if (klasseAntal >= femplusside){
  try {
  String QUERY22 = "SELECT klasseID FROM klasse WHERE underviserID ORDER BY ID = "+maxID+" DESC LIMIT (1,"+femplusside+");";
  Connection conn22 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt22 = conn22.createStatement(); 
     ResultSet rs22 = stmt22.executeQuery(QUERY22);
     while (rs22.next()) {
      klasse5 = ((int)rs22.getInt("karakterVis"));
    }
    conn22.close();
  }
  catch(Exception e){
    println(e);  
  }
       try {
  String QUERY27 = "SELECT klassenavn FROM klasse WHERE klasseID = "+klasse5+";";
  Connection conn27 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt27 = conn27.createStatement(); 
     ResultSet rs27 = stmt27.executeQuery(QUERY27);
     while (rs27.next()) {
      knavn5= rs27.getString("klassenavn");
    }
    conn27.close();
  }
  catch(Exception e){
    println(e);  
  }
  }
}
