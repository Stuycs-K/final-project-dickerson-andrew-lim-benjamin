public class Player extends Adventurer {
  private boolean isDodging;
  private Room currentRoom;
  
  Room getCurrentRoom() {
    return currentRoom;
  }
  
  void setCurrentRoom(Room room) {
    currentRoom = room;
  }
  
  void shoot() {
    
  }
  void dodge() {
    
  }
  
  void move() {
    
  }
  
  void run() {
    
  }
  
  public Player(int hp, String name) {
    super(hp, name);
    isDodging = false;
    currentRoom = gameMap.getRoom(1,1);
  }
  
}
