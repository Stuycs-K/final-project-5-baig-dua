static int twoByTwo = 0;
static int threeByThree = 1;
static int MODE = twoByTwo;
Cube2x2 twoCube;
Cube3x3 threeCube;

void setup(){
  twoCube = new Cube2x2();
  threeCube = new Cube3x3();
  drawCube(twoCube);
}

void mouseClicked() {
}

void draw(){}

void drawCube(RubiksCube cube){
  if (MODE == twoByTwo){
      square(0, 0, 50);
  }
}
