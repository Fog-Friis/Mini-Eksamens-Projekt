  int errorType;

class ErrorHandler {
  
  String errorText = "";
  
  void loginUpdate(){
    
    if(logUserTB.TextLength == 0){
      errorType = 1;
    } else if (logPasswordTB.TextLength == 0) {  
      errorType = 2;      
    } else {
      errorType = 0;
    }
  }
  
  void registerUpdate(){
    if (regUserLaererTB.TextLength == 0) {
      errorType = 3;
    } else if (regLaererID.TextLength == 0) {
      errorType = 4;
    } else if (regPasswordLaerer1.TextLength == 0) {
      errorType = 5;
    } else if (regPasswordLaerer2.TextLength == 0) {
      errorType = 6;
    } else if(regPasswordLaerer1.Text != regPasswordLaerer2.Text){
      errorType = 7;
    } else {
      errorType = 0;
    }
  }

  void display() {

    switch (errorType) {
    case 0:
    errorText = "";
      break;

    case 1:
    errorText = "Error, please type username.";
      break;

    case 2:
    errorText = "Error, please type password.";
      break;

    case 3:
    errorText = "Error, please type username.";
      break;

    case 4:
    errorText = "Error, please type email.";
      break;

    case 5:
    errorText = "Error, please type password.";
      break;

    case 6:
    errorText = "Error, please confirm password.";
      break;
      
    case 7:
    errorText = "Error, passwords don't match";
      break;

    default:
      errorType = 0;
      break;
    }
    
    fill(255, 0, 0);
    text(errorText, width / 4, 9 * height / 10);
    fill(0, 0, 0);
  }
}
