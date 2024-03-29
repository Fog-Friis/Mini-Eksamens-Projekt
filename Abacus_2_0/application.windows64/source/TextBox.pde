class TextBox {

  //position and size
  PVector position, size;
  float scroll;

  //visibility
  int visible;

  //colors
  public color Background = color(140, 140, 140);
  public color Foreground = color(0, 0, 0);
  public color BackgroundSelected = color(160, 160, 160);
  public color Border = color(30, 30, 30);

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
  void display() {
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
  boolean keyWasTyped(char KEY, int KEYCODE) {

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
  void pressed(int x, int y) {
    if (overBox(x, y)) {
      selected = true;
    } else {
      selected = false;
    }
  }

  //remove all text
  void clearText() {
    TextLength = 0;
    Text = "";
    protectedTextLength = 0;
    protectedText = "";
  }
}
