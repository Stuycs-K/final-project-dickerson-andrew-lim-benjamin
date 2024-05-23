public class Room {
  Tile[][] room;

  public Room() {
    room = new Tile[10][15];
  }

  public Room(Tile[][] aRoom) {
    room = aRoom;
  }
  
  public Room(int[][] roomLayout) {
    this();
    for(int r = 0; r<roomLayout.length; r++){
      for(int c = 0; c<roomLayout[0].length; c++){
        if(roomLayout[r][c] == 0){
          room[r][c] = new Floor(); 
        }
        if(roomLayout[r][c] == 1){
          room[r][c] = new Wall(); 
        }
      }
    }
  }
  
  public void drawRoom(){
    for(int r = 0; r<room.length; r++){
      for(int c = 0; c<room[0].length; c++){
         room[r][c].drawTile(c*100, r*100);
      }
    }
  }

}
