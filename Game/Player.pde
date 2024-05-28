public class Player extends Adventurer {
  private boolean isDodging;

  void shoot() {
    bulletList.add(new Bullet(getX(), getY(), this.getAllyStatus(), this.getCurrentRoom()));
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
    if(newTileX >= 0 && newTileX < getCurrentRoom().room[0].length && newTileY >= 0 && newTileY < getCurrentRoom().room.length){
      Tile newTile = getCurrentRoom().room[newTileY][newTileX];
      //print(newTile.getType());
      //print("X: "+ newTileX + ", Y: " + newTileY + ", ");
      if(newTile.isOfType("Door")){
        this.changeRoom(newTileX, newTileY);
      }else if(!newTile.getCollision()){
        this.setPosition(newPos);
      }
    }
    
  }
  
  void changeRoom(int newTileX, int newTileY){
    if(newTileX == 0){
      currentRoomCol--;
      this.setPosition(width-this.getX(), this.getY());
    }else if(newTileX == getCurrentRoom().room[0].length-1){
      currentRoomCol++;
      this.setPosition(width-this.getX(), this.getY());
    }else if(newTileY == 0){
      currentRoomRow--;
      this.setPosition(this.getX(), height-this.getY());
    }else if(newTileY == getCurrentRoom().room.length-1){
      currentRoomRow++;
      this.setPosition(this.getX(), height-this.getY());
    }
    setCurrentRoom(gameMap.getRoom(currentRoomRow, currentRoomCol));
  }
  
  void interact() {
    if(keyboardInput.P1_INTERACT){
      for(int r = (this.getY()/TILE_SIZE)-1; r<(this.getY()/TILE_SIZE)+2; r++){
        for(int c = (this.getX()/TILE_SIZE)-1; c<(this.getX()/TILE_SIZE)+2; c++){
           Tile newTile = getCurrentRoom().room[r][c];
           if(newTile.isOfType("Lever")){
             Lever l = (Lever)getCurrentRoom().room[r][c];
             l.toggleLever();
           }
        }
      }
    }
  }
  
  void run() {
    //shoot();
    interact();
    move();
    drawPlayer();
  }
  
  public Player(int hp, int speed, String name, int radius) {
    super(true, hp, speed, name, radius);
    isDodging = false;
    setCurrentRoom(gameMap.getRoom(1,1));
    setCurrentRoomRow(1);
    setCurrentRoomCol(1);
    this.setPosition(width/2, height/2);
  }
  
  public void drawPlayer(){
    fill(255);
    circle(this.getX(), this.getY(), getRadius());
  }
  
}
