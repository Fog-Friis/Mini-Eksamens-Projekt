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
  void run() {
    update();
    display();
  }

  //update scrollbar
  void update() {

    if (mousePressed && over()) {
      locked = false;
    }

    if (!mousePressed) {
      locked = true;
    }

    if (!locked) {
      newSpos = constrain(mouseY-sheight/2, pos.y, pos.y+size.y);
    }

    if (locked && gamestate != visible) {
      newSpos = constrain(pos.y, pos.y, pos.y+size.y);
    }

    if (abs(newSpos-spos)>1) {
      spos += (newSpos-spos);
    }
  }
  
  //constrain sliders position to a value
  float constrain(float val, float minv, float maxv) {
    return min(max(val, minv), maxv);
  }
  
  //display scrollbar
  void display() {
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
  boolean over() {
    if (mouseX <= pos.x+size.x && mouseX >= pos.x && mouseY <= pos.y+size.y && mouseY >= pos.y) {
      return true;
    } else {
      return false;
    }
  }
}
