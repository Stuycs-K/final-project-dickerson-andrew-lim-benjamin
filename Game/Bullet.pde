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
    //size = 5;
    //c = color(252,26,82);
    this(1, 5, 10, color(252,26,82), x, y, startmove);
  }
  public Bullet(int dmg, float li, float s, color c, float x, float y, float startmove){ // should only construct on mouse click
    damage = dmg;
    lifespan = li;
    size = s;
    this.c = c;
    pos = new PVector(x, y);
    //if (mouseX - x >= 0) { // Q1 or Q4 for atan
      //println(-mouseY + " " + mouseX);
      velocity = PVector.fromAngle(atan2(mouseY-y, mouseX-x)); // unit vector
    //}
    //else {
    //  float angle = Math.abs((float) mouseY / mouseX); // ref
    //  if (mouseY - y >= 0) { //Q3
    //    angle = 2*PI-angle; 
    //  }
    //  else { //Q2
    //    angle = 2*PI+angle;
    //  }
    //  velocity = PVector.fromAngle(angle); // unit vector
    //}
    pos.add(PVector.mult(velocity, startmove)); // get out of adventurer range
  }
  
  public void drawBullet(float xcor, float ycor){
    fill(c);
    noStroke();
    circle(xcor, ycor, size);
  }
  
  public void move() {
    pos.add(velocity);
  }
  public boolean run() { // return if collision
    //lifespan--; // need life span to work
    move();
    drawBullet(pos.x, pos.y);
    return false;
    //return collide();
  }
  public boolean collide() {
    for (Adventurer e : entityList) {
      if (pos.dist(e.position) < size) {
        e.setHP(e.hp - damage);
        bulletList.remove(this);
        return true;
      }
    }
    return false;
  }
}
