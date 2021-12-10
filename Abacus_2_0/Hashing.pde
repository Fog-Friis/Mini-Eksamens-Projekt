import java.security.*;
String outputString;

void hashing(String Text){
  try {
  MessageDigest md = MessageDigest.getInstance("SHA-256"); 
  
  String inputTekst = Text;
    
  md.update(inputTekst.getBytes());    

  byte[] byteList = md.digest();
  
  StringBuffer hashedValueBuffer = new StringBuffer();
  for (byte b : byteList)hashedValueBuffer.append(hex(b)); 
  
  outputString = hashedValueBuffer.toString();
  //println("Den orindelige tekst: "+ inputTekst);
  //println("SHA-256 værdien af teksten: " +hashedValueBuffer);
  
}
catch (Exception e) {
  //System.out.println("Exception: "+e);
}

}
