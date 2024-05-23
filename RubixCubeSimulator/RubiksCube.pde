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
          if (wrongPos){
            break;
        }
        if (wrongPos){
          break;
        }
      }
    }
    solved = !wrongPos;
    }
    
  public abstract void turnRow(char input);
  public abstract void turnCol(char input);
  public abstract void turnFace(char input);
  public abstract void turn(char input);
  
  public void scramble(){
    char[] moveSet = {'r', 'u', 'f', 'l', 'd', 'b', 'R', 'U', 'F', 'L', 'D', 'B'};
    char turntype;
    int turnNum = 10 + (int) (Math.random() * 11);
    for (int i = 0; i < turnNum; i++){
      turntype = moveSet[(int)(Math.random() * moveSet.length)];
      this.turn(turntype);
    }
  }
}
  
