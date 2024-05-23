abstract class RubiksCube{
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
  public RubiksCube(int size){
    solved = true;
    cube = new int[cubeColors.length][size][size];
    for (int i = 0; i < cube.length; i++){
      for (int j = 0; j < cube[i].length; j++){
        for(int k = 0; k < cube[i][k].length; k++){
          cube[i][j][k] = cubeColors[i];
        }
      }
    }
  }
  
  public int getColor(int face, int row, int col){
    return cube[face][row][col];
  }
  
  public boolean getSolved(){
    return solved;
  }
  
  public void isSolved(){
    boolean wrongPos = false;
    for (int i = 0; i < cube.length; i++){
      for (int j = 0; j < cube[i].length; j++){
        for(int k = 0; k < cube[i][k].length; k++){
          if (cube[i][j][k] != cubeColors[i]){
            wrongPos = true;
            break;
          }
        }
      }
    }
    solved = !wrongPos;
    }
    
  public abstract void turnRow(char input);
  public abstract void turnCol(char input);
  public abstract void turnFace(char input);
  public abstract void turn(char input);
  public abstract void scramble();
  
  
  }
