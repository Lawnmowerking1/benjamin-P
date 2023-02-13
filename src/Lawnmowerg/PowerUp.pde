class PowerUp {
  int x, y, diam, speed;
  char type;

  //constructor
  PowerUp() {
    x = int(random(width));
    y = -50;
    speed = int(5);
    diam = int(random(30, 90));
    int rand = int(random(3));
    if (rand == 0) {
      type = 'A';
    } else if (rand == 1) {
      type = 'H';
    } else {
      type = 'T';
    }
  }

  void display() {
    fill(0, 222, 0);
    ellipse(x, y, diam, diam);
    fill(0);
    text(type, x, y);
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
  boolean intersect(Lawnmower lawnmower) {
    float d = dist(x, y, lawnmower.x, lawnmower.y);
    if (d<20) {
      return true;
    }else {
    return false;
    }
  }
}
