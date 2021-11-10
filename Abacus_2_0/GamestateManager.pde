int gamestate;

class GameStateManager{
  
  void setupManager(){
    
  }
  
  
  //start teacher screens at case 100
  void manage(){
    switch(gamestate){
      case 0:
      LoginScreen();
      break;
      
      case 1:
      RegisterScreen();
      break;
      
      case 2:      
      break;
      
      case 3:
      break;
      
      case 4:
      break;
      
      default:
      gamestate = 0;
      break;
    }
  }  
  
  void LoginScreen(){
    
  }
  
  void RegisterScreen(){
    
  }
  
  void StudentMenu(){
  }
  
  void TeacherMenu(){
  }
}
