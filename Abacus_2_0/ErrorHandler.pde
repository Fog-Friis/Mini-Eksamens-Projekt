class ErrorHandler {

  int errorType;

  void display() {
    switch (errorType) {
    case 0:
      break;

    case 1:
      break;

    default:
      errorType = 0;
      break;
    }
  }
}
