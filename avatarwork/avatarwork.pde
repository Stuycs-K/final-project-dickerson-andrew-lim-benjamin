void setup() {
  size(750,500);
}
void draw() {
  int d = 300; // need to scale down
  //fill(200);
  fill(255);
  stroke(255);
  circle(width/2, height/2, d/2);
  fill(color(170,197,15)); // blue
  circle(width/2-d/8, height/2-d/8, d/20);
  circle(width/2+d/8, height/2-d/8, d/20);
  stroke(0);
  line(width/2-d/5, height/2, width/2, height/2 + d/8);
  line(width/2-d/7, height/2+d/8, width/2, height/2 + d/8);
  line(width/2, height/2+d/8, width/2+d/5, height/2);
  line(width/2, height/2+d/8, width/2+d/7, height/2+d/8);
  //stroke(255);
  //fill(255);
  fill(color(223,197,123));
  //fill(color(239,195,202)); // rose
  circle(width/2, height/2+d/10, d/8);
  circle(width/2, height/2+d/10, d/10);
  fill(color(184,211,245)); // blue
  circle(width/2, height/2+d/10, d/14);
}
