class Poop {
  int x, y, diam, speed;
  PImage poop;

  //constructor
  Poop() {
    x = int(random(width));
    y = -50;
    speed = int(5);
    diam = int(random(30, 90));
    poop = loadImage("poop.png");
  }

  void display() {
    imageMode(CENTER);
    poop.resize(diam, diam);
    imageMode(CENTER);
    image(poop, x, y);
  }

  void move() {
    y += speed;
  }

  boolean reachBottom() {
    if (y>height+5) {
      return true;
    } else {
      return false;
    }
  }
}
