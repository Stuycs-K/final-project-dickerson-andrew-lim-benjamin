public class Enemy extends Adventurer {
  int lastTimeMoved;
  int moveDelay;
  int randMoveNum;
  
  public Enemy(int hp, int speed, String name, int radius, int x, int y, int roomRow, int roomCol) {
    super(false, hp, speed, name, radius, 45);
    setCurrentRoom(gameMap.getRoom(roomRow, roomCol));
    setCurrentRoomRow(roomRow);
    setCurrentRoomCol(roomCol);
    this.setPosition(x, y);
    lastTimeMoved = 0;
    moveDelay = 30;
    setHitCollideTile(false);
    setMoveDir("up");
  } 
  
  void shoot() {
    if (frameCount - getLastShotTime() >= getShootDelay()) {
      bulletList.add(new Bullet(getX(), getY(), p1.getX(), p1.getY(), getAllyStatus(), getCurrentRoom(), slimebullet));
      setLastShotTime(frameCount);
    }
  }
  
  void move() {
    if (frameCount - lastTimeMoved >= moveDelay) {
      if(getHitCollideTile()){
        //println("hit wall");
        int newRand = randMoveNum;
        while(newRand == randMoveNum){
          newRand = (int) random(6);
        }
        moveDelay = 0;
        randMoveNum = newRand;
        setHitCollideTile(false);
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
        setMoveDir("up");
      }
      if (randMoveNum == 1) {
        walk.y = 1;
        setMoveDir("down");
      }
      if (randMoveNum == 2) {
        walk.x = -1;
        setMoveDir("left");
      }
      if (randMoveNum == 3) {
        walk.x = 1;
        setMoveDir("right");
      }
      if (randMoveNum == 4) {
        walk = new PVector(p1.getX() - this.getPosition().x, p1.getY() - this.getPosition().y);
      }
      if (randMoveNum == 5) {
        moveDelay/=2;
      }
      walk.normalize();
      walk.mult(this.getSpeed());
      applyMoveCollision(walk);
    }
  }
  
  public void drawEnemy(){
    //fill(245, 64, 118);
    //circle(this.getX(), this.getY(), getRadius());
    if(getMoveDir().equals("up")){
      image(slimeup, getX()-slimeup.width/2, getY()-slimeup.height/2);
    }else if(getMoveDir().equals("down")){
      image(slimedown, getX()-slimedown.width/2, getY()-slimedown.height/2);
    }else if(getMoveDir().equals("left")){
      image(slimeleft, getX()-slimeleft.width/2, getY()-slimeleft.height/2);
    }else if(getMoveDir().equals("right")){
      image(slimeright, getX()-slimeright.width/2, getY()-slimeright.height/2);
    }
  }
  
  void run() {
    shoot();
    move();
    drawEnemy(); 
  }
}

public void spawnEnemy(int roomRow, int roomCol, int count){
  for(int i = 0; i<count; i++){
    int[] eCoords = randomEnemyCoords(roomRow, roomCol);
    spawnEnemy(roomRow, roomCol, eCoords); 
  }
}

public void spawnEnemy(int roomRow, int roomCol){
  int[] eCoords = randomEnemyCoords(roomRow, roomCol);
  spawnEnemy(roomRow, roomCol, eCoords);
}

public void spawnEnemy(int roomRow, int roomCol, int[]eCoords){
  entityList.add(new Enemy(3, 3, "Bob", 50, eCoords[0], eCoords[1], roomRow, roomCol));
}

public int[] randomEnemyCoords(int row, int col){
  int randX = 0;
  int randY = 0; 
  while(!isValidTileSpawn(randX, randY, row, col)){
    randX = (int)random(width/TILE_SIZE - 2)+1;
    randY = (int)random(height/TILE_SIZE - 2)+1; 
  }
  //println("randX: "+randX+" randY: "+randY);
  randX = (int)((randX+0.5)*TILE_SIZE);
  randY = (int)((randY+0.5)*TILE_SIZE);
  //println("randX: "+randX+" randY: "+randY);
  return(new int[]{randX, randY});
}

public boolean isValidTileSpawn(int x, int y, int row, int col){
  return !(gameMap.getRoom(row, col).room[y][x]).getCollision();
}
