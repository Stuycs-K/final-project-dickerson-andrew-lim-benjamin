public class Room {
  Tile[][] room;

  public Room() {
    room = new Tile[10][15];
  }

  public Room(Tile[][] aRoom) {
    room = aRoom;
  }
  
  public Room(int[][] roomLayout) {
    Room aRoom = new Room();
    for(int r = 0; r<roomLayout.length; r++){
      for(int c = 0; c<roomLayout[0].length; c++){
        if(roomLayout[r][c] == 0){
          aRoom[r][c] = new Floor(); 
        }
        if(roomLayout[r][c] == 1){
          aRoom[r][c] = new Wall(); 
        }
      }
    }
  }

}
