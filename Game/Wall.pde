public class Wall extends Tile {
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Wall(){
    super(true, false, false);
  }
  
  public void drawTile(int xcor, int ycor){
    fill(255);
    super.drawTile(xcor, ycor);
  }

}
