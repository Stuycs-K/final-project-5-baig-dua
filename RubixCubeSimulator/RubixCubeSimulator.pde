import java.util.Arrays;
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
  twoCube
  drawCube(twoCube, 2, 200, width/2, height/2);
}

void mouseClicked() {
}

void draw(){

}

void drawCubeFace(RubiksCube cube, int cubeRowLength, int face, float faceSize, float xcoord, float ycoord){
  float squareLength = faceSize/cubeRowLength;
  for (int i = 0; i < cubeRowLength; i++){
    for(int j = 0; j < cubeRowLength; j++){
      fill(cube.getColor(face, i, j));
      square(xcoord + (squareLength * i), ycoord + (j * squareLength), squareLength);
    }
  }
}

void drawCube(RubiksCube cube, int cubeRowLength, float faceSize, float xcoord, float ycoord){
  xcoord -= faceSize;
  ycoord -= faceSize/2;
  drawCubeFace(cube, cubeRowLength, 0, faceSize, xcoord, ycoord);
  drawCubeFace(cube, cubeRowLength, 1, faceSize, xcoord  - faceSize, ycoord);
  drawCubeFace(cube, cubeRowLength, 2, faceSize, xcoord, ycoord + faceSize);
  drawCubeFace(cube, cubeRowLength, 3, faceSize, xcoord + faceSize, ycoord);
  drawCubeFace(cube, cubeRowLength, 4, faceSize, xcoord, ycoord - faceSize);
  drawCubeFace(cube, cubeRowLength, 5, faceSize, xcoord + (faceSize * 2), ycoord);
}
