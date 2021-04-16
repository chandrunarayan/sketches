// The Nature of Code
// Daniel Shiffman
// http://natureofcode.com

int now = millis();

int passedTime = millis() - now;
int count = 0;
int bc = 32, ec = 126;   // ASCI space to ~
while (passedTime < 50000) {
  passedTime = millis() - now;
  count++;
  if ((char)random(bc, ec) == 'c' && 
    (char)random(bc, ec) == 'h' &&
    //(char)random(bc, ec) == 'a' &&
    //(char)random(bc, ec) == 'n' &&
    //(char)random(bc, ec) == 'd' &&   
    //(char)random(bc, ec) == 'r' &&
    //(char)random(bc, ec) == 'u' &&     
    (char)random(bc, ec) == '!'
    ) {
    print("found after ");
    break;
  }
}
println(" " + passedTime/1000 + " seconds and " + count + " tries");
