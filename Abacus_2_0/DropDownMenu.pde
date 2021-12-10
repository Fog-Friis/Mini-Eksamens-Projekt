class DropdownMenu {

  //position and size
  PVector pos;
  PVector size;
  float scroll;

  //text and textsize
  String Text;
  int textSize;

  //color
  color col;

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
  DropdownMenu(PVector pos, PVector size, String Text, int textSize, color col, int visible, ArrayList<dropdownObject> objects) {
    this.pos = pos;
    this.size = size;
    this.Text = Text;
    this.textSize = textSize;
    this.col = col;
    this.visible = visible;
    this.objects = objects;
  }

  //check if mouse is over dropdownmenu
  boolean over() {
    if (mouseX <= pos.x+size.x && mouseX >= pos.x && mouseY <= pos.y+size.y+scroll && mouseY >= pos.y+scroll) {
      return true;
    } else {
      return false;
    }
  }

  //check if mouse is over dropdownmenus list of objects
  boolean overObjects() {
    if (mouseX <= pos.x+size.x && mouseX >= pos.x && mouseY <= pos.y+size.y+size.y*objects.size()+scroll && mouseY >= pos.y+size.y+scroll) {
      return true;
    } else {
      return false;
    }
  }

  //check if mouse has been pressed
  void pressed() {
    if (over()) {
      clicked = !clicked;
    }
  }

  //display dropdown menu
  void display() {

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
  boolean over() {
    if (mouseX <= loc.x+size.x && mouseX >= loc.x && mouseY <= loc.y+(number+1)*size.y+scroll && mouseY >= loc.y+number*size.y+scroll) {
      return true;
    } else {
      return false;
    }
  }

  //check if mouse has been pressed
  void pressed() {
    if (over()) {
      clicked = true;
    }    
  }
  //check if mouse has been released
  void released() {
    clicked = false;
  }

  //display object
  void display() {

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
