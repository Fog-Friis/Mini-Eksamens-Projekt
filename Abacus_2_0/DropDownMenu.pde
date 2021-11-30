float scroll;

class DropdownMenu {

  PVector pos;
  PVector size;
  String Text;
  int textSize;
  int visible;
  int shownObjects;
  int scale = 1;

  float theta = PI/4;

  boolean clicked = false;

  ArrayList<dropdownObject> objects = new ArrayList<dropdownObject>();

  DropdownMenu(PVector pos, PVector size, String Text, int textSize, int shownObjects, int visible) {
    this.pos = pos;
    this.size = size;
    this.Text = Text;
    this.textSize = textSize;
    this.shownObjects = shownObjects+2;
    this.visible = visible;
  }

  boolean over() {
    if (mouseX <= pos.x+size.x && mouseX >= pos.x && mouseY <= pos.y+size.y && mouseY >= pos.y) {
      return true;
    } else {
      return false;
    }
  }

  void pressed() {
    if (over()) {
      clicked = !clicked;
    }
  }

  void display() {

    //update dropdown menu
    if (clicked) {
      for (dropdownObject d : objects) d.visible = true;
      scale = 1;
    } else {
      for (dropdownObject d : objects) d.visible = false;
      scale = -1;
    }

    for (dropdownObject d : objects) {
      if (d.loc.y+size.y*d.number <= pos.y) {
        d.visible = false;
      }

      if (d.loc.y+size.y*d.number >= pos.y+(shownObjects-1)*size.y) {
        d.visible = false;
      }

      if (d.loc.y >= pos.y) {
        d.loc.y = pos.y;
      }


      if (d.loc.y + (objects.size()+1.7)*d.size.y <= pos.y+shownObjects*size.y) {
        d.loc.y = shownObjects*d.size.y;
      }
    }

    //draw dropdown menu
    if (visible == gamestate) { 

      for (dropdownObject d : objects) {
        d.display();

        if (d.visible) {
          textAlign(CORNER);
          textSize(d.size.y/2);
          fill(0);
          text(d.Text, d.loc.x, d.loc.y+(d.number+1)*size.y-size.y/2);
        }
      }
      
      fill(140,140,140);
      rect(pos.x, pos.y, size.x, size.y);           

      fill(0);
      textAlign(CORNER);
      textSize(textSize);
      text(Text, pos.x+10, pos.y+size.y/2+5);

      pushMatrix();
      translate(pos.x+size.x-30, pos.y + size.y - size.y/2);
      rotate(PI);
      scale(scale);
      triangle(-10, -5, 10, -5, 0, 5);
      fill(140,140,140);
      noStroke();
      triangle(-10, -10, 10, -10, 0, 0);
      stroke(0);
      translate(0, 0);
      popMatrix();
      fill(255);
    }

    if (objects.size() > shownObjects) {
      for (dropdownObject d : objects) {
        d.loc.y -= scroll;
      }
    }
    //println(d.loc.y);
    scroll = 0;
  }
}

class dropdownObject {

  PVector loc;
  PVector size;
  String Text;
  int number;
  boolean visible;

  boolean clicked;

  dropdownObject(PVector loc, PVector size, String Text, int number, boolean visible) {
    this.Text = Text;
    this.loc = loc;
    this.size = size;
    this.number = number;
    this.visible = visible;
  }

  boolean over() {
    if (mouseX <= loc.x+size.x && mouseX >= loc.x && mouseY <= loc.y+(number+1)*size.y && mouseY >= loc.y+number*size.y) {
      return true;
    } else {
      return false;
    }
  }

  void pressed() {
    if (over()) {
      clicked = true;
    }
  }
  void released() {
    clicked = false;
  }

  void display() {

    if (visible) {

      if (clicked) {
          fill(100, 100, 100);
      } else if (over()) {
        fill(200, 200, 200);
      } else {
        fill(170, 170, 170);
      }

      rect(loc.x, (number)*size.y+loc.y, size.x, size.y);
      fill(255);
    }
  }
}
