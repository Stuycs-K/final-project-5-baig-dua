import java.util.*;
import java.util.ArrayList;

public class LastMovesList{
    private ArrayList<String> lastMoves;
    int maxSize;
    
    public LastMovesList(int maxSize){
      lastMoves = new ArrayList<String>(maxSize);
      this.maxSize = maxSize;
    }
    
    public void add(String input){
      if (lastMoves.size() == maxSize){
        lastMoves.remove(0);
      }
      lastMoves.add(input);
    }
    
    public void clear(){
      lastMoves = new ArrayList<String>(maxSize);
    }
    
    public void showList(float x, float y, float boxLength, float boxWidth, float headingSize, float subSize, float border){
      float space = (boxLength - border * 2) / (maxSize/2);
      float lineSpace = (boxWidth - border * 2) / 2;
      int index = 0;
      fill(255);
      rect(x, y, boxLength, boxWidth);
      fill(0);
      textSize(headingSize);
      text("Last " + maxSize + " Moves", x + boxWidth/2 + border, y + border * 2);
      y += lineSpace;
      x += border * 2;
      for (int i = 0; i < lastMoves.size(); i++){
        if (i == maxSize/2){
          y += lineSpace/2;
          index = 0;
        }
        if (i < lastMoves.size() - 1){
          fill(0);
          textSize(subSize);
          text(lastMoves.get(i) + ", ", x + (space * index), y);
        }
        else{
          fill(255, 0, 0);
          textSize(subSize);
          text(lastMoves.get(i), x + (space * index), y);
        }
        index++;
      }
    }
}
    
