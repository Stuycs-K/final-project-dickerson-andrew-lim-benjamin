public class Bullet {
  private int damage;
  private int lifespan;
  private int size;
  private color c;
  private PVector pos;
  private PVector velocity;

  public Bullet(float x, float y){ // must call with location
    //damage = 1;
    //lifespan = 10;
    //size = 5;
    //c = color(252,26,82);
    Bullet(1, 10, 5, color(252,26,82), x, y);
  }
  public Bullet(int dmg, int li, int s, color c, float x, float y){ // should only construct on mouse click
    damage = li;
    lifespan = s;
    size = dmg;
    this.c = c;
    pos = new PVector(x, y);
    if (mouseX - x >= 0) { // Q1 or Q4 for atan
      velocity = PVector.fromAngle(atan2(mouseY, mouseX)); // unit vector
    }
    else {
      float angle = Math.abs((float) mouseY / mouseX); // ref
      if (mouseY - y >= 0) { //Q2
        angle = 2*PI-angle; 
      }
      else { //Q3
        angle = 2*PI+angle;
      }
      velocity = PVector.fromAngle(angle); // unit vector
    }
  }
  
  public void drawBullet(int xcor, int ycor){
    fill(c);
    noStroke();
    circle(xcor, ycor, size);
  }
  
  public void move() {
    
  }
}
