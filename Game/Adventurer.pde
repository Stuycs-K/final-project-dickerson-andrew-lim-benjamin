public abstract class Adventurer {
  private int hp;
  private String name;
  private int xcoor;
  private int ycoor;
  public Adventurer(int hp, String name) {
    this.hp = hp;
    this.name = name;
  }
  int getHP() {
    return hp;
  }
  void setHP(int hp) {
    this.hp = hp;
  }
  String getName() {
    return name;
  }
  void setName(String name) {
    this.name = name;
  }
  int getX() {
    return xcoor;
  }
  int getY() {
    return ycoor;
  }
  void setX(int val) {
    xcoor = val;
  }
  void setY(int val) {
    ycoor = val;
  }
  abstract void shoot(); // call under mouseClicked() in Game
  abstract void move(); 
  abstract void run(); // move, isDead check
  boolean isDead() {
    return hp <= 0;
  }
}
