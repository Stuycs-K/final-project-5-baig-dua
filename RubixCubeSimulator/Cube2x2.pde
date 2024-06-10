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
}
