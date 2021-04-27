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
  char c1 = (char) random(bc, ec); char c2 = (char) random(bc, ec); char c3 = (char) random(bc, ec);
  char c4 = (char) random(bc, ec); char c5 = (char) random(bc, ec); char c6 = (char) random(bc, ec);
  char c7 = (char) random(bc, ec); char c8 = (char) random(bc, ec); char c9 = (char) random(bc, ec);
  if (c1 == 'B' && 
    c2 == 'u' &&
    //c3 == 's' &&
    //c4 == 'h' &&
    //c4 == 'd' &&   
    //c5 == 'r' &&
    //c6 == 'u' &&     
    c7 == '!'
    ) {
    println(" found after " + passedTime/1000 + " seconds and " + count + " tries");
    break;
  } else System.out.format("%c%c%c%c%c\n", c1,c2,c3,c4,c7);
}
