public class Enemy extends Adventurer {
  int lastChangedDirection;
  int moveDelay;
  int randMoveNum;
  
  public Enemy(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(true, hp, speed, name, radius);
    setCurrentRoom(gameMap.getRoom(roomRow, roomCol));
    setCurrentRoomRow(roomRow);
    setCurrentRoomCol(roomCol);
    this.setPosition(x, y);
    lastChangedDirection = 0;
    moveDelay = 30;
  } 
  
  void shoot() {
    
  }
  
  void move() {
    if (frameCount - lastChangedDirection >= moveDelay) {
      randMoveNum = (int) random(5);
      moveDelay = (int) random(30)+30;
      lastChangedDirection = frameCount;
    }else{
      PVector walk = new PVector(0, 0);
      if (randMoveNum == 0) {
        walk.y = -1;
      }
      if (randMoveNum == 1) {
        walk.y = 1;
      }
      if (randMoveNum == 2) {
        walk.x = -1;
      }
      if (randMoveNum == 3) {
        walk.x = 1;
      }
      if (randMoveNum == 4) {
        walk.x = 1;
      }
      walk.normalize();
      walk.mult(this.getSpeed());
      
      PVector newPos = PVector.add(this.getPosition(), walk);
      int newTileX = (int)(newPos.x/TILE_SIZE);
      int newTileY = (int)(newPos.y/TILE_SIZE);
      if(newTileX >= 0 && newTileX < getCurrentRoom().room[0].length && newTileY >= 0 && newTileY < getCurrentRoom().room.length){
        Tile newTile = getCurrentRoom().room[newTileY][newTileX];
        if(!newTile.getCollision()){
          this.setPosition(newPos);
        }
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

public void spawnEnemy(int roomRow, int roomCol){
  int[] eCoords = randomEnemyCoords();
  entityList.add(new Enemy(10, 3, "Bob", 50, eCoords[0], eCoords[1], roomRow, roomCol));
}

public void spawnEnemy(int roomRow, int roomCol, int[]eCoords){
  entityList.add(new Enemy(10, 3, "Bob", 50, eCoords[0], eCoords[1], roomRow, roomCol));
}

public int[] randomEnemyCoords(){
  int randX = 0;
  int randY = 0; 
  while(!isValidTileSpawn(randX, randY)){
    randX = (int)random(width/TILE_SIZE - 2)+1;
    randY = (int)random(height/TILE_SIZE - 2)+1; 
  }
  randX = (int)((randX+0.5)*TILE_SIZE);
  randY = (int)((randY+0.5)*TILE_SIZE); 
  return(new int[]{randX, randY});
}

public boolean isValidTileSpawn(int x, int y){
  return !(p1.getCurrentRoom().room[y][x]).getCollision();
}
