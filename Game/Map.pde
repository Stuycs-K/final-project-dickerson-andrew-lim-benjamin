public class Map {
  Room[][] map;

  public Map(Room[][] theMap) {
    map = theMap;
  } 
  public int getRows(){
    return map.length;
  }
  public int getCols(){
    return map[0].length;
  }
  
  public Room getRoom(int row, int col){
    if(row >= 0 && row < map.length && col >= 0 && col < map[0].length){
      return map[row][col];
    }else{
      throw new IndexOutOfBoundsException("Invalid row or column index"); 
    }
  }
  public void setRoom(int row, int col, Room room){
    if(row >= 0 && row < map.length && col >= 0 && col < map[0].length){
      map[row][col] = room;
    }else{
      throw new IndexOutOfBoundsException("Invalid row or column index"); 
    }
  }
  
  public void drawMap(){
    (p1.getCurrentRoom()).drawRoom();
  }

}
