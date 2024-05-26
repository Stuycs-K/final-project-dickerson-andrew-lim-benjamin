public class Bullet {
  private int damage;
  public float lifespan;
  private float size;
  private color c;
  private PVector pos;
  private PVector velocity;

  public Bullet(float x, float y, float startmove){ // must call with location
    //damage = 1;
    //lifespan = 5;
    //size = 15;
    //c = color(252,26,82);
    this(1, 5, 15, color(252,26,82), x, y, startmove);
    // seems 10 or less size bullets have hitbox issues
  }
  public Bullet(int dmg, float li, float s, color c, float x, float y, float startmove){ // should only construct on mouse click
    damage = dmg;
    lifespan = li;
    size = s;
    this.c = c;
    pos = new PVector(x, y);
    velocity = PVector.fromAngle(atan2(mouseY-y, mouseX-x)); // unit vector
    pos.add(PVector.mult(velocity, startmove)); // get out of adventurer range
  }
  
  public void drawBullet(float xcor, float ycor){
    fill(c);
    noStroke();
    circle(xcor, ycor, size);
    //hitbox
    //fill(255);
    //circle(pos.x, pos.y, size);
  }
  
  public void move() {
    pos.add(velocity);
  }
  public boolean run() { // return if collision
    //lifespan--; // need life span to work
    if (collide()) {
      return true;
    }
    move();
    drawBullet(pos.x, pos.y);
    return false;
  }
  public boolean collide() {
    for (Adventurer e : entityList) {
      if (pos.dist(e.position) < Math.abs(e.getRadius()-size)) {
        e.setHP(e.hp - damage);
        bulletList.remove(this);
        return true;
      }
    }
    return false;
  }
}
