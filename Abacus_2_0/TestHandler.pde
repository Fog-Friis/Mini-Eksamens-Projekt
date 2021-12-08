String[] opgavetekstData = new String[25];
String[] opgaveSvar1Data = new String[25];
String[] opgaveSvar2Data = new String[25];
String[] opgaveSvar3Data = new String[25];
String[] opgaveSvar4Data = new String[25];
java.sql.Statement Tstmt, Tstmt2, Tstmt3, Tstmt4, Tstmt5, Tstmt6, Tstmt7, Tstmt8, Tstmt9, Tstmt10;
ResultSet Trs, Trs2, Trs3, Trs4, Trs5, Trs6, Trs7, Trs8, Trs9, Trs10;
Connection Tconn, Tconn2, Tconn3, Tconn4, Tconn5, Tconn6, Tconn7, Tconn8, Tconn9, Tconn10; 
String TQUERY, TQUERY2, TQUERY3, TQUERY4, TQUERY5, TQUERY6, TQUERY7, TQUERY8, TQUERY9, TQUERY10;


void hentOpgave() {
  switch(currentopgave) {

  case 1:

    break;

  case 2:

    break;

  case 3:

    break;

  case 4:

    break;

  case 5:

    break;

  case 6:

    break;

  case 7:

    break;

  case 8:

    break;

  case 9:

    break;

  case 10:

    break;

  case 11:

    break;

  case 12:

    break;

  case 13:

    break;

  case 14:

    break;

  case 15:

    break;

  case 16:

    break;

  case 17:

    break;

  case 18:

    break;

  case 19:

    break;

  case 20:

    break;

  case 21:

    break;

  case 22:

    break;

  case 23:

    break;

  case 24:

    break;

  case 25:

    break;
  default:

    break;

    if (underviserlogin == true) {
      String QUERY = "SELECT password FROM underviser WHERE brugernavn = '"+usernameInput+"';";
    } else {
      String QUERY = "SELECT password FROM elev WHERE brugernavn = '"+usernameInput+"';";
    }

    try {
      //   usernameInput = //Her skal navnen af textboxen være


      Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt = conn.createStatement();
      ResultSet rs = stmt.executeQuery(QUERY);

      while (rs.next()) {
        test = rs.getString("password"); 
        if (test.equals(hashedPassword) == true) {
          //Skift gamestate
        } else {

          //   System.out.print(hashedPassword+"=");
          //   System.out.print(test);
          System.out.print("password don't match");
        }
      }
      conn.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
}
