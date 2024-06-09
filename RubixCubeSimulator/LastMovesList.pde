import java.util.*;
import java.util.ArrayDeque;

public class LastMovesList{
    private ArrayDeque<String> lastMoves;
    int maxSize;
    
    private LastMovesList(int maxSize){
      lastMoves = new ArrayDeque<String>(maxSize);
      this.maxSize = maxSize;
    }
    
    public void add(String input){
      if (lastMoves.size() == maxSize){
        lastMoves.removeFirst();
      }
      lastMoves.addLast(input);
    }
    
    public void clear(){
      lastMoves = new ArrayDeque<String>(maxSize);
    }
    
    public String toString(){
      String str = "";
      return str;
    }
}
