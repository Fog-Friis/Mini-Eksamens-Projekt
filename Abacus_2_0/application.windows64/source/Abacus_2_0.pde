Game1 game1;

void setup() {
  fullScreen();
  game1 = new Game1();
  game1.initiate();
}

void keyPressed() {
  game1.pressKey();
}

void keyReleased() {
  game1.releaseKey();
}

void mousePressed() {
  game1.pressMouse();
}

/*void mouseWheel(MouseEvent e){
 for (DropdownMenu d : dropdownMenus) {
 if (d.objects.size() > d.shownObjects-1 && d.overObjects() == true) {
 d.scroll = e.getCount();
 }
 }
 }*/

void mouseReleased() {
  game1.releaseMouse();
}

void draw() {
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
