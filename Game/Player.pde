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
    if(mousePressed == true){
      //shoot towards mouse coords
    }
  }
  void dodge() {
    
  }
  
  void move() {
    PVector walk = new PVector(0, 0);
    if(keyPressed == true){
      switch(key){
        case 'w':
          walk.y = -1;
          break;
        case 'a':
          walk.x = -1;
          break;
        case 's':
          walk.y = 1;
          break;
        case 'd':
          walk.x = 1;
          break;
      }
      walk.normalize();
      walk.mult(this.getSpeed());
      this.addPosition(walk);
    }
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
