class ErrorHandler {

  int errorType;
  
  void update(){
    if (regUserTB.TextLength == 0) {
      errorType = 1;
    } else if (regEmailTB.TextLength == 0) {
      errorType = 2;
    } else if (regPassword1.TextLength == 0) {
      errorType = 3;
    } else if (regPassword2.TextLength == 0) {
      errorType = 4;
    } else if (logUserTB.TextLength == 0) {
      errorType = 5;
    } else if (logPasswordTB.TextLength == 0) {
      errorType = 6;
    } else {
      errorType = 0;
    }
  }

  void display() {

    fill(255, 0, 0);

    switch (errorType) {
    case 0:
      break;

    case 1:
    text("Error, please type username.", width / 4, 9*height / 10);
      break;

    case 2:
    text("Error, please type username.", width / 4, 9*height / 10);
      break;

    case 3:
    text("Error, please type username.", width / 4, 9*height / 10);
      break;

    case 4:
    text("Error, please type username.", width / 4, 9*height / 10);
      break;

    case 5:
    text("Error, please type username.", width / 4, 9*height / 10);
      break;

    case 6:
    text("Error, please type username.", width / 4, 9*height / 10);
      break;

    default:
      errorType = 0;
      break;
    }

    fill(0, 0, 0);
  }
}
