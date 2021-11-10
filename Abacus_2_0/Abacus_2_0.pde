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

void draw(){
  game1.display();
}
