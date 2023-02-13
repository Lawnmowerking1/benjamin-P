class Grass {
  int x, y, diam, speed;
  color c1;
  //color fcolor;
  //constructor
  Grass() {
    x = int(random(width));
    y = int(random(width));
    diam = int(random(1, 10));
    speed = 5;
    c1 = color(0,random(200,255),0);
  }

  void display( ) {
    noStroke();
    fill(c1);
    rect(x, y, diam, diam);
  }

  void move() {
    if (y>height+5) {
      y = -5;
    } else {
      y += speed;
    }
  }
}
