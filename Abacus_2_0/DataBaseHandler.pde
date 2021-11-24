import java.sql.*;

class DataBaseHandler{

  java.sql.Statement stmt, stmt2, stmt3, stmt4;
  ResultSet rs, rs2, rs3, rs4;
  Connection conn, conn2, conn3, conn4; 
  String USER = "root";
  String PASS = "";
  String DB_URL = "jdbc:mysql://localhost:3306/mep";
  String test;
  String hashedPassword = "testpassword";
  int maxID = 0;
  int maxID2 = -1;
  String usernameInput, passwordInput;
  boolean underviserlogin = false;
  String QUERY, QUERY2, QUERY3, QUERY4;
  
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
     //  String QUERY3 = ("INSERT INTO underviser (underviserID, brugernavn, password) VALUES ('"+maxID2+"', '"+//textFraUsernametextbox+"', '"+hashedPassword+"');");
       }
       else{
      //  String QUERY3 = ("INSERT INTO elev (elevID, brugernavn, password) VALUES ('"+maxID2+"', '"+//textFraUsernametextbox+"', '"+hashedPassword+"');");
       }
//      
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
  //Der er ikke blevet oprettet en ny bruger
}
else{
//It works

}

  }
}
