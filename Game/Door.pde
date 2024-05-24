public class Door extends Tile {
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Door(){
    super(true, false, false);
  }
  
  public void drawTile(int xcor, int ycor){
    color c = color(80, 44, 21);
    super.drawTile(xcor, ycor, c, false);
  }
  
  public void changeRoom(){
    
  }

}
