import java.sql.*;
boolean underviserlogin = false;
String USER = "root";
  String PASS = "";
  String DB_URL = "jdbc:mysql://localhost:3306/mep";
int lokalunderviserID;
class DataBaseHandler{

  java.sql.Statement stmt, stmt2, stmt3, stmt4, stmt5, stmt6, stmt7, stmt8, stmt9, stmt10;
  ResultSet rs, rs2, rs3, rs4, rs5, rs6, rs7, rs8, rs9, rs10;
  Connection conn, conn2, conn3, conn4, conn5, conn6, conn7, conn8, conn9, conn10; 
  
  String test;
  String hashedPassword = "testpassword";
  int maxID = 0;
  int maxID2 = -1;
  String usernameInput, passwordInput;

  String QUERY, QUERY2, QUERY3, QUERY4, QUERY5, QUERY6, QUERY7, QUERY8, QUERY9, QUERY10;
  String result;
void loginCheck(){
  
      try{
      
      hashedPassword = outputString;
   //   usernameInput = //Her skal navnen af textboxen være
       if (underviserlogin == true){
       String QUERY = "SELECT password FROM underviser WHERE brugernavn = '"+usernameInput+"';";
       }
       else{
       String QUERY = "SELECT password FROM elev WHERE brugernavn = '"+usernameInput+"';";
       }
       
      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(QUERY);

      while (rs.next()) {
          test = rs.getString("password"); 
        if (test.equals(hashedPassword) == true){
          //Skift gamestate     
          }
        else{
            
       //   System.out.print(hashedPassword+"=");
       //   System.out.print(test);
             System.out.print("password don't match");
        }
              
      }
      conn.close();
    }
    catch(Exception e){
      println(e);  
    }

    if (underviserlogin == true){
       try{
       String QUERY8 = "SELECT lokalunderviserID FROM underviser WHERE brugernavn = "+usernameInput+";";
       
       
      Connection conn8 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt8 = conn8.createStatement();
      ResultSet rs8 = stmt8.executeQuery(QUERY8);

      while (rs8.next()) {
          lokalunderviserID = rs8.getInt("lokalunderviserID"); 

        }
      conn8.close();
       }
       catch(Exception e){
      println(e);  
    }
    }
}
    

   

  
  
  void register(){
  try{
    
    if (underviserlogin == true){
       String QUERY2 = "SELECT underviserID, MAX(underviserID) FROM underviser GROUP BY underviserID";
       }
       else{
       String QUERY2 = "SELECT elevID, MAX(elevID) FROM elev GROUP BY elevID";
       }
      
     Connection conn2 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt2 = conn2.createStatement(); 
     ResultSet rs2 = stmt2.executeQuery(QUERY2);
     
     while (rs2.next()) {
     maxID = ((int)rs2.getInt("ID"));
     maxID2 = maxID+1;
     
     
      
     
    }
    conn2.close();
  }
  
 
  catch(Exception e){
    println(e);  
  }   
  
   try {
     hashedPassword = outputString;
     if (underviserlogin == true){
    //   String QUERY3 = ("INSERT INTO underviser (underviserID, brugernavn, password) VALUES ('"+maxID2+"', '"+textFraUsernametextbox+"', '"+hashedPassword+"');");
       }
       else{
    //    String QUERY3 = ("INSERT INTO elev (elevID, brugernavn, password) VALUES ('"+maxID2+"', '"+textFraUsernametextbox+"', '"+hashedPassword+"');");
       }
     
      Connection conn3 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt3 = conn3.createStatement();
      stmt3.executeUpdate(QUERY3);
    conn3.close();
       
}
catch(Exception e){
    println(e);      
  }  

  try{
    
      if (underviserlogin == true){
      String QUERY4 = "SELECT underviserID, MAX(underviserID) FROM underviser GROUP BY underviserID";
       }
       else{
       String QUERY4 = "SELECT elevID, MAX(elevID) FROM elev GROUP BY elevID";
       }
     Connection conn4 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt4 = conn4.createStatement(); 
     ResultSet rs4 = stmt4.executeQuery(QUERY4);
     
     while (rs4.next()) {
     maxID2 = ((int)rs4.getInt("ID"));
         
        
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
//It works

}
  }


void opretKlasse(){
result = "";
for (int i = 0; i <= 3; i++) {
   result += char (int(random (65, 65+24)));
}
for (int i = 0; i <= 1; i++) {
  result +=(int(random (10)));
}
     try{
     String QUERY5 = "SELECT klasseID, MAX(klasseID) FROM klasse GROUP BY klasseID";
       
      
     Connection conn5 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt5 = conn5.createStatement(); 
     ResultSet rs5 = stmt5.executeQuery(QUERY5);
     
     while (rs5.next()) {
     maxID = ((int)rs5.getInt("ID"));
     maxID2 = maxID+1;
       result += maxID;
     
    }
    conn5.close();
}
  
 
  catch(Exception e){
    println(e);  
  }   

   try {


   //  String QUERY6 = ("INSERT INTO klasse (klasseID, klassenavn, aargang, underviserID) VALUES ("+maxID2+", "+textFraUsernametextbox+", "+textboxaargang+", "+lokalunderviserID+");");
     
      Connection conn6 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt6 = conn6.createStatement();
      stmt6.executeUpdate(QUERY6);
      conn6.close();
       
}
catch(Exception e){
    println(e);      
  }  

  try{
    

      String QUERY7 = "SELECT klasseID, MAX(klasseID) FROM klasse GROUP BY klasseID";

     Connection conn7 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt7 = conn7.createStatement(); 
     ResultSet rs7 = stmt7.executeQuery(QUERY7);
     
     while (rs7.next()) {
     maxID2 = ((int)rs7.getInt("ID"));
         
        
    }
    conn7.close();
  }
  
 
  catch(Exception e){
    println(e);  
  } 
if (maxID2 == maxID){
    println("klasse med samme navn");
}
else{
//It works
println("klasse oprettet");
}

}
}
