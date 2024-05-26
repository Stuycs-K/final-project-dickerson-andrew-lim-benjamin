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
    bulletList.add(new Bullet(getX(), getY(), getRadius()*1.1));
  }
  void dodge() {
    
  }
  
  void move() {
    PVector walk = new PVector(0, 0);
    if (keyboardInput.P1_UP) {
      walk.y = -1;
    }
    if (keyboardInput.P1_DOWN) {
      walk.y = 1;
    }
    if (keyboardInput.P1_LEFT) {
      walk.x = -1;
    }
    if (keyboardInput.P1_RIGHT) {
      walk.x = 1;
    }
    walk.normalize();
    walk.mult(this.getSpeed());
    
    PVector newPos = PVector.add(this.getPosition(), walk);
    int newTileX = (int)(newPos.x/TILE_SIZE);
    int newTileY = (int)(newPos.y/TILE_SIZE);
    if(newTileX >= 0 && newTileX < currentRoom.room[0].length && newTileY >= 0 && newTileY < currentRoom.room.length){
      Tile newTile = currentRoom.room[newTileY][newTileX]; 
      if(newTile.isOfType("Door")){
        if(newTileX == 0 || newTileX == currentRoom.room[0].length-1){
          this.setPosition(width-this.getX(), this.getY());
        }
        if(newTileY == 0 || newTileY == currentRoom.room.length-1){
          this.setPosition(this.getX(), height-this.getY());
        }
      }else if(!newTile.getCollision()){
        this.setPosition(newPos);
      }
    }

  }
  
  void run() {
    //shoot();
    move();
    drawPlayer();
  }
  
  public Player(int hp, int speed, String name, int radius) {
    super(hp, speed, name, radius);
    isDodging = false;
    currentRoom = gameMap.getRoom(1,1);
    this.setPosition(width/2, height/2);
  }
  
  public void drawPlayer(){
    fill(255);
    circle(this.getX(), this.getY(), getRadius());
  }
  
}
