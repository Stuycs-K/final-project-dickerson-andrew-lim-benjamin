public class Player extends Adventurer {
  private boolean isDodging;
  private int dodgeCD;
  
  void setHP(int hp) {
    if (!isDodging) { // no damage taken while dodging
      super.setHP(hp);
    }
  }

  void shoot() {
    if (getHP()>0){
      bulletList.add(new Bullet(getX(), getY(), mouseX-getX(), mouseY-getY(), this.getAllyStatus(), this.getCurrentRoom()));
    }
  }
  void dodge() {
    //print("DODGE");
    dodgeCD = 100;
    setSpeed(getSpeed()*5);
    isDodging = true;
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
    if (dodgeCD <= 0 && keyboardInput.P1_SPACE) {
      dodge();
    }
    if (dodgeCD == 95) {
      setSpeed(getSpeed()/5);
      isDodging = false;
    }
    applyMoveCollision(walk);
    //walk.normalize();
    //walk.mult(this.getSpeed());
      
    //PVector newPos = PVector.add(this.getPosition(), walk);
    //int newTileX = (int)(newPos.x/TILE_SIZE);
    //int newTileY = (int)(newPos.y/TILE_SIZE);
    //if(newTileX >= 0 && newTileX < getCurrentRoom().room[0].length && newTileY >= 0 && newTileY < getCurrentRoom().room.length){
    //  Tile newTile = getCurrentRoom().room[newTileY][newTileX];
    //  if(newTile.isOfType("Door")){
    //    this.changeRoom(newTileX, newTileY);
    //  }else if(!newTile.getCollision()){
    //    this.setPosition(newPos);
    //  }
    //}
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
    for (Bullet b : bulletList) {
      b.setLifeSpan(0);
    }
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
    dodgeCD--;
    interact();
    move();
    drawPlayer();
    drawHealthBar();
  }
 
  public Player(int hp, int speed, String name, int radius) {
    super(true, hp, speed, name, radius, 15);
    isDodging = false;
    dodgeCD = 0;
    setCurrentRoom(gameMap.getRoom(1,1));
    setCurrentRoomRow(1);
    setCurrentRoomCol(1);
    this.setPosition(width/2, height/2);
  }

  public void drawPlayer(){
    PImage playerImg = p1up;
    if (keyboardInput.P1_UP) {
      playerImg = p1up;
    }
    if (keyboardInput.P1_DOWN) {
      playerImg = p1down;
    }
    if (keyboardInput.P1_LEFT) {
      playerImg = p1left;
    }
    if (keyboardInput.P1_RIGHT) {
      playerImg = p1right;
    }
    image(playerImg, getX()-playerImg.width/2, getY()-playerImg.height/2);
  }
  
  public void drawHealthBar(){
    color c = color(255);
    if(getHP() > (int)getMaxHP()*2/3){
      c = color(35,190,64);
    }else if(getHP() <= (int)getMaxHP()*2/3 && getHP() > (int)getMaxHP()/3){
      c = color(255,209,70);
    }else{
      c = color(237,24,49); 
    }
    fill(c);
    float v1X = TILE_SIZE/2;
    float v1Y = p1.getCurrentRoomHeight()*TILE_SIZE-TILE_SIZE/1.5;
    float vShift = 10;
    quad(v1X, v1Y, v1X+300, v1Y, v1X+300-vShift, v1Y-20, v1X-vShift, v1Y-20);
  }
 
}

public void showBossWin(){
  if(keyboardInput.P1_8){
    dead = 0;
  }
}

public void showPlayerWin(){
  if(keyboardInput.P1_9){
    dead = 1;
  }
}

public void reset(){
  if(keyboardInput.P1_0){
    
    for(int r = 1; r<p1.getCurrentRoomHeight()-1; r++){
      for(int c = 1; c<p1.getCurrentRoomLength()-1; c++){
         Tile newTile = p1.getCurrentRoom().room[r][c];
         if(newTile.isOfType("Lever")){
           Lever l = (Lever)p1.getCurrentRoom().room[r][c];
           l.setToggle(false);
         }
      }
    }
    
    p1 = new Player(15, 8, "eggie (reborn)", 50);
    entityList.add(p1);
    
    while(entityList.size() > 0){
      entityList.remove(0);
    }
    for (Bullet b : bulletList) {
      b.setLifeSpan(0);
    }
    
    leversPressed = 0;
    bossSpawned = false;
    dead = -1;
    mode = 0;
    mouseLeft = false;
    setup();
    
  }
}
