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
    bulletList.add(new Bullet(getX(), getY()));
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
    this.addPosition(walk);
    //drawPlayer(); interestingly this extra call makes a blur effect. Could be useful for drawBullet() ?
  }
  
  void run() {
    drawPlayer();
    shoot();
    move();
  }
  
  public Player(int hp, int speed, String name) {
    super(hp, speed, name);
    isDodging = false;
    currentRoom = gameMap.getRoom(1,1);
    this.setPosition(width/2, height/2);
  }
  
  public void drawPlayer(){
    fill(255);
    circle(this.getX(), this.getY(), 50);
  }
  
}
