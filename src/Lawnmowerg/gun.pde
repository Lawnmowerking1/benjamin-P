class gun {
  int x, y, w, h, speed;
  color c1;

  //constructor
  gun(int x, int y) {
    this.x = x;
    this.y = y;
    w = 4;
    h = 10;
    speed = 10;
    c1 = color(124);
  }

  void display() {
    rectMode(CENTER);
    noStroke();
    fill(c1);
    rect(x, y, w, h);
  }

  void move() {

    y -= speed;
  }

  boolean reachTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Poop poop) {
    float d = dist(x, y, poop.x, poop.y);
    if (d<poop.diam/2) {
      return true;
    } else {
      return false;
    }
  }
}
