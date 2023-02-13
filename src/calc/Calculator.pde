// Benjamin Bigwood | Nov 2022| Calc project
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
boolean left = true;
float l, r, result;
char op = ' ';


void setup() {
  size(400, 380);
  numButtons[0] = new Button(200, 340, 80, 80, '0');
  numButtons[1] = new Button(120, 100, 80, 80, '1');
  numButtons[2] = new Button(200, 100, 80, 80, '2');
  numButtons[3] = new Button(280, 100, 80, 80, '3');
  numButtons[4] = new Button(120, 180, 80, 80, '4');
  numButtons[5] = new Button(200, 180, 80, 80, '5');
  numButtons[6] = new Button(280, 180, 80, 80, '6');
  numButtons[7] = new Button(120, 260, 80, 80, '7');
  numButtons[8] = new Button(200, 260, 80, 80, '8');
  numButtons[9] = new Button(280, 260, 80, 80, '9');
  opButtons[0] = new Button(360, 100, 80, 80, '-');
  opButtons[1] = new Button(360, 180, 80, 80, '+');
  opButtons[2] = new Button(360, 260, 80, 80, '÷');
  opButtons[3] = new Button(40, 290, 80, 60, '√');
  opButtons[4] = new Button(40, 240, 80, 50, '>');
  opButtons[5] = new Button(40, 190, 80, 50, 's');
  opButtons[6] = new Button(360, 340, 80, 80, 'X');
  opButtons[7] = new Button(280, 340, 80, 80, '=');
  opButtons[8] = new Button(120, 340, 80, 80, 'c');
  opButtons[9] = new Button(40, 90, 80, 60, 'π');
  opButtons[10] = new Button(40, 140, 80, 50, '±');
  opButtons[11] = new Button(40, 350, 80, 60, '.');
}

void draw() {
  background(50);
  for (int i = 0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }

  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}
void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'c') {
      handleEvent(str(opButtons[i].val), false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      op = '+';
      dVal = "+";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'X') {
      op = 'X';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      op = '-';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == '÷') {
      op = '÷';
      dVal = "0.0";
      left = false;
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l = l*PI;
        dVal = str(l);
      } else {
        r = r*PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l = l/l;
        dVal = str(l);
      } else {
        r = r/r;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == 's') {
      if (left) {
        l = l*l;
        dVal = str(l);
      } else {
        r = r*r;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l = l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
      println("l:" + l + " r:" + r + " op:" + op + " result:" + result + "left:" + left);
    }
  }
}
void updateDisplay() {
  fill(200 );
  rect(199, 20, 405, 50);
  fill(255);
  textSize(30);
  textAlign(RIGHT);
  if (dVal.length() < 19) {
    textSize(30);
  } else {
    textSize(30);
  }
  text(dVal, width-100, 30);
}

void keyPressed() {
  println("key:" + key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  }else if(keyCode == 46 || keyCode == 110){
  handleEvent(".",false);
  }else if(keyCode == 50 || keyCode == 98){
  handleEvent("2",true);
  }else if(keyCode == 51 || keyCode == 99){
  handleEvent("3",true);
  }else if(keyCode == 52 || keyCode == 100){
  handleEvent("4",true);
  }else if(keyCode == 53 || keyCode == 101){
  handleEvent("5",true);
  }else if(keyCode == 54 || keyCode == 102){
  handleEvent("6",true);
  }else if(keyCode == 55 || keyCode == 103){
  handleEvent("7",true);
  }else if(keyCode == 56 || keyCode == 104){
  handleEvent("8",true);
  }else if(keyCode == 57 || keyCode == 105){
  handleEvent("9",true);
  }
}

void handleEvent(String val, boolean num) {
  if (num && dVal.length() <19) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal +=  val;
    }
    if (left) {
      l = float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("c")) {
    dVal = "0.0";
    left = true;
    l = 0.0;
    r = 0.0;
    result = 0.0;
    op = ' ';
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    } else if(val.equals("+")) {
    op = '+';
      dVal = "+";
      left = false;
    }
  }
}
void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == 'X') {
    result = l * r;
  } else if (op == '÷') {
    result = l / r;
  }
  //else if (op == '.') {
  //    result = l

  dVal = str(result);
  l = result;
  left = true;
}
