class Button {
  //member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on;

  //Construtor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(127,500,300);
    c2 = color(127,400,200);
    on = false;
  }
  //visiual aspects
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rectMode(CENTER);
    rect(x, y, w, h);
    fill(17);
    textAlign(CENTER);
    if (val == 'c') {
      text("CLEAR" ,x,y+5);
    }else if(val == 's') {
      text ("x²",x,y+5);
    }else {
      text(val, x,y+5);
    }
  }

  void hover(int mx, int my) {
    on = (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2);
  }
}
