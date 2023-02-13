class Lawnmower {
  int x, y, w, ammo, turretCount, health;
  PImage lawnmower;
  // constructor
  Lawnmower() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 100;
    turretCount = 1;
    health = 100;
    lawnmower = loadImage ("lawnmower.png");
  }

  void display() {
    imageMode(CENTER);
    image(lawnmower, x, y);
    noCursor();
  }
  void move(int tempx, int tempy) {
    x = tempx;
    y = tempy;
  }

  void move() {
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Poop poop) {
    float d = dist(x, y, poop.x, poop.y);
    if (d<20) {
      return true;
    } else {
      return false;
    }
  }
}
