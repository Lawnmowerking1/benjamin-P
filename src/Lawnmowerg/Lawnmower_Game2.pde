//Benjamin Bigwood | 11/28/2022 | Space game
import processing.sound.*;
SoundFile bullet;
Lawnmower s1;
Timer poopTimer, powerUpTimer;
ArrayList<Poop> poops = new ArrayList<Poop>();
ArrayList<PowerUp> powerUps = new ArrayList<PowerUp>();
ArrayList<gun> guns = new ArrayList<gun>();
Grass[] grass = new Grass[100];
int score, level, poopCount, gunCount, rocksPassed;
boolean play;
void setup() {
  size(700, 700);
  bullet = new SoundFile(this, "shotgun-firing-4-6746_01.wav");
  s1 = new Lawnmower();
  poopTimer = new Timer(1000);
  poopTimer.start();
  powerUpTimer = new Timer(5000);
  powerUpTimer.start();
  for (int i=0; i<grass.length; i++) {
    grass[i] = new Grass();
  }
  score = 0;
  level = 1;
  poopCount = 0;
  gunCount = 1;
  rocksPassed = 0;
  play = false;
}

void draw() {
  level=int(score/10);
  if (!play) {
    startScreen();
  } else {
    //game over
    if (s1.health<0 || rocksPassed>9) {
      gameOver();
    } else {

      background(125, 255, 20);
      //rendering grass
      for (int i=0; i<grass.length; i++) {
        grass[i].display();
        grass[i].move();
      }
      infoPanel();
      noCursor();
      //add poops,powerups
      if (powerUpTimer.isFinished()) {
        powerUps.add(new PowerUp());
        powerUpTimer.start();
      }
      //rendering PowerUps on screen detecting ship collision
      for (int i = 0; i < powerUps.size(); i++) {
        PowerUp pu = powerUps.get(i);
        //hitting poops
        if (pu.intersect(s1)) {
          if(pu.type == 'H') {
           s1.health+=10;
          }else if(pu.type == 'A') {
           s1.ammo+=100;
          }else {
           s1.turretCount++; 
          }
          //todo: add sound of explosion
          //todo: add animation of explosion
          //todo: visual effect on the ship
          powerUps.remove(pu);
        }
        if (pu.reachBottom()) {
          powerUps.remove(pu);
          println(powerUps.size());
        } else {
          pu.display();
          pu.move();
        }
      }
      //rendering poops
         if (poopTimer.isFinished()) {
        poops.add(new Poop());
        poopTimer.start();
      }
      for (int i = 0; i < poops.size(); i++) {
        Poop p = poops.get(i);
        //hitting poops
        if (s1.intersect(p)) {
          s1.health-=p.diam/3;
          score-=p.diam;
          //todo: add sound of explosion
          //todo: add animation of explosion
          //todo: visual effect on the ship
          poops.remove(p);
        }
        if (p.reachBottom()) {
          poops.remove(p);
          println(poops.size());
        } else {
          p.display();
          p.move();
        }
      }
//render Gun on screen
      for (int i = 0; i < guns.size(); i++) {
        gun g = guns.get(i);
        for (int t = 0; t < poops.size(); t++) {
          Poop r = poops.get(t);
          if (g.intersect(r)) {
            score+= 1;
            poops.remove(t);
            guns.remove(g);
          }
          if (g.reachTop()) {
            poops.remove(g);
            println(poops.size());
          }
          g.display();
          g.move();
        }
      }
      s1.display();  
      s1.move(mouseX, mouseY);
    }
  }
}
void mousePressed() {
  bullet.stop();
  bullet.play();
  guns.add(new gun(s1.x, s1.y));
  if (s1.fire()&&s1.turretCount == 1) {
    guns.add(new gun(s1.x, s1.y));
    println("gun" + guns.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    guns.add(new gun(s1.x+20, s1.y));
    guns.add(new gun(s1.x-20, s1.y));
    println("gun" + guns.size());
  } else if (s1.fire()&&s1.turretCount == 3) {
    guns.add(new gun(s1.x+20, s1.y));
    guns.add(new gun(s1.x-20, s1.y));
    guns.add(new gun(s1.x, s1.y));
    println("gun" + guns.size());
  } else if (s1.fire()&&s1.turretCount == 4) {
    guns.add(new gun(s1.x+20, s1.y));
    guns.add(new gun(s1.x-20, s1.y));
    guns.add(new gun(s1.x+40, s1.y));
    guns.add(new gun(s1.x-40, s1.y));
    println("gun" + guns.size());
  } else if (s1.fire()&&s1.turretCount == 5) {
    guns.add(new gun(s1.x+20, s1.y));
    guns.add(new gun(s1.x-20, s1.y));
    guns.add(new gun(s1.x+40, s1.y));
    guns.add(new gun(s1.x-40, s1.y));
    guns.add(new gun(s1.x, s1.y));
    println("gun" + guns.size());
  }
}
void keyPressed() {
  if (s1.ammo<1) {
    noLoop();}
  if (key == 1) {
    if (s1.fire()&&s1.turretCount == 1) {
      guns.add(new gun(s1.x, s1.y));
      println("gun" + guns.size());
    } else if (s1.fire() && s1.turretCount == 2) {
      guns.add(new gun(s1.x+20, s1.y));
      guns.add(new gun(s1.x-20, s1.y));
      println("gun" + guns.size());
    } else if (s1.fire()&&s1.turretCount == 3) {
      guns.add(new gun(s1.x+20, s1.y));
      guns.add(new gun(s1.x-20, s1.y));
      guns.add(new gun(s1.x, s1.y));
      println("gun" + guns.size());
    } else if (s1.fire()&&s1.turretCount == 4) {
      guns.add(new gun(s1.x+20, s1.y));
      guns.add(new gun(s1.x-20, s1.y));
      guns.add(new gun(s1.x+40, s1.y));
      guns.add(new gun(s1.x-40, s1.y));
      println("gun" + guns.size());
    } else if (s1.fire()&&s1.turretCount == 5) {
      guns.add(new gun(s1.x+20, s1.y));
      guns.add(new gun(s1.x-20, s1.y));
      guns.add(new gun(s1.x+40, s1.y));
      guns.add(new gun(s1.x-40, s1.y));
      guns.add(new gun(s1.x, s1.y));
      println("gun" + guns.size());
    }
  }
}
void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255, 200, 0);
  textSize(15);
  textAlign(CENTER);
  text("Health:" + s1.health +"SPACEGAME" + " | Level:" + level + " | Score:" + score + " | Ammo: " + s1.ammo, width/2, 35);
}

void startScreen() {
  background(127);
  fill(255);
  textAlign(CENTER);
  text("Click or press any key to start ", width/2, height/2);
  if (mousePressed | keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(127);
  fill(255);
  textAlign(CENTER);
  text("Game Over :(" + "Score:" + score , width/2, height/2);
  if (mousePressed | keyPressed) {
    play = false;
    noLoop();
  }
}
