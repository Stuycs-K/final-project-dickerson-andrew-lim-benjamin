public abstract class Adventurer {
  private int hp;
  private int speed;
  private String name;
  private PVector position;
  public Adventurer(int hp, int speed, String name) {
    this.hp = hp;
    this.speed = speed;
    this.name = name;
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
