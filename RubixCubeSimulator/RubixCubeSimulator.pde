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
  int[] newCol = {1, 2};
  System.out.println(twoCube.debugToString());
  threeCube.turnSideCol(0, false);
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
     twoCube.turn((char) key);
  }
  if (MODE == threeByThree) {
    threeCube.turn((char) key);
  }
}

void draw(){
  background(211, 211, 211);
  if (MODE == twoByTwo){
    drawCube(twoCube, 2, 200, width/2, height/2);
  }
  if (MODE == threeByThree){
    drawCube(threeCube, 3, 200, width/2, height/2);
  }
}

void drawFace(RubiksCube cube, int cubeRowLength, int face, float faceSize, float xcoord, float ycoord, int position){
  float squareLength = faceSize/cubeRowLength;
  if (position == 4){
    xcoord += faceSize;
  }
  for (int row = 0; row < cubeRowLength; row++){
    for(int col = 0; col < cubeRowLength; col++){
      fill(cube.getColor(face, row, col));
      if (position == 0){
        square(xcoord + (squareLength * col), ycoord + (row * squareLength), squareLength);
      }
      else if (position == 1){
        square(xcoord - (squareLength * row), ycoord + (col * squareLength), squareLength);
      }
      else if (position == 2){
        square(xcoord + (squareLength * col), ycoord - (row * squareLength), squareLength);
      }
      else if (position == 3){
        square(xcoord + (squareLength * row), ycoord + (col * squareLength), squareLength);
      }
      else if (position == 4){
        square(xcoord - (squareLength * col), ycoord + (row * squareLength), squareLength);
      }
  }
}
}

void drawCube(RubiksCube cube, int cubeRowLength, float faceSize, float xcoord, float ycoord){
  xcoord -= faceSize;
  ycoord -= faceSize/2;
  drawFace(cube, cubeRowLength, 0, faceSize, xcoord, ycoord, 0);
  drawFace(cube, cubeRowLength, 1, faceSize, xcoord  - faceSize/cubeRowLength, ycoord, 1);
  drawFace(cube, cubeRowLength, 2, faceSize, xcoord, ycoord - faceSize/cubeRowLength, 2);
  drawFace(cube, cubeRowLength, 3, faceSize, xcoord + faceSize, ycoord, 3);
  drawFace(cube, cubeRowLength, 4, faceSize, xcoord, ycoord + faceSize, 0);
  drawFace(cube, cubeRowLength, 5, faceSize, xcoord + (faceSize * 2) - faceSize/cubeRowLength, ycoord, 4);
}
