public class Enemy extends Adventurer {
  public Enemy(int hp, int speed, String name, int radius, int x, int y) {
    super(true, hp, speed, name, radius);
    setCurrentRoom(gameMap.getRoom(1,1));
    setCurrentRoomRow(1);
    setCurrentRoomCol(1);
    this.setPosition(x/2, y/2);
  }
  void shoot() {
    
  }
  void move() {
    int num = (int) random(4);
    PVector walk = new PVector(0, 0);
    if (num == 0) {
      walk.y = -1;
    }
    if (num == 1) {
      walk.y = 1;
    }
    if (num == 2) {
      walk.x = -1;
    }
    if (num == 3) {
      walk.x = 1;
    }
    walk.normalize();
    walk.mult(this.getSpeed());
    
    PVector newPos = PVector.add(this.getPosition(), walk);
    int newTileX = (int)(newPos.x/TILE_SIZE);
    int newTileY = (int)(newPos.y/TILE_SIZE);
    if(newTileX >= 0 && newTileX < getCurrentRoom().room[0].length && newTileY >= 0 && newTileY < getCurrentRoom().room.length){
      Tile newTile = getCurrentRoom().room[newTileY][newTileX];
      //print(newTile.getType());
      //print("X: "+ newTileX + ", Y: " + newTileY + ", ");
      if(newTile.isOfType("Door")){
        setCurrentRoom(gameMap.getRoom(newTileX, newTileY));
      }else if(!newTile.getCollision()){
        this.setPosition(newPos);
      }
    }
  }
  
  public void drawEnemy(){
    fill(245, 64, 118);
    circle(this.getX(), this.getY(), getRadius());
  }
  
  void run() {
    move();
    drawEnemy();
  }
}
