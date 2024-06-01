public class Wall extends Tile {
  private String type;
  private boolean collision;
  private boolean breakable;
  private boolean permeable;

  public Wall(){
    super(true, false, false, "Wall");
  }
  
  public void drawTile(int xcor, int ycor){
    //color c = color(204,76,58);
    //super.drawTile(xcor, ycor, c, false);
    if (xcor > TILE_SIZE && ycor > TILE_SIZE && xcor < width - TILE_SIZE && ycor < height - TILE_SIZE) {
    image(dirtwallimg, xcor, ycor, TILE_SIZE, TILE_SIZE);
    }
    else {
      image(grassimg, xcor, ycor, TILE_SIZE, TILE_SIZE);
    }
  }

}
