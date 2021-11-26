Game1 game1;

void setup(){
  fullScreen();
  game1 = new Game1();
  game1.initiate();
}

void keyPressed(){
  game1.pressKey();
}

void keyReleased(){
  game1.releaseKey();
}

void mouseClicked() {
  game1.clickMouse();
}

void mousePressed(){
  game1.pressMouse();
}

void mouseWheel(MouseEvent e){
  
}

void mouseReleased(){
  
}

void draw(){
  background(255);
  game1.display();
}
