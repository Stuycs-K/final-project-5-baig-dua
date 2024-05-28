abstract class RubiksCube {
  private int[][][] cube;
  private boolean solved;
  public final int RED = color(255, 0, 0);
  public final int GREEN = color(0, 255, 0);
  public final int WHITE = color(255, 255, 255);
  public final int BLUE = color(0, 0, 255);
  public final int YELLOW = color(255, 255, 0);
  public final int ORANGE = color(255, 121, 0);
  private int[] cubeColors = {WHITE, ORANGE, GREEN, RED, BLUE, YELLOW};

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
    for (int i = 0; i < cube.length; i++) {
      for (int j = 0; j < cube[i].length; j++) {
        for (int k = 0; k < cube[i][k].length; k++) {
          if (cube[i][j][k] != cubeColors[i]) {
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
  
  private int[] replaceRow(int face, int row, int[] newRow){
    int[] ogRow = cube[face][row].clone();
    cube[face][row] = newRow;
    return ogRow;
  }

  public abstract void turnRow(char input);
  public abstract void turnCol(char input);
  public abstract void turnFace(char input);
  public abstract void turn(char input);
  
  public void scramble() {
    char[] moveSet = {'r', 'u', 'f', 'l', 'd', 'b', 'R', 'U', 'F', 'L', 'D', 'B'};
      char turntype;
      int turnNum = 10 + (int) (Math.random() * 11);
      for (int i = 0; i < turnNum; i++) {
      turntype = moveSet[(int)(Math.random() * moveSet.length)];
        this.turn(turntype);
    }
  }
}
