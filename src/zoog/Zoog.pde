// Benjamin Bigwood | 9/sept 2022 | Zoog

void setup() {
  size(900,500);
  
  


}
void draw() {
 //background(random(255),random(255),random(255));
  ellipseMode(CENTER);
  rectMode(CENTER);
  zoog(mouseX,mouseY);
  zoog(random(width),random(height));
}

void zoog(float x, float y) {
  // Draw Zoogs Body
  stroke(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
  rect(x,y,20,100);
  
  
  //Draw Zoog's head
  stroke(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
  ellipse(x,y-30,60,60);
  
  
  //Draw Zoog's eyes
  stroke(random(255),random(255),random(255));
  fill(random(255),random(255),random(255));
  ellipse(x-19,y-30,16,32);
  ellipse(x+19,y-30,16,32);
  
  
  //draw Zoog's Legs
  fill(random(255),random(255),random(255));
  line(x-10,y+50,x-20,y+60);
  line(x+10,y+50,x+20,y+60);
}
