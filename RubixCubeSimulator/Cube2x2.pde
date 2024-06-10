import java.util.*; 
public class Cube2x2 extends RubiksCube{
  
  public Cube2x2(){
    super(2);
  }
  
  public void solve(){
    if (this.getSolved() == true){
      this.scramble();
    }
  }
  
  private int[][] getCornerVal(int face, int row, int col){
    int[][] corner = new int[3][2];
    if (face == 0){
      corner[0] = new int[]{0, this.getColor(0, row, col)};
      if (row == 0) {
        if (col == 0){
          corner[1] = new int[]{1, this.getColor(1, 0, 0)};
          corner[2] = new int[]{2, this.getColor(2, 0, 0)};
          }
        if (col == 1){
          corner[1] = new int[]{1, this.getColor(2, 0, 1)};
          corner[2] = new int[]{3, this.getColor(3, 0, 0)};
        }
      }
      if (row == 1){
        if (col == 0){
          corner[1] = new int[]{1, this.getColor(1, 0, 1)};
          corner[2] = new int[]{4, this.getColor(4, 0, 0)};
        }
        if (col == 1){
          corner[1] = new int[]{3, this.getColor(3, 0, 1)};
          corner[2] = new int[]{4, this.getColor(4, 0, 1)};
        }
      }
    }
    if (face == 5){
      corner[0] = new int[]{5, this.getColor(5, row, col)};
      if (row == 0) {
        if (col == 0){
          corner[1] = new int[]{1, this.getColor(1, 1, 0)};
          corner[2] = new int[]{2, this.getColor(2, 1, 0)};
          }
        if (col == 1){
          corner[1] = new int[]{1, this.getColor(2, 1, 1)};
          corner[2] = new int[]{3, this.getColor(3, 1, 0)};
        }
      }
      if (row == 1){
        if (col == 0){
          corner[1] = new int[]{1, this.getColor(1, 1, 1)};
          corner[2] = new int[]{4, this.getColor(4, 1, 0)};
        }
        if (col == 1){
          corner[1] = new int[]{3, this.getColor(3, 1, 1)};
          corner[2] = new int[]{4, this.getColor(4, 1, 1)};
        }
      }
    }
    return corner;
  }

    private boolean correctPos(int[][] corner){
      boolean pos = true;
      int[] faces = new int[corner.length];
      int[] colors = new int[corner.length];
      int[] ogColor = new int[corner.length];
      for (int i = 0; i < corner.length; i++){
        faces[i] = corner[i][0];
        colors[i] = corner[i][1];
        ogColor[i] = cubeColors[faces[i]];
      }
      Arrays.sort(colors);
      Arrays.sort(ogColor);
      for (int i = 0; i < colors.length; i++){
        if (colors[i] != ogColor[i]){
          pos = false;
        }
      }
      return pos;
  }
  
  private boolean correctOrientation(int[][] corner){
    boolean orient = true;
    int face = 0;
    for (int i = 0; i < corner.length; i++){
      face = corner[i][0];
      if (cubeColors[face] != corner[i][1]){
        orient = false;
      }
    }
    return orient;
  }
  
}
