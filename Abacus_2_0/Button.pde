boolean toggleColor;
float sizebutton = 200; 


class Button {
  PVector pos, size;
  color col;
  String caption;
  boolean visible=true;

  Button(float x, float y, float sizeX, float sizeY, String txt, color c) {
    pos = new PVector(x, y);
    size = new PVector(sizeX, sizeY);
    caption = txt;
    col = c;
    visible = true;
  }
  
  //metode til at tjekke om musens position er i knappen
  boolean containsMouse(){
    if(mouseX <= size.x && mouseX >= pos.x && mouseY <= size.y && mouseY >= pos.y){
    return true;
    } else {
      return false;
    }    
  }

  void show() {
    rectMode(CORNER);
    fill(col);
    strokeWeight(3);
    float rect1 = pos.x-sizebutton/1.4;
    float rect2 = pos.y-sizebutton/7;
    float rect3 = sizebutton;
    float rect4 = sizebutton/3;
    
    //rect(pos.x-sizebutton/1.4, pos.y-sizebutton/7, sizebutton, sizebutton/3);
    rect(rect1, rect2, rect3, rect4);
    fill(0);
    float fontSize = sizebutton * 0.20;
    textSize(fontSize);
    // float tw = textWidth(caption);
    float tx = pos.x - sizebutton*0.6 ;
    float ty = pos.y + (fontSize / 2);
    text(caption, tx, ty);
  }
}
