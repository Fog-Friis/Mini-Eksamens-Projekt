ArrayList<TextBox> textBoxes = new ArrayList<TextBox>();

class Game1 {

  void initiate() {
  }

  void pressKey() {
    for (TextBox t : textBoxes) {
      if (t.keyWasTyped(key, (int)keyCode)) {
      }
    }
    if (keyCode == 46) {
      period = true;
    }
  }

  void releaseKey() {
    if (keyCode == 46) {
      period = false;
    }
  }

  void display() {
  }
}
