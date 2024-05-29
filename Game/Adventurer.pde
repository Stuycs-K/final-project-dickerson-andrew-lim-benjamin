public abstract class Adventurer {
  private boolean ally;
  private int hp;
  private int speed;
  private float radius;
  private String name;
  private PVector position;
  private int shootDelay;
  private int lastShotTime = 0;
  private Room currentRoom;
  int currentRoomRow;
  int currentRoomCol;
  
  Room getCurrentRoom() {
    return currentRoom;
  }
  void setCurrentRoom(Room room) {
    currentRoom = room;
  }
  int getCurrentRoomRow() {
    return currentRoomRow;
  }
  void setCurrentRoomRow(int currentRoomRow) {
    this.currentRoomRow = currentRoomRow;
  }
  int getCurrentRoomCol() {
    return currentRoomCol;
  }
  void setCurrentRoomCol(int currentRoomCol) {
    this.currentRoomCol = currentRoomCol;
  }
  
  
  public Adventurer(boolean ally, int hp, int speed, String name, float radius, int shootDelay) {
    this.ally = ally;
    this.hp = hp;
    this.speed = speed;
    this.name = name;
    this.radius = radius; // use for hitbox distance
    this.shootDelay = shootDelay;
  }
  int getShootDelay() {
    return shootDelay;
  }
  int getLastShotTime() {
    return lastShotTime;
  }
  void setLastShotTime(int lastShotTime){
    this.lastShotTime = lastShotTime;
  }
  boolean getAllyStatus() {
    return ally;
  }
  boolean compareAllyStatus(Adventurer e1, Adventurer e2) {
    return(e1.getAllyStatus() == e2.getAllyStatus());
  }
  int getHP() {
    return hp;
  }
  void setHP(int hp) {
    this.hp = hp;
  }
  int getSpeed() {
    return speed;
  }
  void setSpeed(int speed) {
    this.speed = speed;
  }
  String getName() {
    return name;
  }
  void setName(String name) {
    this.name = name;
  }
  float getRadius() {
    return radius;
  }
  void setRadius(int radius) {
    this.radius = radius;
  }
  PVector getPosition() {
    return position;
  }
  void setPosition(int x, int y) {
    this.position = new PVector(x, y);
  }
  void setPosition(PVector newPos) {
    this.position = new PVector(newPos.x, newPos.y);
  }
  void addPosition(PVector add) {
    (this.position).add(add);
  }
  int getX() {
    return (int)position.x;
  }
  int getY() {
    return (int)position.y;
  }
  void setX(int val) {
    this.position = new PVector(val, this.getY());
  }
  void setY(int val) {
    this.position = new PVector(this.getX(), val);
  }
  abstract void shoot(); // call under mouseClicked() in Game
  abstract void move(); 
  abstract void run(); // move, isDead check
  boolean isDead() {
    return hp <= 0;
  }
}
