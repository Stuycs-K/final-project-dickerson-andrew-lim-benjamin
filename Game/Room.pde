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
        int val = roomLayout[r][c];
        switch(val){
          case 0:
            room[r][c] = new Floor(); 
            break;
          case 1:
            room[r][c] = new Wall();
            break;
          case 3:
            room[r][c] = new Cracked();
            break;
          case 4:
            room[r][c] = new Water();
            break;
          case 7:
            room[r][c] = new Lever();
            break;
          case 9:
            room[r][c] = new Door();
            break;
        }

      }
    }
  }
  
  public void drawRoom(){
    for(int r = 0; r<room.length; r++){
      for(int c = 0; c<room[0].length; c++){
         room[r][c].drawTile(c*TILE_SIZE, r*TILE_SIZE);
      }
    }
  }

}
