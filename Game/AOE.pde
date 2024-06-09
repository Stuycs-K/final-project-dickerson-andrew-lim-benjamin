public class AOE {
  private int cd;
  private float radius;
  private PVector target;
  public AOE(PVector target, float radius) {
    this.target = target;
    this.radius = radius;
    cd = 50;
  }
  public int getCD() {
    return cd;
  }
  public PVector getTarget() {
    return target;
  }
  public void run() {
    if (cd >= 10) { // 10 - 50
      drawAOEtarget();
    }
    else if (cd <=5) { // 5 - 1
      if (cd == 5) { // damage
        println("AOE");
        if (p1.getPosition().dist(target) < radius + p1.getRadius()) {
          println("hit");
          p1.setHP(p1.getHP() - 1);
        }
      }
      drawAOEhit();
      }
    cd--;
  }
  public void drawAOEtarget(){
    fill(color(191, 37, 17, 128));
    circle(target.x, target.y, radius*2);
  }
  public void drawAOEhit(){
    //fill(color(255,0,0));
    //circle(target.x, target.y, radius*2);
    image(AOE, target.x-256/2, target.y-256/2);
  }
}
