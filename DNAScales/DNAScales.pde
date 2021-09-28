void setup() {
  size(500, 500);  //feel free to change the size
  noLoop(); //stops the draw() function from repeating
}
void draw() {
 background(255,255,255);
  int y = 0;
  while (y < 600){
    int x=0;
    while (x < 600){
      scale(x,y);
    x+=100;}
  y = y+=199;}


}
    
void scale(int x, int y) {  //This is to be written as nested loops!!
  strokeWeight(10);
  stroke(32,129,249);
  bezier(x+50,y+0,x+170,y+100,x-70,y+100,x+50,y+200);
  stroke(32,129,249);
  bezier(x+52,y-2,x-70,y+100,x+170,y+100,x+50,y+200);
  
  stroke(217,134,149);  //1
  line(x+34,y+21,x+53,y+21);
  stroke(0,0,149);
  line(x+53,y+21,x+66,y+21);
  
  stroke(220,100,19); //2
  line(x+26,y+40,x+53,y+40);
  stroke(200,200,249);
  line(x+53,y+40,x+74,y+40);
  
  stroke(169,255,149); //3
  line(x+26,y+60,x+53,y+60);
  stroke(255,105,180);
  line(x+53,y+60,x+75,y+60);
  
  stroke(221,160,221); //4
  line(x+34,y+80,x+53,y+80);
  stroke(255,255,102);
  line(x+53,y+80,x+66,y+80);
  
  stroke(217,134,149); //5
  line(x+34,y+121,x+53,y+121);
  stroke(0,0,149);
  line(x+53,y+121,x+66,y+121);
  
  stroke(220,100,19);  //6
  line(x+26,y+140,x+53,y+140);
  stroke(200,200,249);
  line(x+53,y+140,x+74,y+140);
  
  stroke(169,255,149); //7
  line(x+26,y+160,x+53,y+160);
  stroke(255,105,180);
  line(x+53,y+160,x+75,y+160);
  
  stroke(221,160,221);  //8
  line(x+34,y+180,x+53,y+180);
  stroke(255,255,102);
  line(x+53,y+180,x+66,y+180);
  
}

