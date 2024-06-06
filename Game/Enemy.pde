public class Enemy extends Adventurer {
  int lastTimeMoved;
  int moveDelay;
  int randMoveNum;
  boolean hitCollideTile;
  
  public Enemy(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(false, hp, speed, name, radius, 45);
    setCurrentRoom(gameMap.getRoom(roomRow, roomCol));
    setCurrentRoomRow(roomRow);
    setCurrentRoomCol(roomCol);
    this.setPosition(x, y);
    lastTimeMoved = 0;
    moveDelay = 30;
    hitCollideTile = false;
  } 
  
  void shoot() {
    if (frameCount - getLastShotTime() >= getShootDelay()) {
      bulletList.add(new Bullet(getX(), getY(), p1.getX(), p1.getY(), getAllyStatus(), getCurrentRoom()));
      setLastShotTime(frameCount);
    }
  }
  
  void move() {
    if (frameCount - lastTimeMoved >= moveDelay) {
      if(hitCollideTile){
        //println("hit wall");
        int newRand = randMoveNum;
        while(newRand == randMoveNum){
          newRand = (int) random(6);
        }
        moveDelay = 0;
        randMoveNum = newRand;
        hitCollideTile = false;
      }else{
        randMoveNum = (int) random(5);
        //randMoveNum = 4;
      }
      moveDelay = (int) random(30)+30;
      lastTimeMoved = frameCount;
    }else{
      //println(randMoveNum);
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
        walk = new PVector(p1.getX() - this.getPosition().x, p1.getY() - this.getPosition().y);
      }
      if (randMoveNum == 5) {
        moveDelay/=2;
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
        }else{
          hitCollideTile = true; 
        }
      }
    }
  }
  
  public void drawEnemy(){
    fill(245, 64, 118);
    circle(this.getX(), this.getY(), getRadius());
  }
  
  void run() {
    shoot();
    move();
    drawEnemy(); 
  }
}

public void spawnEnemy(int roomRow, int roomCol, int count){
  for(int i = 0; i<count; i++){
    int[] eCoords = randomEnemyCoords();
    spawnEnemy(roomRow, roomCol, eCoords); 
  }
}

public void spawnEnemy(int roomRow, int roomCol){
  int[] eCoords = randomEnemyCoords();
  spawnEnemy(roomRow, roomCol, eCoords);
}

public void spawnEnemy(int roomRow, int roomCol, int[]eCoords){
  entityList.add(new Enemy(3, 3, "Bob", 50, eCoords[0], eCoords[1], roomRow, roomCol));
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
