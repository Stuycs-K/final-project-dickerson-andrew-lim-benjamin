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
    walk.normalize();
    if (dodgeCD <= 0 && keyboardInput.P1_SPACE) {
      dodge();
    }
    if (dodgeCD == 95) {
      setSpeed(getSpeed()/5);
      isDodging = false;
    }
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
    //if (getHP() <= 0) {
    //  dead = 0;
    //  print("called");
    //  return;
    //}
    print(getHP());
    dodgeCD--;
    interact();
    move();
    drawPlayer();
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
  
  public void drawAvatar(float x, float y, float r){
    float d = r*2;
    //fill(200);
    fill(255);
    stroke(255);
    circle(x, y, d/2);
    fill(color(170,197,15)); // blue
    circle(x-d/8, y-d/8, d/20);
    circle(x+d/8, y-d/8, d/20);
    stroke(0);
    line(x-d/5, y, x, y + d/8);
    line(x-d/7, y+d/8, x, y + d/8);
    line(x, y+d/8, x+d/5, y);
    line(x, y+d/8, x+d/7, y+d/8);
    //stroke(255);
    //fill(255);
    fill(color(223,197,123));
    //fill(color(239,195,202)); // rose
    circle(x, y+d/10, d/8);
    circle(x, y+d/10, d/10);
    fill(color(184,211,245)); // blue
    circle(x, y+d/10, d/14);
  }
  public void drawPlayer(){
    drawAvatar(this.getX(), this.getY(), getRadius());
    //fill(255);
    //circle(this.getX(), this.getY(), getRadius());
  }
 
}
