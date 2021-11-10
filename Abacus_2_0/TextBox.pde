boolean altgr = false;
boolean two = false;
boolean period = false;
boolean AE, OE, AA;
boolean shift;

public class TextBox {

  PVector position, size;
  public int TEXTSIZE = 48;
  public boolean isProtected, visible;

  // COLORS
  public color Background = color(140, 140, 140);
  public color Foreground = color(0, 0, 0);
  public color BackgroundSelected = color(160, 160, 160);
  public color Border = color(30, 30, 30);

  public boolean BorderEnable = false;
  public int BorderWeight = 1;

  public String Text = "";
  public String protectedText = "";
  public int TextLength = 0;

  private boolean selected = false;

  TextBox() {
    // CREATE OBJECT DEFAULT TEXTBOX
  }

  TextBox(PVector position, PVector size, boolean isProtected, boolean visible) {
    this.position = position;
    this.size = size;
    this.isProtected = isProtected;
    this.visible = visible;
  }

  void display() {

    if (visible) {
      // DRAWING THE BACKGROUND
      if (selected) {
        fill(BackgroundSelected);
      } else {
        fill(Background);
      }

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
      
      if (isProtected){
      text(protectedText, position.x + (textWidth("a") / 2), position.y + TEXTSIZE);
      } else {
      text(Text, position.x + (textWidth("a") / 2), position.y + TEXTSIZE);  
      }
      
    } else {
    }
  }

  // IF THE KEYCODE IS ENTER RETURN 1
  // ELSE RETURN 0
  boolean keyWasTyped(char KEY, int KEYCODE) {
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
      boolean isKeyCapitalLetter = (KEY >= 'A' && KEY <= 'Z');
      boolean isKeySmallLetter = (KEY >= 'a' && KEY <= 'z');
      boolean isKeyNumber = (KEY >= '0' && KEY <= '9');



      if (isKeyCapitalLetter || isKeySmallLetter || isKeyNumber) {
        if (isProtected) {
          addProtection('*');
        }
        addText(KEY);
      }
      if (altgr == true && two == true) {
        if (isProtected) {
          addText('*');
        }
        addText('@');
      }
      if (period == true) {
        if (isProtected) {
          addText('*');
        }
        addText('.');
      }
      /*if (AE == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('æ');
       }
       }
       if (OE == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('ø');
       }
       }
       if (AA == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('å');
       }
       }
       
       if (shift && AE == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('Æ');
       }
       }
       if (shift && OE == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('Ø');
       }
       }
       if (shift && AA == true) {
       if (isProtected) {
       addText('*');
       } else {
       addText('Å');
       }
       }*/
    }
  }
  return false;
}

private void addText(char text) {
  // IF THE TEXT WIDHT IS IN BOUNDARIES OF THE TEXTBOX
  if (textWidth(Text + text) < (size.x -size.x/5)) {
    Text += text;
    TextLength++;
  }
}
private void addProtection(char text) {
  if (textWidth(Text + text) < (size.x - size.x/5)) {
    protectedText += text;
  }
}

private void backSpace() {
  if (TextLength - 1 >= 0) {
    Text = Text.substring(0, TextLength - 1);
    TextLength--;
  }
}

// FUNCTION FOR TESTING IS THE POINT
// OVER THE TEXTBOX
private boolean overBox(int x, int y) {
  if (x >= position.x && x <= position.x + size.x) {
    if (y >= position.y && y <= position.y + size.y) {
      return true;
    }
  }

  return false;
}

void pressed(int x, int y) {
  if (overBox(x, y)) {
    selected = true;
  } else {
    selected = false;
  }
}

void clearText() {
  TextLength = 0;
  Text = "";
}
}
