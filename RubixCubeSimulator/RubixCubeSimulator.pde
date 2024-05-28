import java.util.Arrays;
static int twoByTwo = 0;
static int threeByThree = 1;
static int MODE = twoByTwo;
Cube2x2 twoCube;
Cube3x3 threeCube;

void setup(){
  twoCube = new Cube2x2();
  threeCube = new Cube3x3();
  int[] newCol = {1, 2};
  System.out.print(twoCube.debugToString());
  twoCube.checkIfSolved();
  System.out.println(twoCube.getSolved());
}

void mouseClicked() {
}

void draw(){}

void drawCube(RubiksCube cube){
  if (MODE == twoByTwo){
      square(0, 0, 50);
  }
}
