import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.sql.*; 
import java.security.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Abacus_2_0 extends PApplet {

Game1 game1;

public void setup() {
  
  game1 = new Game1();
  game1.initiate();
}

public void keyPressed() {
  game1.pressKey();
}

public void keyReleased() {
  game1.releaseKey();
}

public void mousePressed() {
  game1.pressMouse();
}

/*void mouseWheel(MouseEvent e){
 for (DropdownMenu d : dropdownMenus) {
 if (d.objects.size() > d.shownObjects-1 && d.overObjects() == true) {
 d.scroll = e.getCount();
 }
 }
 }*/

public void mouseReleased() {
  game1.releaseMouse();
}

public void draw() {
  background(255);
     if (update == true && previousTime <= 0){
       previousTime = minute();
    previousTime -= 1;
      tjekSvar();
      gamestate = 8;
      update = false;
      
     }
  game1.display();
}
class Button {

  //buttons position and size
  float scroll;
  PVector pos;
  PVector size;

  //colors
  int col, overCol, pressedCol;

  //radius of circles
  float radius;

  //boxes positions and size
  PVector box1size, box1pos, box2size, box2pos;
  PVector circle1pos, circle2pos, circle3pos, circle4pos;

  //visibility
  int visible;

  //if button is clicked
  boolean clicked;

  //text and textsize
  String Text;
  float textSize;

  //Constructor
  Button(PVector p, PVector s, float r, int col, int ocol, int pcol, String Text, float textSize, int visible) {

    this.pos = p;
    this.size = s;
    this.radius = r;
    this.col = col;
    this.overCol = ocol;
    this.pressedCol = pcol;
    this.Text = Text;
    this.textSize = textSize;
    this.visible = visible;


    box1pos = new PVector(pos.x, pos.y-radius/2);
    box2pos = new PVector(pos.x-radius/2, pos.y);

    box1size = new PVector(size.x, size.y+radius);
    box2size = new PVector(size.x+radius, size.y);

    circle1pos = new PVector(pos.x, pos.y);
    circle2pos = new PVector(pos.x+size.x, pos.y);
    circle3pos = new PVector(pos.x+size.x, pos.y+size.y);
    circle4pos = new PVector(pos.x, pos.y+size.y);
  }

  //check if mouse is over button
  public boolean over() {
    if ((mouseX <= box1pos.x+box1size.x && mouseX >= box1pos.x && mouseY <= box1pos.y+box1size.y+scroll && mouseY >= box1pos.y+scroll) ||
      (mouseX <= box2pos.x+box2size.x && mouseX >= box2pos.x && mouseY <= box2pos.y+box2size.y+scroll && mouseY >= box2pos.y+scroll) ||
      (dist(mouseX, mouseY-scroll, circle1pos.x, circle1pos.y)<radius/2) ||
      (dist(mouseX, mouseY-scroll, circle2pos.x, circle2pos.y)<radius/2) ||
      (dist(mouseX, mouseY-scroll, circle3pos.x, circle3pos.y)<radius/2) ||
      (dist(mouseX, mouseY-scroll, circle4pos.x, circle4pos.y)<radius/2)) {
      return true;
    } else {
      return false;
    }
  }

  //check if mouse was pressed
  public void pressed() {
    if (over()) {
      clicked = true;
    }
  }
  
  public void released(){
    clicked = false;
  }

  //draw and run the button
  public void display() {

    pushMatrix();
    translate(0, scroll);    

    if (visible == gamestate) {
      noStroke();

      if (clicked) {
        fill(pressedCol);
        clicked=false;
      } else if (over()) {
        fill(overCol);
      } else {
        fill(col);
      }

      //rectangles
      rect(box1pos.x, box1pos.y, box1size.x, box1size.y);
      rect(box2pos.x, box2pos.y, box2size.x, box2size.y);

      //rounded corners
      circle(circle1pos.x, circle1pos.y, radius);
      circle(circle2pos.x, circle2pos.y, radius);
      circle(circle3pos.x, circle3pos.y, radius);
      circle(circle4pos.x, circle4pos.y, radius);

      textAlign(CENTER);
      fill(0, 0, 0);
      textSize(textSize);
      text(Text, pos.x+size.x/2, pos.y+2*textSize/3);
      textAlign(CORNER);
    }
    translate(0, 0);
    popMatrix();
  }
}

boolean underviserlogin = false;
String USER = "root";
  String PASS = "";
  String DB_URL = "jdbc:mysql://localhost:3306/mep";
int lokalunderviserID, klasse1, klasse2, klasse3, klasse4, klasse5, LokalklasseAntal;
String knavn1, knavn2, knavn3, knavn4, knavn5;

  java.sql.Statement stmt, stmt2, stmt3, stmt4, stmt5, stmt6, stmt7, stmt8, stmt9, stmt10, stmt11;
  ResultSet rs, rs2, rs3, rs4, rs5, rs6, rs7, rs8, rs9, rs10, rs11;
  Connection conn, conn2, conn3, conn4, conn5, conn6, conn7, conn8, conn9, conn10, conn11; 
  
  String test, klassenavn;
  String hashedPassword = "testpassword";
  int maxID = 0, maxID2 = -1;
  int klasseAntal, elevAntal;
  String usernameInput, passwordInput;

  String QUERY, QUERY2, QUERY3, QUERY4, QUERY5, QUERY6, QUERY7, QUERY8, QUERY9, QUERY10, QUERY11;
  String result;
public void elevLoginCheck(){
  
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
         gamestate=5;  
          }
        else{
            
        }
              
      }
      conn.close();
    }
    catch(Exception e){
      println(e);  
    }
}

public void underviserLoginCheck(){
    
  try{    
    lokalbrugernavn = UlogUserTB.Text;
      hashedPassword = outputString;
       String QUERY8 = "SELECT password FROM underviser WHERE brugernavn = '"+ lokalbrugernavn +"';";
      Connection conn8 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt8 = conn8.createStatement();
      ResultSet rs8 = stmt8.executeQuery(QUERY8);

      while (rs8.next()) {
          test = rs8.getString("password"); 
        if (test.equals(hashedPassword) == true){
          gamestate=6;     
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
    
  public void elevRegister(){
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
     
     String QUERY15 = ("UPDATE klasse SET elevID"+ elevAntal+" = ( "+maxID2+");");
      Connection conn15 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt15 = conn15.createStatement();
      stmt15.executeUpdate(QUERY15);
    conn15.close();
}
catch(Exception e){
    println(e);      
  }  

}



public void underviserRegister(){
  lokalbrugernavn = regUserLaererTB.Text; 
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
     String QUERY10 = ("INSERT INTO underviser (underviserID, brugernavn, password, skole, klasseAntal ) VALUES ("+maxID2+", '"+lokalbrugernavn+"', '"+hashedPassword+"','"+skole+"', "+0+");");    
   
      Connection conn10 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt10 = conn10.createStatement();
      stmt10.executeUpdate(QUERY10);
    conn10.close();
       gamestate = 6;
}
catch(Exception e){
    println(e);      
  }  
}



public void opretKlasse(){
result = "";

for (int i = 0; i <= 6; i++) {
  result +=(PApplet.parseInt(random (10)));
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
     String QUERY6 = ("INSERT INTO klasse (klasseID, klassenavn, underviserID, skole) VALUES ("+result+", '"+klassenavn+"', "+maxID+", '"+skole+"');");
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
      stmt7.executeQuery(QUERY7);
       while (rs7.next()) {
     klasseAntal = ((int)rs7.getInt("klasseAntal"));
     
      }
      conn7.close();
     
}
catch(Exception e){
    println(e);      
  } 
  try {
     String QUERY12 = "UPDATE underviser SET klasseAntal = "+LokalklasseAntal+"  WHERE brugernavn = '"+lokalbrugernavn+"';";
      Connection conn12 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement stmt12 = conn12.createStatement();
      stmt12.executeUpdate(QUERY12);
      conn12.close();
}
catch(Exception e){
    println(e);      
  } 
  
}

public void findKlasse(){
 
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
  

}
public void findKlasseUpdate(){
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
class DropdownMenu {

  //position and size
  PVector pos;
  PVector size;
  float scroll;

  //text and textsize
  String Text;
  int textSize;

  //color
  int col;

  //visibility
  int visible;

  //flip arrow
  int scale = 1;
  float theta = PI/4;

  //if dropdownmenu has been clicked
  boolean clicked = false;

  //dropdownmenus list of objects
  ArrayList<dropdownObject> objects;

  //constructor
  DropdownMenu(PVector pos, PVector size, String Text, int textSize, int col, int visible, ArrayList<dropdownObject> objects) {
    this.pos = pos;
    this.size = size;
    this.Text = Text;
    this.textSize = textSize;
    this.col = col;
    this.visible = visible;
    this.objects = objects;
  }

  //check if mouse is over dropdownmenu
  public boolean over() {
    if (mouseX <= pos.x+size.x && mouseX >= pos.x && mouseY <= pos.y+size.y+scroll && mouseY >= pos.y+scroll) {
      return true;
    } else {
      return false;
    }
  }

  //check if mouse is over dropdownmenus list of objects
  public boolean overObjects() {
    if (mouseX <= pos.x+size.x && mouseX >= pos.x && mouseY <= pos.y+size.y+size.y*objects.size()+scroll && mouseY >= pos.y+size.y+scroll) {
      return true;
    } else {
      return false;
    }
  }

  //check if mouse has been pressed
  public void pressed() {
    if (over()) {
      clicked = !clicked;
    }
  }

  //display dropdown menu
  public void display() {

    pushMatrix();
    translate(0, scroll);
    //update dropdown menu
    if (clicked) {
      for (dropdownObject d : objects) d.visible = true;
      scale = 1;
    } else {
      for (dropdownObject d : objects) d.visible = false;
      scale = -1;
    }

    //draw dropdown menu
    if (visible == gamestate) { 

      for (dropdownObject d : objects) {
        d.scroll = scroll;
        d.display();

        if (d.visible) {
          fill(0);
          textAlign(CORNER);
          textSize(d.size.y/2);
          text(d.Text, d.loc.x, d.loc.y+(d.number+1)*size.y-size.y/2);
        }
      }

      fill(col);

      rect(pos.x, pos.y, size.x, size.y);           

      fill(0);

      textAlign(CORNER);
      textSize(textSize);
      text(Text, pos.x+10, pos.y+size.y/2+5);
      //draw dropdown menus arrow
      pushMatrix();
      translate(pos.x+size.x-30, pos.y + size.y - size.y/2);
      rotate(PI);
      scale(scale);
      triangle(-10, -5, 10, -5, 0, 5);
      fill(col);
      noStroke();
      triangle(-10, -10, 10, -10, 0, 0);
      stroke(0);
      translate(0, 0);
      popMatrix();
      fill(255);
    }
    translate(0, 0);
    popMatrix();
  }
}

//dropdown menus object in list of objects
class dropdownObject {

  //location and size
  PVector loc;
  PVector size;
  float scroll;

  //text
  String Text;

  //number in list
  int number;

  //visibility (wether dropdownmenu has been pressed)
  boolean visible;

  //if mouse has been pressed
  boolean clicked;

  //constructor
  dropdownObject(PVector loc, PVector size, String Text, int number, boolean visible) {
    this.Text = Text;
    this.loc = loc;
    this.size = size;
    this.number = number;
    this.visible = visible;
  }

  //check if mouse is over object
  public boolean over() {
    if (mouseX <= loc.x+size.x && mouseX >= loc.x && mouseY <= loc.y+(number+1)*size.y+scroll && mouseY >= loc.y+number*size.y+scroll) {
      return true;
    } else {
      return false;
    }
  }

  //check if mouse has been pressed
  public void pressed() {
    if (over()) {
      clicked = true;
    }    
  }
  //check if mouse has been released
  public void released() {
    clicked = false;
  }

  //display object
  public void display() {

    if (visible) {

      if (clicked) {
        fill(150, 150, 150);
      } else if (over()) {
        fill(230, 230, 230);
      } else {
        fill(200, 200, 200);
      }
      rect(loc.x, (number)*size.y+loc.y, size.x, size.y);
      fill(255);
    }
  }
}
  int errorType;

class ErrorHandler {
  
  String errorText = "";
  
  public void loginUpdate(){
    
    if(logUserTB.TextLength == 0){
      errorType = 1;
    } else if (logPasswordTB.TextLength == 0) {  
      errorType = 2;      
    } else {
      errorType = 0;

    }
  }
  
  public void registerUpdate(){
    if (regUserLaererTB.TextLength == 0) {
      errorType = 3;
    } else if (regPasswordLaerer1.TextLength == 0) {
      errorType = 5;
    } else if (regPasswordLaerer2.TextLength == 0) {
      errorType = 6;
    } else if(regPasswordLaerer1.Text.equals(regPasswordLaerer2.Text) == false){
      
      errorType = 7;
    } else {
      hashing (regPasswordLaerer1.Text);
      errorType = 0;
      underviserRegister();
    }
  }

  public void display() {

    switch (errorType) {
    case 0:
    errorText = "";
      break;

    case 1:
    errorText = "Error, please type username.";
      break;

    case 2:
    errorText = "Error, please type password.";
      break;

    case 3:
    errorText = "Error, please type username.";
      break;

    case 4:
    errorText = "Error, please type email.";
      break;

    case 5:
    errorText = "Error, please type password.";
      break;

    case 6:
    errorText = "Error, please confirm password.";
      break;
      
    case 7:
    errorText = "Error, passwords don't match";
      break;

    default:
      errorType = 0;
      break;
    }
    
    fill(255, 0, 0);
    text(errorText, width / 4, 9 * height / 10);
    fill(0, 0, 0);
  }
}
GameStateManager gamestateManager;
ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();
ArrayList<Button> buttons = new ArrayList<Button>();
ArrayList<DropdownMenu> dropdownMenus = new ArrayList<DropdownMenu>();
boolean enter;
ErrorHandler errorHandler;

class Game1 {

  public void initiate() {
    gamestateManager = new GameStateManager();
    gamestateManager.setupManager();
    errorHandler = new ErrorHandler();
  }

  public void pressKey() {
    for (TextBox t : textBoxes) {
      if (t.keyWasTyped(key, (int)keyCode)) {
      }
    }

    if (key == ENTER) {
      enter = true;
    }
  }

  public void releaseKey() {

    if (key == ENTER) {
      enter = false;
    }
  }

  public void display() {    
    gamestateManager.manage();
    sb1.run();
    sb2.run();
    sb3.run();
    sb4.run();


    for (TextBox t : textBoxes) {
      if (gamestate == 3) t.scroll = -sb1.spos;
      if (gamestate == 6) t.scroll = -sb2.spos;
      if (gamestate == 7) t.scroll = -sb3.spos;
      if (gamestate == 9) t.scroll = -sb4.spos;
      t.display();
    }
    for (Button b : buttons) { 
      if (gamestate == 3) b.scroll = -sb1.spos;
      if (gamestate == 6) b.scroll = -sb2.spos;
      if (gamestate == 7) b.scroll = -sb3.spos;
      if (gamestate == 9) b.scroll = -sb4.spos;
      b.display();
    }
    for (DropdownMenu d : dropdownMenus) { 
      if (gamestate == 3) d.scroll = -sb1.spos;
      if (gamestate == 6) d.scroll = -sb2.spos;
      if (gamestate == 7) d.scroll = -sb3.spos;
      if (gamestate == 9) d.scroll = -sb4.spos;
      d.display();
    }
    fill(255);
    errorHandler.display();
  }

  public void pressMouse() {    
    for (TextBox t : textBoxes) t.pressed(mouseX, mouseY);

    for (DropdownMenu d : dropdownMenus) {
      d.pressed();
      for (dropdownObject o : d.objects) o.pressed();
    }
    for (Button b : buttons) b.pressed();
  }

  public void releaseMouse() {

    for (DropdownMenu d : dropdownMenus) {
      for (dropdownObject o : d.objects) o.released();
    }
    
    for (Button b : buttons)b.released();
  }
}
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

  public void setupManager() {

    //setup scroll bars
    sb1 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 3);
    sb2 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 400, 6);    
    sb3 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 7);
    sb4 = new Scrollbar(new PVector(width-20, 0), new PVector(width, height), 100, 9);

    norm = createFont("Arial", 18);
    Comic = createFont("Comic Sans MS", 18);

    //setup login screen
    logUserTB = new TextBox(new PVector(width/2-200, height/3.2f), new PVector(400, 70), false, 0);
    logPasswordTB = new TextBox(new PVector(width/2-200, height/2.4f), new PVector(400, 70), false, 0);

    textBoxes.add(logUserTB);
    textBoxes.add(logPasswordTB);

    loginBut = new Button(new PVector(width/2 + 30, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Login", 50, 0);
    registerScreenBut = new Button(new PVector(width/2 - 180, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 40, 0);
    laererLoginBut = new Button(new PVector(width/2-180, height/2+120), new PVector(365, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Lærer-login", 50, 0);

    buttons.add(laererLoginBut);
    buttons.add(loginBut);
    buttons.add(registerScreenBut);

    UlogUserTB = new TextBox(new PVector(width/2-200, height/3.2f), new PVector(400, 70), false, 1);
    UlogPasswordTB = new TextBox(new PVector(width/2-200, height/2.4f), new PVector(400, 70), false, 1);

    textBoxes.add(UlogUserTB);
    textBoxes.add(UlogPasswordTB);

    loginBut = new Button(new PVector(width/2 + 30, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Login", 50, 1);
    registerScreenBut = new Button(new PVector(width/2 - 180, height / 2 + 20), new PVector(155, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Registrer", 40, 1);
    elevLoginBut = new Button(new PVector(width/2-180, height/2+120), new PVector(365, 40), 40, color(0, 0, 255), color(0, 0, 180), color(200, 200, 255), "Elev-login", 50, 1);

    buttons.add(elevLoginBut);
    buttons.add(loginBut);
    buttons.add(registerScreenBut);

    ElevRegisterBut = new Button(new PVector(width/2.72f+40, height/3.2f+30), new PVector(180, 340), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Elev", 50, 2);
    LaererRegisterBut = new Button(new PVector(width/2+40, height/3.2f+30), new PVector(180, 340), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Lærer", 50, 2);
    TilbageBut = new Button(new PVector(width/2.72f+40, height/1.45f+30), new PVector(425, 40), 40, color(100), color(120, 120, 180), color(200, 200, 255), "Tilbage", 50, 2);

    buttons.add(ElevRegisterBut);
    buttons.add(LaererRegisterBut);
    buttons.add(TilbageBut);

    //setup choose register screen

    regUserElevTB = new TextBox(new PVector(width/2-200, height/3.7f+20), new PVector(400, 70), false, 4);
    regPasswordElevTB = new TextBox(new PVector(width/2-200, height/3.7f+150), new PVector(400, 70), false, 4);
    regVerifikationElevTB = new TextBox(new PVector(width/2-200, height/3.7f+280), new PVector(400, 70), false, 4);

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
    regUserLaererTB = new TextBox(new PVector(width/2-200, height/3.7f), new PVector(400, 70), false, 3);
    regPasswordLaerer1 = new TextBox(new PVector(width/2-200, height/3.7f+110), new PVector(400, 70), false, 3);
    regPasswordLaerer2 = new TextBox(new PVector(width/2-200, height/3.7f+220), new PVector(400, 70), false, 3);
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
    resultaterElevBut = new Button(new PVector(width-width/3.4f, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 5);
    Test1But = new Button(new PVector(width-500, height/3), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Test", 24, 5);
    
    buttons.add(Test1But);
    buttons.add(logoutBut);
    buttons.add(resultaterElevBut);
    //Teacher menu
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 6);
    resultaterLaererBut = new Button(new PVector(width-width/3.4f, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 6);
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
    resultaterLaererBut2 = new Button(new PVector(width-width/3.4f, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Resultater", 24, 7);

    buttons.add(logoutBut);
    buttons.add(resultaterLaererBut2);

    //setup tests screen
    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 8);
    proeverElevBut = new Button(new PVector(width-width/3.4f, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 8);

    buttons.add(logoutBut);
    buttons.add(proeverElevBut);

    logoutBut = new Button(new PVector(width-width/7, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Log ud", 24, 9);
    proeverLaererBut = new Button(new PVector(width-width/3.4f/*-120*/, height / 27), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Prøver", 24, 9);

    buttons.add(logoutBut);
    buttons.add(proeverLaererBut);

    //Testscreen
    opgaveFremBut= new Button(new PVector(width-width/7, height - 900), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Frem", 24, 10);
    opgaveTilbageBut = new Button(new PVector(width-width/1.1f, height - 900), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Tilbage", 24, 10);
    opgaveSlutBut = new Button(new PVector(width-100, height - 1050), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "Opgaveslut", 24, 10);
    svar1But = new Button(new PVector(width-width/3.f, height - 750), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar1", 24, 10);
    svar2But = new Button(new PVector(width-width/3.f, height - 600), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar2", 24, 10);
    svar3But = new Button(new PVector(width-width/3.f, height - 450), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar3", 24, 10);
    svar4But = new Button(new PVector(width-width/3.f, height - 300), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "svar4", 24, 10);

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
    nameTB = new TextBox(new PVector(width/2-180, height/6.8f+60), new PVector(600, 70), false, 20);
    annullerBut = new Button(new PVector(width/4-180, height/4.5f), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "annuller", 24, 20);
    gemBut = new Button(new PVector(width-width/4+100, height/4.5f), new PVector(80, 20), 40, color(150, 150, 200), color(120, 120, 180), color(200, 200, 255), "gem", 24, 20);
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

  public void manage() {

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

  public void LoginElevScreen() {
    fill(240);
    stroke(6);
    strokeWeight(2);
    rect(width/2.8f, height/5, 550, 600);
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
    text("Brugernavn", width/2-200, height/3.2f-10);
    text("Adgangskode", width/2-200, height/2.4f-10);
    textSize(48);
    text("Elev-login", width/2.205f, height/4);
  }

  public void LoginLaererScreen() {
    fill(240);
    stroke(6);
    strokeWeight(2);
    rect(width/2.8f, height/5, 550, 600);
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
    text("Brugernavn", width/2-200, height/3.2f-10);
    text("Adgangskode", width/2-200, height/2.4f-10);
    textSize(48);
    text("Lærer-login", width/2-130, height/4);
  }

  public void ChooseRegister() {
    fill(240);
    stroke(6);
    rect(width/2.8f, height/6.8f, 550, 700);
    fill(0);
    textSize(24);
    text("Hvilken bruger vil du gerne registreres som?", width/2.73f, height/5.6f, 550, 500);
    fill(100);
    textSize(23);
    text("Er du lærer eller elev?", width/2.265f, height/4.2f, 550, 500);
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

  public void RegisterScreenStudent() {
    fill(240);
    stroke(6);
    rect(width/2.8f, height/6.8f, 550, 700);

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
    text("Brugernavn", width/2-200, height/3.7f+10);
    text("Adgangskode", width/2-200, height/3.7f+140);
    text("Uni-login", width/2-200, height/3.7f-22);
    text("Klassekode", width/2-200, height/3.7f+270);
    textSize(48);
    text("Registrer elev  ", width/2.37f, height/5.3f);
  }

  public void RegisterScreenTeacher() {
    pushMatrix();
    translate(0, -sb1.spos);
    fill(240);
    stroke(6);
    rect(width/2.8f, height/6.8f, 550, 770);

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
    text("Brugernavn", width/2-200, height/3.7f-10);
    text("Adgangskode", width/2-200, height/3.7f+100);
    text("Gentag adgangskode", width/2-200, height/3.7f+210);
   // text("Lære-ID", width/2-200, height/3.7+400);
    textSize(48);
    text("Registrer lærer", width/2.37f, height/5.3f);
    translate(0, 0);
    popMatrix();
  }

  public void StudentProeveMenu() {
    textFont(Comic);
    text("ELEV", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Prøver:", width/9.8f, height/4.7f, 999, 999);
    text("Status:", width-width/3.84f, height/4.7f, 999, 999);
    rect(0, height/3.6f, width, 2);
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

  public void hideTBs() {
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
  public void TeacherProeveMenu() {
    pushMatrix();
    translate(0, -sb2.spos);
    textFont(Comic);
    text("LÆRER", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Prøver:", width/9.8f, height/4.7f, 999, 999);
    text("Status:", width-width/3.84f, height/4.7f, 999, 999);
    rect(0, height/3.6f, width, 2);
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
  public void OpretProeve() {

    if (powerBut.clicked) {
      opgaveTB[valgtOpgave-1].addText('^');
    }

    if (annullerBut.visible == gamestate && annullerBut.clicked) {
      showButs = false;
      
    }

    stroke(0);
    fill(240);
    rect(200, height/5.5f, width-400, 800);
    fill(0);
    textSize(36);
    text("Navn:", width/2-280, height/6.8f+60, 999, 100);

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
        text(o.Text + ":", width/2-300, height/3.5f, 999, 100);
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

    int marked = color(0, 200, 50);
    int unmarked = color(150, 150, 200);

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

  public void TeacherUddelProeveMenu() {

    pushMatrix();
    translate(0, -sb3.spos);    
    textFont(Comic);
    text("LÆRER", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Prøver:", width/9.8f, height/4.7f, 999, 999);
    text("Status:", width-width/3.84f, height/4.7f, 999, 999);
    rect(0, height/3.6f, width, 2);
    if (logoutBut.clicked) {
      gamestate = 0;
    }
    if (resultaterLaererBut2.clicked) {
      gamestate = 9;
    }
    stroke(0);
    fill(240);
    rect(width/2-400, height/5.5f, 800, 800);
    fill(0);
    textSize(38);
    text("Uddel opgavesæt", width/2-140, height/6.8f+60, 999, 100);
    translate(0, 0);
    popMatrix();
  }


  public void StudentResultatMenu() {
    textFont(Comic);
    text("ELEV", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Resultater:", width/9.8f, height/4.7f, 999, 999);
    text("Karakter:", width-width/3.84f, height/4.7f, 999, 999);
    rect(0, height/3.6f, width, 2);
    
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
    text(karakter, width-width/3.84f, height/3, 999, 999);
    text(rigtigesvar+" ud af "+maxopgaver, width/9.8f, height/3, 999, 999);
    if (logoutBut.clicked) {
      gamestate = 0;
    }
    if (proeverElevBut.clicked) {
      gamestate = 5;
    }
  }
  public void TeacherResultatMenu() {
    pushMatrix();
    translate(0, -sb4.spos);
    textFont(Comic);
    text("LÆRER", 10, 10, 99, 99);
    textFont(norm);
    textSize(48);
    fill(0);
    rect(0, height/12, width, height/27);
    text("Resultater:", width/9.8f, height/4.7f, 999, 999);
    text("Besvaret:", width-width/3.84f, height/4.7f, 999, 999);
    rect(0, height/3.6f, width, 2);
    if (logoutBut.clicked == true) {
      gamestate = 0;
    }
    if (proeverLaererBut.clicked == true) {
      gamestate = 6;
    }
    translate(0, 0);
    popMatrix();
  }
  public void setupTekst() {
    for (int i = 0; i <= 24; i++)
    {
      opgavetekst[i] = "IkkeLoadet";
      elevSvarNR[i] = 0;
    }
  }
  public void updatetest() {
    currentSvar1Tekst =opgaveSvar1[currentopgave-1];
    currentSvar2Tekst =opgaveSvar2[currentopgave-1];
    currentSvar3Tekst =opgaveSvar3[currentopgave-1];
    currentSvar4Tekst =opgaveSvar4[currentopgave-1];
    currentOpgaveTekst =opgavetekst[currentopgave-1];
  }
  public void testscreen() {
        
    background(255);
    
    text(currentopgave+": "+currentOpgaveTekst, width/9.8f, height/3.7f, 999, 999);
    text(opgaveSvar1[currentopgave-1], width/1.3f, height/3.4f, 999, 999);
    text(opgaveSvar2[currentopgave-1], width/1.3f, height/2.3f, 999, 999);
    text(opgaveSvar3[currentopgave-1], width/1.3f, height/1.75f, 999, 999);
    text(opgaveSvar4[currentopgave-1], width/1.3f, height/1.4f, 999, 999);
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

    int marked = color(0, 200, 50);
    int unmarked = color(150, 150, 200);

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
  public void loadingScreen() {
    rad = 5*cos(theta/2)+10+20;

    theta += 0.1f;
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

String outputString;

public void hashing(String Text){
  try {
  MessageDigest md = MessageDigest.getInstance("SHA-256"); 
  
  String inputTekst = Text;
    
  md.update(inputTekst.getBytes());    

  byte[] byteList = md.digest();
  
  StringBuffer hashedValueBuffer = new StringBuffer();
  for (byte b : byteList)hashedValueBuffer.append(hex(b)); 
  
  outputString = hashedValueBuffer.toString();
  //println("Den orindelige tekst: "+ inputTekst);
  //println("SHA-256 værdien af teksten: " +hashedValueBuffer);
  
}
catch (Exception e) {
  //System.out.println("Exception: "+e);
}

}
class Spoergsmaal {
}
class Scrollbar {
  //position and size of scrollbar
  PVector pos;
  PVector size;

  //position and size of slider
  float spos;
  float newSpos;
  float sheight;

  //wether the slider is supposed to move or not
  boolean locked;

  //visibility
  int visible;

  //constructor
  Scrollbar(PVector pos, PVector size, float sheight, int visible) {
    this.pos = pos;
    this.size = size;
    this.sheight = sheight;
    this.visible = visible;
    spos = pos.y;
    newSpos = spos;
  }

  //update and display scrollbar
  public void run() {
    update();
    display();
  }

  //update scrollbar
  public void update() {

    if (mousePressed && over()) {
      locked = false;
    }

    if (!mousePressed) {
      locked = true;
    }

    if (!locked) {
        newSpos = constrain(mouseY-sheight/2, pos.y, pos.y+size.y-sheight);
    }

    if (locked && gamestate != visible) {
      newSpos = constrain(pos.y, pos.y, pos.y+size.y);
    }

    if (abs(newSpos-spos)>1) {
      spos += (newSpos-spos);
    }
  }

  //constrain sliders position to a value
  public float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }

  //display scrollbar
  public void display() {
    if (gamestate == visible) {
      noStroke();
      fill(200, 200, 200);
      rect(pos.x, pos.y, size.x, size.y);

      if (over() || !locked) {
        fill(150, 150, 150);
      } else {
        fill(170, 170, 170);
      }
      rect(pos.x, spos, size.x, sheight);
      fill(255);
      stroke(1);
    }
  }

  //check if mouse is over scrollbar
  public boolean over() {
    if (mouseX <= pos.x+size.x && mouseX >= pos.x && mouseY <= pos.y+size.y && mouseY >= pos.y) {
      return true;
    } else {
      return false;
    }
  }
}
String[] opgavetekstData = new String[25];
String[] opgaveSvar1Data = new String[25];
String[] opgaveSvar2Data = new String[25];
String[] opgaveSvar3Data = new String[25];
String[] opgaveSvar4Data = new String[25];
String lokalbrugernavn, opgavenavn, karakter="ingen givet", opgnavn1, opgnavn2, opgnavn3, opgnavn4, opgnavn5;
boolean karaktergivet = false, updateTH = false;
int lokalelevID, lokalklasseID, nyopgaveantal, lokalopgaveantalklasse;
int enplusside=1, toplusside=2, treplusside=3, fireplusside=4, femplusside=5, opgID1, opgID2, opgID3, opgID4, opgID5, open1, open2, open3, open4, open5, opgantal1, opgantal2, opgantal3, opgantal4, opgantal5, rigtigesvar1, rigtigesvar2, rigtigesvar3, rigtigesvar4, rigtigesvar5, karakter1, karakter2, karakter3, karakter4, karakter5;
int previousTime, timeopen;
    
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


public void hentOpgave() {   
  
  if (updateTH == false){
    try {
    String TQUERY0 = "SELECT Tid FROM opgavetabel WHERE opgaveID = "+opgaveID+";"; 
    Connection Tconn0 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmt0 = Tconn0.createStatement();
    ResultSet Trs0 = Tstmt0.executeQuery(TQUERY0);

    while (Trs0.next()) {
     previousTime = Trs0.getInt("Tid");
    }
    Tconn0.close();
  }
  catch(Exception e) {
    println(e);
  }
}
  
  updateTH = true;
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

public void antalOpgaver() {
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


public void tjekSvar() {
  //Problmer viser man bruge connection med samme navn så denne del er meget lang

  if (1 <= maxopgaver) {
    try {
      String rigtigesvarQUERY1 = "SELECT opgave1Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn1 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt1 = rigtigesvarconn1.createStatement();
      ResultSet rigtigesvarrs1 = rigtigesvarstmt1.executeQuery(rigtigesvarQUERY1);


      while (rigtigesvarrs1.next()) {
        if (elevSvarNR[1-1] == rigtigesvarrs1.getInt("opgave1Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn1.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (2 <= maxopgaver) {
    try {
      String rigtigesvarQUERY2 = "SELECT opgave2Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn2 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt2 = rigtigesvarconn2.createStatement();
      ResultSet rigtigesvarrs2 = rigtigesvarstmt2.executeQuery(rigtigesvarQUERY2);


      while (rigtigesvarrs2.next()) {
        if (elevSvarNR[2-1] == rigtigesvarrs2.getInt("opgave2Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn2.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (3 <= maxopgaver) {
    try {
      String rigtigesvarQUERY3 = "SELECT opgave3Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn3 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt3 = rigtigesvarconn3.createStatement();
      ResultSet rigtigesvarrs3 = rigtigesvarstmt3.executeQuery(rigtigesvarQUERY3);


      while (rigtigesvarrs3.next()) {
        if (elevSvarNR[3-1] == rigtigesvarrs3.getInt("opgave3Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn3.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (4 <= maxopgaver) {
    try {
      String rigtigesvarQUERY4 = "SELECT opgave4Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn4 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt4 = rigtigesvarconn4.createStatement();
      ResultSet rigtigesvarrs4 = rigtigesvarstmt4.executeQuery(rigtigesvarQUERY4);


      while (rigtigesvarrs4.next()) {
        if (elevSvarNR[4-1] == rigtigesvarrs4.getInt("opgave4Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn4.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (5 <= maxopgaver) {
    try {
      String rigtigesvarQUERY5 = "SELECT opgave5Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn5 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt5 = rigtigesvarconn5.createStatement();
      ResultSet rigtigesvarrs5 = rigtigesvarstmt5.executeQuery(rigtigesvarQUERY5);


      while (rigtigesvarrs5.next()) {
        if (elevSvarNR[5-1] == rigtigesvarrs5.getInt("opgave5Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn5.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (6 <= maxopgaver) {
    try {
      String rigtigesvarQUERY6 = "SELECT opgave6Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn6 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt6 = rigtigesvarconn6.createStatement();
      ResultSet rigtigesvarrs6 = rigtigesvarstmt6.executeQuery(rigtigesvarQUERY6);


      while (rigtigesvarrs6.next()) {
        if (elevSvarNR[6-1] == rigtigesvarrs6.getInt("opgave6Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn6.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (7 <= maxopgaver) {
    try {
      String rigtigesvarQUERY7 = "SELECT opgave7Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn7 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt7 = rigtigesvarconn7.createStatement();
      ResultSet rigtigesvarrs7 = rigtigesvarstmt7.executeQuery(rigtigesvarQUERY7);


      while (rigtigesvarrs7.next()) {
        if (elevSvarNR[7-1] == rigtigesvarrs7.getInt("opgave7Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn7.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (8 <= maxopgaver) {
    try {
      String rigtigesvarQUERY8 = "SELECT opgave8Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn8 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt8 = rigtigesvarconn8.createStatement();
      ResultSet rigtigesvarrs8 = rigtigesvarstmt8.executeQuery(rigtigesvarQUERY8);


      while (rigtigesvarrs8.next()) {
        if (elevSvarNR[8-1] == rigtigesvarrs8.getInt("opgave8Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn8.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (9 <= maxopgaver) {
    try {
      String rigtigesvarQUERY9 = "SELECT opgave9Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn9 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt9 = rigtigesvarconn9.createStatement();
      ResultSet rigtigesvarrs9 = rigtigesvarstmt9.executeQuery(rigtigesvarQUERY9);


      while (rigtigesvarrs9.next()) {
        if (elevSvarNR[9-1] == rigtigesvarrs9.getInt("opgave9Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn9.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (10 <= maxopgaver) {
    try {
      String rigtigesvarQUERY10 = "SELECT opgave10Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn10 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt10 = rigtigesvarconn10.createStatement();
      ResultSet rigtigesvarrs10 = rigtigesvarstmt10.executeQuery(rigtigesvarQUERY10);


      while (rigtigesvarrs10.next()) {
        if (elevSvarNR[10-1] == rigtigesvarrs10.getInt("opgave10Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn10.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (11 <= maxopgaver) {
    try {
      String rigtigesvarQUERY11 = "SELECT opgave11Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn11 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt11 = rigtigesvarconn11.createStatement();
      ResultSet rigtigesvarrs11 = rigtigesvarstmt11.executeQuery(rigtigesvarQUERY11);


      while (rigtigesvarrs11.next()) {
        if (elevSvarNR[11-1] == rigtigesvarrs11.getInt("opgave11Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn11.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (12 <= maxopgaver) {
    try {
      String rigtigesvarQUERY12 = "SELECT opgave12Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn12 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt12 = rigtigesvarconn12.createStatement();
      ResultSet rigtigesvarrs12 = rigtigesvarstmt12.executeQuery(rigtigesvarQUERY12);


      while (rigtigesvarrs12.next()) {
        if (elevSvarNR[12-1] == rigtigesvarrs12.getInt("opgave12Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn12.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (13 <= maxopgaver) {
    try {
      String rigtigesvarQUERY13 = "SELECT opgave13Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn13 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt13 = rigtigesvarconn13.createStatement();
      ResultSet rigtigesvarrs13 = rigtigesvarstmt13.executeQuery(rigtigesvarQUERY13);


      while (rigtigesvarrs13.next()) {
        if (elevSvarNR[13-1] == rigtigesvarrs13.getInt("opgave13Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn13.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (14 <= maxopgaver) {
    try {
      String rigtigesvarQUERY14 = "SELECT opgave14Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn14 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt14 = rigtigesvarconn14.createStatement();
      ResultSet rigtigesvarrs14 = rigtigesvarstmt14.executeQuery(rigtigesvarQUERY14);


      while (rigtigesvarrs14.next()) {
        if (elevSvarNR[14-1] == rigtigesvarrs14.getInt("opgave14Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn14.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (15 <= maxopgaver) {
    try {
      String rigtigesvarQUERY15 = "SELECT opgave15Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn15 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt15 = rigtigesvarconn15.createStatement();
      ResultSet rigtigesvarrs15 = rigtigesvarstmt15.executeQuery(rigtigesvarQUERY15);


      while (rigtigesvarrs15.next()) {
        if (elevSvarNR[15-1] == rigtigesvarrs15.getInt("opgave15Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn15.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (16 <= maxopgaver) {
    try {
      String rigtigesvarQUERY16 = "SELECT opgave16Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn16 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt16 = rigtigesvarconn16.createStatement();
      ResultSet rigtigesvarrs16 = rigtigesvarstmt16.executeQuery(rigtigesvarQUERY16);


      while (rigtigesvarrs16.next()) {
        if (elevSvarNR[16-1] == rigtigesvarrs16.getInt("opgave16Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn16.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (17 <= maxopgaver) {
    try {
      String rigtigesvarQUERY17 = "SELECT opgave17Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn17 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt17 = rigtigesvarconn17.createStatement();
      ResultSet rigtigesvarrs17 = rigtigesvarstmt17.executeQuery(rigtigesvarQUERY17);


      while (rigtigesvarrs17.next()) {
        if (elevSvarNR[17-1] == rigtigesvarrs17.getInt("opgave17Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn17.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (18 <= maxopgaver) {
    try {
      String rigtigesvarQUERY18 = "SELECT opgave18Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn18 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt18 = rigtigesvarconn18.createStatement();
      ResultSet rigtigesvarrs18 = rigtigesvarstmt18.executeQuery(rigtigesvarQUERY18);


      while (rigtigesvarrs18.next()) {
        if (elevSvarNR[18-1] == rigtigesvarrs18.getInt("opgave18Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn18.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (19 <= maxopgaver) {
    try {
      String rigtigesvarQUERY19 = "SELECT opgave19Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn19 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt19 = rigtigesvarconn19.createStatement();
      ResultSet rigtigesvarrs19 = rigtigesvarstmt19.executeQuery(rigtigesvarQUERY19);


      while (rigtigesvarrs19.next()) {
        if (elevSvarNR[19-1] == rigtigesvarrs19.getInt("opgave19Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn19.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (20 <= maxopgaver) {
    try {
      String rigtigesvarQUERY20 = "SELECT opgave20Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn20 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt20 = rigtigesvarconn20.createStatement();
      ResultSet rigtigesvarrs20 = rigtigesvarstmt20.executeQuery(rigtigesvarQUERY20);


      while (rigtigesvarrs20.next()) {
        if (elevSvarNR[20-1] == rigtigesvarrs20.getInt("opgave20Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn20.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (21 <= maxopgaver) {
    try {
      String rigtigesvarQUERY21 = "SELECT opgave21Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn21 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt21 = rigtigesvarconn21.createStatement();
      ResultSet rigtigesvarrs21 = rigtigesvarstmt21.executeQuery(rigtigesvarQUERY21);


      while (rigtigesvarrs21.next()) {
        if (elevSvarNR[21-1] == rigtigesvarrs21.getInt("opgave21Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn21.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (22 <= maxopgaver) {
    try {
      String rigtigesvarQUERY22 = "SELECT opgave22Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn22 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt22 = rigtigesvarconn22.createStatement();
      ResultSet rigtigesvarrs22 = rigtigesvarstmt22.executeQuery(rigtigesvarQUERY22);


      while (rigtigesvarrs22.next()) {
        if (elevSvarNR[22-1] == rigtigesvarrs22.getInt("opgave22Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn22.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (23 <= maxopgaver) {
    try {
      String rigtigesvarQUERY23 = "SELECT opgave23Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn23 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt23 = rigtigesvarconn23.createStatement();
      ResultSet rigtigesvarrs23 = rigtigesvarstmt23.executeQuery(rigtigesvarQUERY23);


      while (rigtigesvarrs23.next()) {
        if (elevSvarNR[23-1] == rigtigesvarrs23.getInt("opgave23Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn23.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (24 <= maxopgaver) {
    try {
      String rigtigesvarQUERY24 = "SELECT opgave24Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn24 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt24 = rigtigesvarconn24.createStatement();
      ResultSet rigtigesvarrs24 = rigtigesvarstmt24.executeQuery(rigtigesvarQUERY24);


      while (rigtigesvarrs24.next()) {
        if (elevSvarNR[24-1] == rigtigesvarrs24.getInt("opgave24Svar")) {
          rigtigesvar += 1;
        }
      }  
      rigtigesvarconn24.close();
    }
    catch(Exception e) {
      println(e);
    }
  }
  if (25 <= maxopgaver) {
    try {
      String rigtigesvarQUERY25 = "SELECT opgave25Svar FROM opgavesvarark WHERE opgaveID = "+opgaveID+";";
      Connection rigtigesvarconn25 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement rigtigesvarstmt25 = rigtigesvarconn25.createStatement();
      ResultSet rigtigesvarrs25 = rigtigesvarstmt25.executeQuery(rigtigesvarQUERY25);


      while (rigtigesvarrs25.next()) {
        if (elevSvarNR[25-1] == rigtigesvarrs25.getInt("opgave25Svar")) {
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

public void tjekResultat() {
}

public void uploadResultat() {
}

//Find elevprøver
public void elevLoadAlleOpgaver() {
  try {
    String TQUERYx12 = "SELECT elevID FROM elev WHERE brugernavn = '"+lokalbrugernavn+"';";
    Connection Tconnx12 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx12 = Tconnx12.createStatement(); 
    ResultSet Trsx12 = Tstmtx12.executeQuery(TQUERYx12);

    while (Trsx12.next()) {
      lokalelevID = ((int)Trsx12.getInt("elevID"));
    }
    Tconnx12.close();
  }


  catch(Exception e) {
    println(e);
  } 

  try {
    String TQUERYx13 = "SELECT klasseID FROM elev WHERE elevID = "+lokalelevID+";";
    Connection Tconnx13 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx13 = Tconnx13.createStatement(); 
    ResultSet Trsx13 = Tstmtx13.executeQuery(TQUERYx13);

    while (Trsx13.next()) {
      lokalklasseID = ((int)Trsx13.getInt("klasseID"));
    }
    Tconnx13.close();
  }

  catch(Exception e) {
    println(e);
  }  
  try {
    String TQUERYx14 = "SELECT opgaveantalklasse FROM klasse WHERE klasseID = "+lokalklasseID+";";
    Connection Tconnx14 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx14 = Tconnx14.createStatement(); 
    ResultSet Trsx14 = Tstmtx14.executeQuery(TQUERYx14);

    while (Trsx14.next()) {

      lokalopgaveantalklasse = ((int)Trsx14.getInt("opgaveantalklasse"));
    }
    Tconnx14.close();
  }

  catch(Exception e) {
    println(e);
  }
  elevLoadOpgaver();
}

public void elevLoadOpgaver() {

  //enplusside=1,toplusside=2,treplusside=3,fireplusside=4,femplusside=5;
  if (lokalopgaveantalklasse >= enplusside) {
    try {
      String TQUERYx15 = "SELECT opgaveID FROM klasseopgaver WHERE klasseID ORDER BY ID = "+lokalklasseID+" DESC LIMIT (1,"+enplusside+");";
      Connection Tconnx15 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx15 = Tconnx15.createStatement(); 
      ResultSet Trsx15 = Tstmtx15.executeQuery(TQUERYx15);
      while (Trsx15.next()) {
        opgID1 = ((int)Trsx15.getInt("opgaveID"));
      }
      Tconnx15.close();
    }

    catch(Exception e) {
      println(e);
    }
    try {
      String TQUERYx16 = "SELECT opgaveNavn FROM klasseopgaver WHERE opgaveID = "+opgID1+";";
      Connection Tconnx16 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx16 = Tconnx16.createStatement(); 
      ResultSet Trsx16 = Tstmtx16.executeQuery(TQUERYx16);
      while (Trsx16.next()) {
        opgnavn1 = Trsx16.getString("opgaveNavn");
      }
      Tconnx16.close();
    }

    catch(Exception e) {
      println(e);
    }

    try {
      String TQUERYx17 = "SELECT opgaveOpen FROM klasseopgaver WHERE opgaveID = "+opgID1+";";
      Connection Tconnx17 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx17 = Tconnx17.createStatement(); 
      ResultSet Trsx17 = Tstmtx17.executeQuery(TQUERYx17);
      while (Trsx17.next()) {
        open1 = ((int)Trsx17.getInt("opgaveOpen"));
      }
      Tconnx17.close();
    }

    catch(Exception e) {
      println(e);
    }

    if (open1 == 1) {
      try {
        String TQUERYx18 = "SELECT opgaveAntal FROM opgaverlavet WHERE elevID = "+lokalelevID+" AND opgaveID = "+opgID1+";";
        Connection Tconnx18 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx18 = Tconnx18.createStatement(); 
        ResultSet Trsx18 = Tstmtx18.executeQuery(TQUERYx18);
        while (Trsx18.next()) {
          opgantal1 = ((int)Trsx18.getInt("opgaveAntal"));
        }
        Tconnx18.close();
      }

      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx19 = "SELECT rigtigeSvar FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID1+";";
        Connection Tconnx19 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx19 = Tconnx19.createStatement(); 
        ResultSet Trsx19 = Tstmtx19.executeQuery(TQUERYx19);
        while (Trsx19.next()) {
          rigtigesvar1 = ((int)Trsx19.getInt("rigtigeSvar"));
        }
        Tconnx19.close();
      }
      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx20 = "SELECT karakterVis FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID1+";";
        Connection Tconnx20 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx20 = Tconnx20.createStatement(); 
        ResultSet Trsx20 = Tstmtx20.executeQuery(TQUERYx20);
        while (Trsx20.next()) {
          karakter1 = ((int)Trsx20.getInt("karakterVis"));
        }
        Tconnx20.close();
      }
      catch(Exception e) {
        println(e);
      }
    }
  }

  if (lokalopgaveantalklasse >= toplusside) {
    try {
      String TQUERYx21 = "SELECT opgaveID FROM klasseopgaver WHERE klasseID ORDER BY ID = "+lokalklasseID+" DESC LIMIT (1,"+toplusside+");";
      Connection Tconnx21 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx21 = Tconnx21.createStatement(); 
      ResultSet Trsx21 = Tstmtx21.executeQuery(TQUERYx21);
      while (Trsx21.next()) {
        opgID2 = ((int)Trsx21.getInt("opgaveID"));
      }
      Tconnx21.close();
    }

    catch(Exception e) {
      println(e);
    }
    try {
      String TQUERYx22 = "SELECT opgaveNavn FROM klasseopgaver WHERE opgaveID = "+opgID2+";";
      Connection Tconnx22 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx22 = Tconnx22.createStatement(); 
      ResultSet Trsx22 = Tstmtx22.executeQuery(TQUERYx22);
      while (Trsx22.next()) {
        opgnavn2 = Trsx22.getString("opgaveNavn");
      }
      Tconnx22.close();
    }

    catch(Exception e) {
      println(e);
    }

    try {
      String TQUERYx23 = "SELECT opgaveOpen FROM klasseopgaver WHERE opgaveID = "+opgID2+";";
      Connection Tconnx23 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx23 = Tconnx23.createStatement(); 
      ResultSet Trsx23 = Tstmtx23.executeQuery(TQUERYx23);
      while (Trsx23.next()) {
        open2 = ((int)Trsx23.getInt("opgaveOpen"));
      }
      Tconnx23.close();
    }

    catch(Exception e) {
      println(e);
    }

    if (open2 == 1) {
      try {
        String TQUERYx24 = "SELECT opgaveAntal FROM opgaverlavet WHERE elevID = "+lokalelevID+" AND opgaveID = "+opgID2+";";
        Connection Tconnx24 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx24 = Tconnx24.createStatement(); 
        ResultSet Trsx24 = Tstmtx24.executeQuery(TQUERYx24);
        while (Trsx24.next()) {
          opgantal2 = ((int)Trsx24.getInt("opgaveAntal"));
        }
        Tconnx24.close();
      }

      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx25 = "SELECT rigtigeSvar FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID2+";";
        Connection Tconnx25 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx25 = Tconnx25.createStatement(); 
        ResultSet Trsx25 = Tstmtx25.executeQuery(TQUERYx25);
        while (Trsx25.next()) {
          rigtigesvar2 = ((int)Trsx25.getInt("rigtigeSvar"));
        }
        Tconnx25.close();
      }
      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx26 = "SELECT karakterVis FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID2+";";
        Connection Tconnx26 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx26 = Tconnx26.createStatement(); 
        ResultSet Trsx26 = Tstmtx26.executeQuery(TQUERYx26);
        while (Trsx26.next()) {
          karakter2= ((int)Trsx26.getInt("karakterVis"));
        }
        Tconnx26.close();
      }
      catch(Exception e) {
        println(e);
      }
    }
  }
  if (lokalopgaveantalklasse >= treplusside) {
    try {
      String TQUERYx27 = "SELECT opgaveID FROM klasseopgaver WHERE klasseID ORDER BY ID = "+lokalklasseID+" DESC LIMIT (1,"+treplusside+");";
      Connection Tconnx27 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx27 = Tconnx27.createStatement(); 
      ResultSet Trsx27 = Tstmtx27.executeQuery(TQUERYx27);
      while (Trsx27.next()) {
        opgID3 = ((int)Trsx27.getInt("opgaveID"));
      }
      Tconnx27.close();
    }

    catch(Exception e) {
      println(e);
    }
    try {
      String TQUERYx28 = "SELECT opgaveNavn FROM klasseopgaver WHERE opgaveID = "+opgID3+";";
      Connection Tconnx28 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx28 = Tconnx28.createStatement(); 
      ResultSet Trsx28 = Tstmtx28.executeQuery(TQUERYx28);
      while (Trsx28.next()) {
        opgnavn3 = Trsx28.getString("opgaveNavn");
      }
      Tconnx28.close();
    }

    catch(Exception e) {
      println(e);
    }

    try {
      String TQUERYx29 = "SELECT opgaveOpen FROM klasseopgaver WHERE opgaveID = "+opgID3+";";
      Connection Tconnx29 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx29 = Tconnx29.createStatement(); 
      ResultSet Trsx29 = Tstmtx29.executeQuery(TQUERYx29);
      while (Trsx29.next()) {
        open3 = ((int)Trsx29.getInt("opgaveOpen"));
      }
      Tconnx29.close();
    }

    catch(Exception e) {
      println(e);
    }

    if (open3 == 1) {
      try {
        String TQUERYx30 = "SELECT opgaveAntal FROM opgaverlavet WHERE elevID = "+lokalelevID+" AND opgaveID = "+opgID3+";";
        Connection Tconnx30 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx30 = Tconnx30.createStatement(); 
        ResultSet Trsx30 = Tstmtx30.executeQuery(TQUERYx30);
        while (Trsx30.next()) {
          opgantal3 = ((int)Trsx30.getInt("opgaveAntal"));
        }
        Tconnx30.close();
      }

      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx31 = "SELECT rigtigeSvar FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID3+";";
        Connection Tconnx31 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx31 = Tconnx31.createStatement(); 
        ResultSet Trsx31 = Tstmtx31.executeQuery(TQUERYx31);
        while (Trsx31.next()) {
          rigtigesvar3 = ((int)Trsx31.getInt("rigtigeSvar"));
        }
        Tconnx31.close();
      }
      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx32 = "SELECT karakterVis FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID3+";";
        Connection Tconnx32 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx32 = Tconnx32.createStatement(); 
        ResultSet Trsx32 = Tstmtx32.executeQuery(TQUERYx32);
        while (Trsx32.next()) {
          karakter3 = ((int)Trsx32.getInt("karakterVis"));
        }
        Tconnx32.close();
      }
      catch(Exception e) {
        println(e);
      }
    }
  }

  if (lokalopgaveantalklasse >= fireplusside) {
    try {
      String TQUERYx33 = "SELECT opgaveID FROM klasseopgaver WHERE klasseID ORDER BY ID = "+lokalklasseID+" DESC LIMIT (1,"+fireplusside+");";
      Connection Tconnx33 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx33 = Tconnx33.createStatement(); 
      ResultSet Trsx33 = Tstmtx33.executeQuery(TQUERYx33);
      while (Trsx33.next()) {
        opgID4 = ((int)Trsx33.getInt("opgaveID"));
      }
      Tconnx33.close();
    }

    catch(Exception e) {
      println(e);
    }
    try {
      String TQUERYx34 = "SELECT opgaveNavn FROM klasseopgaver WHERE opgaveID = "+opgID4+";";
      Connection Tconnx34 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx34 = Tconnx34.createStatement(); 
      ResultSet Trsx34 = Tstmtx34.executeQuery(TQUERYx34);
      while (Trsx34.next()) {
        opgnavn4 = Trsx34.getString("opgaveNavn");
      }
      Tconnx34.close();
    }

    catch(Exception e) {
      println(e);
    }

    try {
      String TQUERYx35 = "SELECT opgaveOpen FROM klasseopgaver WHERE opgaveID = "+opgID4+";";
      Connection Tconnx35 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx35 = Tconnx35.createStatement(); 
      ResultSet Trsx35 = Tstmtx35.executeQuery(TQUERYx35);
      while (Trsx35.next()) {
        open4 = ((int)Trsx35.getInt("opgaveOpen"));
      }
      Tconnx35.close();
    }

    catch(Exception e) {
      println(e);
    }

    if (open4 == 1) {
      try {
        String TQUERYx36 = "SELECT opgaveAntal FROM opgaverlavet WHERE elevID = "+lokalelevID+" AND opgaveID = "+opgID4+";";
        Connection Tconnx36 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx36 = Tconnx36.createStatement(); 
        ResultSet Trsx36 = Tstmtx36.executeQuery(TQUERYx36);
        while (Trsx36.next()) {
          opgantal4 = ((int)Trsx36.getInt("opgaveAntal"));
        }
        Tconnx36.close();
      }

      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx37 = "SELECT rigtigeSvar FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID4+";";
        Connection Tconnx37 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx37 = Tconnx37.createStatement(); 
        ResultSet Trsx37 = Tstmtx37.executeQuery(TQUERYx37);
        while (Trsx37.next()) {
          rigtigesvar4 = ((int)Trsx37.getInt("rigtigeSvar"));
        }
        Tconnx37.close();
      }
      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx38 = "SELECT karakterVis FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID4+";";
        Connection Tconnx38 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx38 = Tconnx38.createStatement(); 
        ResultSet Trsx38 = Tstmtx38.executeQuery(TQUERYx38);
        while (Trsx38.next()) {
          karakter4= ((int)Trsx38.getInt("karakterVis"));
        }
        Tconnx38.close();
      }
      catch(Exception e) {
        println(e);
      }
    }
  }

  if (lokalopgaveantalklasse >= femplusside) {
    try {
      String TQUERYx39 = "SELECT opgaveID FROM klasseopgaver WHERE klasseID ORDER BY ID = "+lokalklasseID+" DESC LIMIT (1,"+femplusside+");";
      Connection Tconnx39 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx39 = Tconnx39.createStatement(); 
      ResultSet Trsx39 = Tstmtx39.executeQuery(TQUERYx39);
      while (Trsx39.next()) {
        opgID5 = ((int)Trsx39.getInt("opgaveID"));
      }
      Tconnx39.close();
    }

    catch(Exception e) {
      println(e);
    }
    try {
      String TQUERYx40 = "SELECT opgaveNavn FROM klasseopgaver WHERE opgaveID = "+opgID5+";";
      Connection Tconnx40 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx40 = Tconnx40.createStatement(); 
      ResultSet Trsx40 = Tstmtx40.executeQuery(TQUERYx40);
      while (Trsx40.next()) {
        opgnavn5 = Trsx40.getString("opgaveNavn");
      }
      Tconnx40.close();
    }

    catch(Exception e) {
      println(e);
    }

    try {
      String TQUERYx41 = "SELECT opgaveOpen FROM klasseopgaver WHERE opgaveID = "+opgID5+";";
      Connection Tconnx41 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx41 = Tconnx41.createStatement(); 
      ResultSet Trsx41 = Tstmtx41.executeQuery(TQUERYx41);
      while (Trsx41.next()) {
        open5 = ((int)Trsx41.getInt("opgaveOpen"));
      }
      Tconnx41.close();
    }

    catch(Exception e) {
      println(e);
    }

    if (open5 == 1) {
      try {
        String TQUERYx42 = "SELECT opgaveAntal FROM opgaverlavet WHERE elevID = "+lokalelevID+" AND opgaveID = "+opgID5+";";
        Connection Tconnx42 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx42 = Tconnx42.createStatement(); 
        ResultSet Trsx42 = Tstmtx42.executeQuery(TQUERYx42);
        while (Trsx42.next()) {
          opgantal5 = ((int)Trsx42.getInt("opgaveAntal"));
        }
        Tconnx42.close();
      }

      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx43 = "SELECT rigtigeSvar FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID5+";";
        Connection Tconnx43 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx43 = Tconnx43.createStatement(); 
        ResultSet Trsx43 = Tstmtx43.executeQuery(TQUERYx43);
        while (Trsx43.next()) {
          rigtigesvar5 = ((int)Trsx43.getInt("rigtigeSvar"));
        }
        Tconnx43.close();
      }
      catch(Exception e) {
        println(e);
      }

      try {
        String TQUERYx44 = "SELECT karakterVis FROM opgaverlavet WHERE elevID = '"+lokalelevID+"'; AND opgaveID = "+opgID5+";";
        Connection Tconnx44 = DriverManager.getConnection(DB_URL, USER, PASS);
        java.sql.Statement Tstmtx44 = Tconnx44.createStatement(); 
        ResultSet Trsx44 = Tstmtx44.executeQuery(TQUERYx44);
        while (Trsx44.next()) {
          karakter5 = ((int)Trsx44.getInt("karakterVis"));
        }
        Tconnx44.close();
      }
      catch(Exception e) {
        println(e);
      }
    }
  }
}




public void OpretOpgaver() {
  try {
    String TQUERYx = "SELECT opgaveID, MAX(opgaveID) FROM opgavetabel GROUP BY opgaveID";
    Connection Tconnx = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx = Tconnx.createStatement(); 
    ResultSet Trsx = Tstmtx.executeQuery(TQUERYx);

    while (Trsx.next()) {
      maxID = ((int)Trsx.getInt("opgaveID"));
      maxID2 = maxID+1;
    }
    Tconnx.close();
  }


  catch(Exception e) {
    println(e);
  } 

  try {

       opgavenavn = nameTB.Text;
       nyopgaveantal =0 ;
       for (int i = 0; i <= 24; i++){
       if (opgavetekst[i].equals("") == true);
       nyopgaveantal = nyopgaveantal+1;
       
       }
      String TQUERYx1 = "INSERT INTO opgavetabel (opgaveID, opgaveNavn, opgaveAntal) VALUES (maxID2, '"+opgavenavn+"', "+nyopgaveantal+" );";
      Connection Tconnx1 = DriverManager.getConnection(DB_URL, USER, PASS);
      java.sql.Statement Tstmtx1 = Tconnx1.createStatement();
      Tstmtx1.executeUpdate(TQUERYx1);
    Tconnx1.close();
  }
  catch(Exception e) {
    println(e);
  } 

  try {  
    String TQUERYx2 = "INSERT INTO opgavetext(opgaveID, opgaveTekst1,opgaveTekst2,opgaveTekst3,opgaveTekst4,opgaveTekst5,opgaveTekst6,opgaveTekst7,opgaveTekst8,opgaveTekst9,opgaveTekst10,opgaveTekst11,opgaveTekst12,opgaveTekst13,opgaveTekst14,opgaveTekst15,opgaveTekst16 ,opgaveTekst17,opgaveTekst18,opgaveTekst19,opgaveTekst20,opgaveTekst21,opgaveTekst22,opgaveTekst23,opgaveTekst24,opgaveTekst25) VALUES ("+maxID2+", ’"+opgavetekst[1-1]+"’, ’"+opgavetekst[2-1]+"’, ’"+opgavetekst[3-1]+"’, ’"+opgavetekst[4-1]+"’, ’"+opgavetekst[5-1]+"’, ’"+opgavetekst[6-1]+"’, ’"+opgavetekst[7-1]+"’, ’"+opgavetekst[8-1]+"’, ’"+opgavetekst[9-1]+"’, ’"+opgavetekst[10-1]+"’,’"+opgavetekst[11-1]+"’, ’"+opgavetekst[12-1]+"’, ’"+opgavetekst[13-1]+"’, ’"+opgavetekst[14-1]+"’, ’"+opgavetekst[15-1]+"’, ’"+opgavetekst[16-1]+"’, ’"+opgavetekst[17-1]+"’, ’"+opgavetekst[18-1]+"’, ’"+opgavetekst[19-1]+"’, ’"+opgavetekst[20-1]+"’, ’"+opgavetekst[21-1]+"’, ’"+opgavetekst[22-1]+"’, ’"+opgavetekst[23-1]+"’, ’"+opgavetekst[24-1]+"’, ’"+opgavetekst[25-1]+"’);";
    Connection Tconnx2 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx2 = Tconnx2.createStatement();
    Tstmtx2.executeUpdate(TQUERYx2);
    Tconnx2.close();
  }
  catch(Exception e) {
    println(e);
  }

  try { 
    String TQUERYx3 = "INSERT INTO opgavesvar1 (opgaveID, opgave1Svar1,opgave2Svar1,opgave3Svar1,opgave4Svar1,opgave5Svar1,opgave6Svar1,opgave7Svar1,opgave8Svar1,opgave9Svar1,opgave10Svar1,opgave11Svar1,opgave12Svar1,opgave13Svar1,opgave14Svar1,opgave15Svar1,opgave16Svar1,opgave17Svar1,opgave18Svar1,opgave19Svar1,opgave20Svar1,opgave21Svar1,opgave22Svar1,opgave23Svar1,opgave24Svar1,opgave25Svar1) VALUES ("+maxID2+", ’"+opgaveSvar1[1-1]+"’, ’"+opgaveSvar1[2-1]+"’, ’"+opgaveSvar1[3-1]+"’, ’"+opgaveSvar1[4-1]+"’, ’"+opgaveSvar1[5-1]+"’, ’"+opgaveSvar1[6-1]+"’, ’"+opgaveSvar1[7-1]+"’, ’"+opgaveSvar1[8-1]+"’, ’"+opgaveSvar1[9-1]+"’, ’"+opgaveSvar1[10-1]+"’,’"+opgaveSvar1[11-1]+"’, ’"+opgaveSvar1[12-1]+"’, ’"+opgaveSvar1[13-1]+"’, ’"+opgaveSvar1[14-1]+"’, ’"+opgaveSvar1[15-1]+"’, ’"+opgaveSvar1[16-1]+"’, ’"+opgaveSvar1[17-1]+"’, ’"+opgaveSvar1[18-1]+"’, ’"+opgaveSvar1[19-1]+"’, ’"+opgaveSvar1[20-1]+"’, ’"+opgaveSvar1[21-1]+"’, ’"+opgaveSvar1[22-1]+"’, ’"+opgaveSvar1[23-1]+"’, ’"+opgaveSvar1[24-1]+"’, ’"+opgaveSvar1[25-1]+"’);";
    Connection Tconnx3 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx3 = Tconnx3.createStatement();
    Tstmtx3.executeUpdate(TQUERYx3);
    Tconnx3.close();
  }
  catch(Exception e) {
    println(e);
  }

  try {
    String TQUERYx4 = "INSERT INTO opgavesvar2 (opgaveID, opgave1Svar2,opgave2Svar2,opgave3Svar2,opgave4Svar2,opgave5Svar2,opgave6Svar2,opgave7Svar2,opgave8Svar2,opgave9Svar2,opgave10Svar2,opgave11Svar2,opgave12Svar2,opgave13Svar2,opgave14Svar2,opgave15Svar2,opgave16Svar2,opgave17Svar2,opgave18Svar2,opgave19Svar2,opgave20Svar2,opgave21Svar2,opgave22Svar2,opgave23Svar2,opgave24Svar2,opgave25Svar2) VALUES ("+maxID2+", ’"+opgaveSvar2[1-1]+"’, ’"+opgaveSvar2[2-1]+"’, ’"+opgaveSvar2[3-1]+"’, ’"+opgaveSvar2[4-1]+"’, ’"+opgaveSvar2[5-1]+"’, ’"+opgaveSvar2[6-1]+"’, ’"+opgaveSvar2[7-1]+"’, ’"+opgaveSvar2[8-1]+"’, ’"+opgaveSvar2[9-1]+"’, ’"+opgaveSvar2[10-1]+"’,’"+opgaveSvar2[11-1]+"’, ’"+opgaveSvar2[12-1]+"’, ’"+opgaveSvar2[13-1]+"’, ’"+opgaveSvar2[14-1]+"’, ’"+opgaveSvar2[15-1]+"’, ’"+opgaveSvar2[16-1]+"’, ’"+opgaveSvar2[17-1]+"’, ’"+opgaveSvar2[18-1]+"’, ’"+opgaveSvar2[19-1]+"’, ’"+opgaveSvar2[20-1]+"’, ’"+opgaveSvar2[21-1]+"’, ’"+opgaveSvar2[22-1]+"’, ’"+opgaveSvar2[23-1]+"’, ’"+opgaveSvar2[24-1]+"’, ’"+opgaveSvar2[25-1]+"’);";
    Connection Tconnx4 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx4 = Tconnx4.createStatement();
    Tstmtx4.executeUpdate(TQUERYx4);
    Tconnx4.close();
  }
  catch(Exception e) {
    println(e);
  }

  try {
    String TQUERYx5 = "INSERT INTO opgavesvar3 (opgaveID, opgave1Svar3,opgave2Svar3,opgave3Svar3,opgave4Svar3,opgave5Svar3,opgave6Svar3,opgave7Svar3,opgave8Svar3,opgave9Svar3,opgave10Svar3,opgave11Svar3,opgave12Svar3,opgave13Svar3,opgave14Svar3,opgave15Svar3,opgave16Svar3,opgave17Svar3,opgave18Svar3,opgave19Svar3,opgave20Svar3,opgave21Svar3,opgave22Svar3,opgave23Svar3,opgave24Svar3,opgave25Svar3) VALUES ("+maxID2+", ’"+opgaveSvar3[1-1]+"’, ’"+opgaveSvar3[2-1]+"’, ’"+opgaveSvar3[3-1]+"’, ’"+opgaveSvar3[4-1]+"’, ’"+opgaveSvar3[5-1]+"’, ’"+opgaveSvar3[6-1]+"’, ’"+opgaveSvar3[7-1]+"’, ’"+opgaveSvar3[8-1]+"’, ’"+opgaveSvar3[9-1]+"’, ’"+opgaveSvar3[10-1]+"’,’"+opgaveSvar3[11-1]+"’, ’"+opgaveSvar3[12-1]+"’, ’"+opgaveSvar3[13-1]+"’, ’"+opgaveSvar3[14-1]+"’, ’"+opgaveSvar3[15-1]+"’, ’"+opgaveSvar3[16-1]+"’, ’"+opgaveSvar3[17-1]+"’, ’"+opgaveSvar3[18-1]+"’, ’"+opgaveSvar3[19-1]+"’, ’"+opgaveSvar3[20-1]+"’, ’"+opgaveSvar3[21-1]+"’, ’"+opgaveSvar3[22-1]+"’, ’"+opgaveSvar3[23-1]+"’, ’"+opgaveSvar3[24-1]+"’, ’"+opgaveSvar3[25-1]+"’);";
    Connection Tconnx5 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx5 = Tconnx5.createStatement();
    Tstmtx5.executeUpdate(TQUERYx5);
    Tconnx5.close();
  }
  catch(Exception e) {
    println(e);
  }

  try {
    String TQUERYx6 = "INSERT INTO opgavesvar4 (opgaveID, opgave1Svar4,opgave2Svar4,opgave3Svar4,opgave4Svar4,opgave5Svar4,opgave6Svar4,opgave7Svar4,opgave8Svar4,opgave9Svar4,opgave10Svar4,opgave11Svar4,opgave12Svar4,opgave13Svar4,opgave14Svar4,opgave15Svar4,opgave16Svar4,opgave17Svar4,opgave18Svar4,opgave19Svar4,opgave20Svar4,opgave21Svar4,opgave22Svar4,opgave23Svar4,opgave24Svar4,opgave25Svar4) VALUES ("+maxID2+", ’"+opgaveSvar4[1-1]+"’, ’"+opgaveSvar4[2-1]+"’, ’"+opgaveSvar4[3-1]+"’, ’"+opgaveSvar4[4-1]+"’, ’"+opgaveSvar4[5-1]+"’, ’"+opgaveSvar4[6-1]+"’, ’"+opgaveSvar4[7-1]+"’, ’"+opgaveSvar4[8-1]+"’, ’"+opgaveSvar4[9-1]+"’, ’"+opgaveSvar4[10-1]+"’,’"+opgaveSvar4[11-1]+"’, ’"+opgaveSvar4[12-1]+"’, ’"+opgaveSvar4[13-1]+"’, ’"+opgaveSvar4[14-1]+"’, ’"+opgaveSvar4[15-1]+"’, ’"+opgaveSvar4[16-1]+"’, ’"+opgaveSvar4[17-1]+"’, ’"+opgaveSvar4[18-1]+"’, ’"+opgaveSvar4[19-1]+"’, ’"+opgaveSvar4[20-1]+"’, ’"+opgaveSvar4[21-1]+"’, ’"+opgaveSvar4[22-1]+"’, ’"+opgaveSvar4[23-1]+"’, ’"+opgaveSvar4[24-1]+"’, ’"+opgaveSvar4[25-1]+"’);";
    Connection Tconnx6 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx6 = Tconnx6.createStatement();
    Tstmtx6.executeUpdate(TQUERYx6);
    Tconnx6.close();
  }
  catch(Exception e) {
    println(e);
  }

  try {
    String TQUERYx7 = "INSERT INTO opgavesvarark (opgaveID, opgave1Svar,opgave2Svar,opgave3Svar,opgave4Svar,opgave5Svar,opgave6Svar,opgave7Svar,opgave8Svar,opgave9Svar,opgave10Svar,opgave11Svar,opgave12Svar,opgave13Svar,opgave14Svar,opgave15Svar,opgave16Svar,opgave17Svar,opgave18Svar,opgave19Svar,opgave20Svar,opgave21Svar,opgave22Svar,opgave23Svar,opgave24Svar,opgave25Svar) VALUES ("+maxID2+", "+realtSvarNR[1-1]+", "+realtSvarNR[2-1]+", "+realtSvarNR[3-1]+", "+realtSvarNR[4-1]+", "+realtSvarNR[5-1]+", "+realtSvarNR[6-1]+", "+realtSvarNR[7-1]+", "+realtSvarNR[8-1]+", "+realtSvarNR[9-1]+", "+realtSvarNR[10-1]+","+realtSvarNR[11-1]+", "+realtSvarNR[12-1]+", "+realtSvarNR[13-1]+", "+realtSvarNR[14-1]+", "+realtSvarNR[15-1]+", "+realtSvarNR[16-1]+", "+realtSvarNR[17-1]+", "+realtSvarNR[18-1]+", "+realtSvarNR[19-1]+", "+realtSvarNR[20-1]+", "+realtSvarNR[21-1]+", "+realtSvarNR[22-1]+", "+realtSvarNR[23-1]+", "+realtSvarNR[24-1]+", "+realtSvarNR[25-1]+");";
    Connection Tconnx7 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx7 = Tconnx7.createStatement();
    Tstmtx7.executeUpdate(TQUERYx7);
    Tconnx7.close();
  }
  catch(Exception e) {
    println(e);
  }
}










//Uddel elevprøver
public void uddelOpgaver() {
  int valgtklasseID =0;
  int valgtopgaveID =0;
  try {
    String TQUERYx8 = "SELECT opgaveantalklasse FROM klasse WHERE klasseID = "+valgtklasseID+";";

    Connection Tconnx8 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx8 = Tconnx8.createStatement(); 
    ResultSet Trsx8 = Tstmtx8.executeQuery(TQUERYx8);

    while (Trsx8.next()) {
      nyopgaveantal = ((int)Trsx8.getInt("opgaveantalklasse"));
      nyopgaveantal = nyopgaveantal+1;
    }
    Tconnx8.close();
  }
  catch(Exception e) {
    println(e);
  }

  try {
    String TQUERYx9 = "klasse SET opgaveantalklasse = "+nyopgaveantal+"  WHERE klasseID = "+valgtklasseID+";";
    Connection Tconnx9 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx9 = Tconnx9.createStatement();
    Tstmtx9.executeUpdate(TQUERYx9);
    Tconnx9.close();
  }
  catch(Exception e) {
    println(e);
  } 

  try {
    String TQUERYx10 = "SELECT opgaveNavn FROM opgavetabel WHERE opgaveID = "+valgtopgaveID+";"; 
    Connection Tconnx10 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx10 = Tconnx10.createStatement(); 
    ResultSet Trsx10 = Tstmtx10.executeQuery(TQUERYx10);

    while (Trsx10.next()) {
      opgavenavn = Trsx10.getString("opgaveNavn");
    }
    Tconnx10.close();
  }

  catch(Exception e) {
    println(e);
  }

  try {
    String TQUERYx11 = "INSERT INTO klasseopgaver (klasseID, opgaveID, opgavenavn, karakter) VALUES ("+valgtklasseID+", "+valgtopgaveID+", "+opgavenavn+", '"+karakter+"');";
    Connection Tconnx11 = DriverManager.getConnection(DB_URL, USER, PASS);
    java.sql.Statement Tstmtx11 = Tconnx11.createStatement();
    Tstmtx11.executeUpdate(TQUERYx11);
    Tconnx11.close();
  }
  catch(Exception e) {
    println(e);
  }
}
class TextBox {

  //position and size
  PVector position, size;
  float scroll;

  //visibility
  int visible;

  //colors
  public int Background = color(140, 140, 140);
  public int Foreground = color(0, 0, 0);
  public int BackgroundSelected = color(160, 160, 160);
  public int Border = color(30, 30, 30);

  //border
  public boolean BorderEnable = false;
  public int BorderWeight = 1;

  //text and textsize
  public int TEXTSIZE = 48;
  public boolean isProtected;
  public String Text = "";
  public String protectedText = "";
  public int protectedTextLength = 0;
  public int TextLength = 0;

  //if button is clicked
  private boolean selected = false;

  TextBox() {
  }
  //constructor
  TextBox(PVector position, PVector size, boolean isProtected, int visible) {
    this.position = position;
    this.size = size;
    this.isProtected = isProtected;
    this.visible = visible;
  }

  //display and run textbox
  public void display() {
    pushMatrix();
    translate(0, scroll);

    if (visible == gamestate) {
      // DRAWING THE BACKGROUND
      if (selected) {
        fill(BackgroundSelected);
      } else {
        fill(Background);
      }
      
    //  println(Text, protectedText);
      
      if (BorderEnable) {
        strokeWeight(BorderWeight);
        stroke(Border);
      } else {
        noStroke();
      }

      rectMode(CORNER);

      rect(position.x, position.y, size.x, size.y);

      // DRAWING THE TEXT ITSELF
      fill(Foreground);
      textSize(TEXTSIZE);

      if (isProtected) {
        text(protectedText, position.x + (textWidth("a") / 2), position.y + TEXTSIZE);
      } else {
        text(Text, position.x + (textWidth("a") / 2), position.y + TEXTSIZE);
      }
    } else {
      //sletter texten når man ikke er på menuen længere
      clearText();
    }
    translate(0, 0);
    popMatrix();
  }

  //check if key has been typed
  public boolean keyWasTyped(char KEY, int KEYCODE) {

    if (visible == gamestate) {
      if (selected) {
        if (KEYCODE == (int)BACKSPACE) {
          backSpace();
        } else if (KEYCODE == 32) {
          if (isProtected) {
            addProtection('*');
          }
          addText(' ');
        } else if (KEYCODE == (int)ENTER) {
          return true;
        } else {
          // CHECK IF THE KEY IS A LETTER OR A NUMBER
          boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Ø');
          boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'ø');
          boolean isKeyNumber = (KEY >= '0' && KEY <= '9');
          boolean isKeySign = (KEY >= 30 && KEY <= 200);


          if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber || isKeySign) {
            if (isProtected) {
              addProtection('*');
            }
            addText(KEY);
          }
        }
      }
    }
    return false;
  }

  //add text to textbox
  private void addText(char text) {    
    while (textWidth(Text+text)*TEXTSIZE/48*size.x/400 > size.x-15) {
      TEXTSIZE--;
    }

    if (textWidth(Text+text)*TEXTSIZE/48*size.x/400 < size.x-15) {
      Text += text;
      TextLength++;
    }
  }

  //add asterisk if textbox is a password textbox
  private void addProtection(char text) {
    while (textWidth(protectedText+text)*TEXTSIZE/48*size.x/400 > size.x-15) {
      TEXTSIZE--;
    }
    if (textWidth(protectedText + text)*TEXTSIZE/48*size.x/400 < (size.x)) {
      protectedText += text;
      protectedTextLength++;
    }
  }

  //remove text if backspace is pressed
  private void backSpace() {

    if (TextLength - 1 >= 0) {
      Text = Text.substring(0, TextLength - 1);
      TextLength--;
      if (textWidth(Text)*TEXTSIZE/48*size.x/400 < size.x-15*size.x/400*size.x/400 && TEXTSIZE <= 48) {
        TEXTSIZE++;
      }
    }

    if (protectedTextLength - 1 >=0) {
      protectedText = protectedText.substring(0, protectedTextLength - 1);
      protectedTextLength--;
    }
    if (textWidth(protectedText) < size.x-15 && TEXTSIZE <= 48) {
      TEXTSIZE++;
    }
  }

  //check if mouse is over box
  private boolean overBox(int x, int y) {
    if (x >= position.x && x <= position.x + size.x) {
      if (y >= position.y + scroll && y <= position.y + size.y + scroll) {
        return true;
      }
    }

    return false;
  }

  //check if mouse has been pressed
  public void pressed(int x, int y) {
    if (overBox(x, y)) {
      selected = true;
    } else {
      selected = false;
    }
  }

  //remove all text
  public void clearText() {
    TextLength = 0;
    Text = "";
    protectedTextLength = 0;
    protectedText = "";
  }
}
  public void settings() {  fullScreen(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--present", "--window-color=#666666", "--stop-color=#cccccc", "Abacus_2_0" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
