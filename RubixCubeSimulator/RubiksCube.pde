import java.util.*; 
abstract class RubiksCube {
  private int[][][] cube;
  private boolean solved;
  private LastMovesList lastTenMoves;
  public final int RED = color(255, 0, 0);
  public final int GREEN = color(0, 255, 0);
  public final int WHITE = color(255, 255, 255);
  public final int BLUE = color(0, 0, 255);
  public final int YELLOW = color(255, 255, 0);
  public final int ORANGE = color(255, 121, 0);
  public int[] cubeColors = {WHITE, ORANGE, BLUE, RED, GREEN, YELLOW};

  //constructor
  public RubiksCube(int size) {
    solved = true;
    cube = new int[cubeColors.length][size][size];
    for (int i = 0; i < cube.length; i++) {
      for (int j = 0; j < cube[i].length; j++) {
        for (int k = 0; k < cube[i][j].length; k++) {
          cube[i][j][k] = cubeColors[i];
        }
      }
    }
    lastTenMoves = new LastMovesList(10);
    boolean timer = false;
  }

  public int[][] getFace(int face) {
    return cube[face];
  }

  public int[] getRows(int face, int row) {
    return cube[face][row];
  }

  public int[] getCols(int face, int col) {
    int[] column = new int[cube[face].length];
    for (int i = 0; i < column.length; i++) {
      column[i] = cube[face][i][col];
    }
    return column;
  }

  public int getColor(int face, int row, int col) {
    return cube[face][row][col];
  }

  public boolean getSolved() {
    return solved;
  }

  public void checkIfSolved() {
    boolean wrongPos = false;
    int firstColor;
    for (int i = 0; i < cube.length; i++) {
      firstColor = cube[i][0][0];
      for (int j = 0; j < cube[i].length; j++) {
        for (int k = 0; k < cube[i][j].length; k++) {
          if (cube[i][j][k] != firstColor) {
            wrongPos = true;
            break;
          }
        }
        if (wrongPos) {
          break;
        }
        if (wrongPos) {
          break;
        }
      }
    }
    solved = !wrongPos;
  }

  private int[] replaceCol(int face, int col, int[] newCol) {
    int[] ogCol = new int[cube[face].length];
    for (int i = 0; i < cube[face].length; i++){
      ogCol[i] = cube[face][i][col];
      cube[face][i][col] = newCol[i];
    }
    return ogCol;
  }
  
  private int[] reverseCol(int[] currCol){
    int[] reverseArr = new int [cube[0].length];
    for (int i = 0; i < currCol.length; i++){
      reverseArr[i] = currCol[(currCol.length - 1) - i];
    }
    return reverseArr;
  }
  
  private int[] replaceRow(int face, int row, int[] newRow){
    int[] ogRow = cube[face][row].clone();
    cube[face][row] = newRow;
    return ogRow;
  }
  
  public String debugToString(){
    String cubeStr = "";
    for (int i = 0; i < cube.length; i++) {
      for (int j = 0; j < cube[i].length; j++) {
        cubeStr += Arrays.toString(cube[i][j]) + "\n";
      }  
      cubeStr += "\n";
    }
    return cubeStr;
  }
  
  public void reset(){
    for (int i = 0; i < cube.length; i++) {
      for (int j = 0; j < cube[i].length; j++) {
        for (int k = 0; k < cube[i][j].length; k++) {
          cube[i][j][k] = cubeColors[i];
        }
      }
    }
    lastTenMoves.clear();
  }
  
  
  public void turnRow(int row, boolean clockwise){
    int[] tempRow;
    int swapIndex;
    if (clockwise){
      swapIndex = 1;
      tempRow = getRows(1, row);
      for (int i = 1; i < cube.length - 1; i++){ 
        swapIndex++;
        if (swapIndex >= cube.length - 1){
          swapIndex = 1;
        }
        if (swapIndex == 2 || swapIndex == 4) {
          tempRow = this.reverseCol(tempRow);
        }
        tempRow = replaceRow(swapIndex, row, tempRow);
     }
    }
    else {
      swapIndex = 4;
      tempRow = getRows(4, row);
      for (int i = 4; i > 0; i--){
        swapIndex--;
        if (swapIndex <= 0){
          swapIndex = 4;
        }
        if (swapIndex == 1 || swapIndex == 3) {
          tempRow = this.reverseCol(tempRow);
        }
        tempRow = replaceRow(swapIndex, row, tempRow);
      }
    }
  }


  public void turnFrontCol(int col, boolean clockwise){
    int[] tempCol;
    int[] colIndex = new int[]{4, 0, 2, 5};
    int swapIndex;
    if (clockwise){
      swapIndex = colIndex[0];
      tempCol = this.getCols(swapIndex, col);
      for (int i = 0; i < colIndex.length; i++){
          swapIndex = colIndex[(i+1) % 4];
        tempCol = this.replaceCol(swapIndex, col, tempCol);
        if (swapIndex == 0 || swapIndex == 5){
          tempCol = this.reverseCol(tempCol);
        }
      }
    }
    else{
      swapIndex = colIndex[colIndex.length - 1];
      tempCol = this.getCols(swapIndex, col);
      for (int i = colIndex.length - 1; i >= 0; i--){
        if (i == 0){
          swapIndex = colIndex[colIndex.length - 1];
        }
        else {
          swapIndex = colIndex[i - 1];
        }
        if (swapIndex == 0 || swapIndex == 5){
          tempCol = this.reverseCol(tempCol);
        }
        tempCol = this.replaceCol(swapIndex, col, tempCol);
      }
    }
  }
  
  public void turnSideCol(int col, boolean clockwise){
    int[] tempCol;
    int[] colIndex = new int[]{1, 0, 3, 5};
    int swapIndex;
    if (clockwise){
      swapIndex = colIndex[0];
      tempCol = this.getCols(swapIndex, col);
      for (int i = 0; i < colIndex.length; i++){
        swapIndex = colIndex[(i+1) % 4];
        if (swapIndex == 0 || swapIndex == 5){
          tempCol = this.reverseCol(tempCol);
          tempCol = this.replaceRow(swapIndex, col, tempCol);
        }
        else{
          tempCol = this.replaceCol(swapIndex, col, tempCol);
        }
      }
    }
    else{
      swapIndex = colIndex[colIndex.length - 1];
      tempCol = this.getRows(swapIndex, col);
      for (int i = colIndex.length - 1; i >= 0; i--){
       if (i == 0){
          swapIndex = colIndex[colIndex.length - 1];
       }
       else {
          swapIndex = colIndex[i - 1];
       }
       if (swapIndex == 1 || swapIndex == 3){
         tempCol = this.reverseCol(tempCol);
         tempCol = this.replaceCol(swapIndex, col, tempCol);
       }
       else {
         tempCol = this.replaceRow(swapIndex, col, tempCol);
       }
      }
    }
  }
  
  public void turnFace(int face, boolean clockwise){
    int[][] faceCols = new int[cube[face].length][cube[face].length];
    if (clockwise){
      for (int i = 0; i < cube[face].length; i++){
        faceCols[i] = this.reverseCol(this.getCols(face, i));
      }
      for (int i = 0; i < faceCols.length; i++){
        this.replaceRow(face, i, faceCols[i]);
      }
    }
    else {
      for (int i = 0; i < cube[face].length; i++){
        faceCols[i] = this.getCols(face, i);
      }
      for (int i = cube[face].length - 1; i >= 0; i--){
          this.replaceRow(face, i, faceCols[(faceCols.length - 1) - i]);
      }
   }
  }
  
  public void turn(char input, boolean addToList){
    boolean clockwise;
    String turn = ""; 
    if (input > 'Z'){
      clockwise = true;
    }
    else{
      clockwise = false;
    }
    if (addToList && this.validInput(input)){
      turn += Character.toUpperCase(input);
      if (!clockwise){
        turn += "\'";
      }
      lastTenMoves.add(turn);
    }
    if (Character.toLowerCase(input) == 'r'){
      this.turnFrontCol(cube[0].length - 1, clockwise);
      this.turnFace(3, !clockwise);
    }
    else if (Character.toLowerCase(input) == 'l'){
      this.turnFrontCol(0, !clockwise);
      this.turnFace(1, clockwise);
    }
    else if (Character.toLowerCase(input) == 'u'){
      this.turnRow(0, clockwise);
      this.turnFace(0, clockwise);
    }
    else if (Character.toLowerCase(input) == 'd'){
      this.turnRow(cube[0].length - 1, !clockwise);
      this.turnFace(5, !clockwise);
    }
    else if (Character.toLowerCase(input) == 'f'){
      this.turnFace(4, clockwise);
      this.turnSideCol(cube[0].length - 1, clockwise);
    }
    else if (Character.toLowerCase(input) == 'b'){
      this.turnFace(2, !clockwise);
      this.turnSideCol(0, !clockwise);
    }
    this.checkIfSolved();

  }
  
  private boolean validInput(char input){
    return Character.toLowerCase(input) == 'r' || Character.toLowerCase(input) == 'l' || Character.toLowerCase(input) == 'u' 
    || Character.toLowerCase(input) == 'd' || Character.toLowerCase(input) == 'f' || Character.toLowerCase(input) == 'b';
  }
  public void scramble() {
    char[] moveSet = {'r' ,'u', 'l', 'd', 'f', 'b', 'R', 'L', 'U', 'D', 'F', 'B'};
      char turntype;
      int turnNum = 10 + (int) (Math.random() * 11);
      for (int i = 0; i < turnNum; i++) {
          turntype = moveSet[(int)(Math.random() * moveSet.length)];
          this.turn(turntype, false);
    }
  }
  
  private void drawFace(int face, float faceSize, float xcoord, float ycoord, int position){
    float squareLength = faceSize/cube[face].length;
    if (position == 4){
      xcoord += faceSize;
    }
    for (int row = 0; row < cube[face].length; row++){
      for(int col = 0; col < cube[face].length; col++){
        fill(cube[face][row][col]);
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
  
  public void drawCube(float faceSize, float xcoord, float ycoord, float border){
    xcoord -= faceSize;
    ycoord -= faceSize/2;
    float[][] coords = {{0, 0}, {(-faceSize/cube[1].length - border), 0}, {0, -faceSize/cube[2].length - border}, {faceSize + border, 0}, {0, faceSize + border}, {faceSize * 2 - faceSize/cube[5].length + border * 2, 0}};
    float[][] borderpos = {{-border, -border}, {-faceSize - border * 2, - border}, {-border, - faceSize - border * 2}, {faceSize, - border}, {- border, faceSize}, {faceSize * 2 + border, -border}};
    int[] positions = {0, 1, 2, 3, 0, 4};
    for (int i = 0; i < 6; i++){
      fill(0);
      square(xcoord + borderpos[i][0], ycoord + borderpos[i][1], faceSize + border * 2);
      this.drawFace(i, faceSize, xcoord + coords[i][0], ycoord + coords[i][1], positions[i]);
    }
    lastTenMoves.showList(width - 420, height - 220, 400, 200, 30, 20, 20);
  }
  
  public abstract void solve();
}
