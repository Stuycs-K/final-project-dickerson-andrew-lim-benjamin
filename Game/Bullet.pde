public class Bullet {
  private int damage;
  private int lifespan;
  private int size;
  private color c;

  public Bullet(){
    damage = 1;
    lifespan = 10;
    size = 5;
    c = color(252,26,82);
  }
  public Bullet(int dmg, int li, int s, color c){
    damage = li;
    lifespan = s;
    size = dmg;
    this.c = c;
  }
  
  public void drawBullet(int xcor, int ycor){
    fill(c);
    noStroke();
    circle(xcor, ycor, size);
  }

}
