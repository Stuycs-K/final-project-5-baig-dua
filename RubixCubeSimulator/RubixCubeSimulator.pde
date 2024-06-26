import java.util.*;
static int twoByTwo = 0;
static int threeByThree = 1;
static int MODE = twoByTwo;
Cube2x2 twoCube;
Cube3x3 threeCube;

void setup(){
  size(1200, 900);
  twoCube = new Cube2x2();
  threeCube = new Cube3x3();
}

void mouseClicked() {
  if (MODE == twoByTwo){
    twoCube.reset();
  } 
  if (MODE == threeByThree){
    threeCube.reset();
  }
}

void keyPressed() {
  if (key == ' ' ){
    MODE = (MODE + 1) % 2;
  }
  if (key == 's'){
    if (MODE == twoByTwo){
      twoCube.scramble();
    }
    if (MODE == threeByThree){
      threeCube.scramble();
    }
  }
  if (MODE == twoByTwo) {
     twoCube.turn((char) key, true);
  }
  if (MODE == threeByThree) {
    threeCube.turn((char) key, true);
  }
}

void draw(){
  background(211, 211, 211);
  if (MODE == twoByTwo){
    twoCube.drawCube(200, width/2, height/2, 5);
  }
  if (MODE == threeByThree){
    threeCube.drawCube(200, width/2, height/2, 5);
  }
}
