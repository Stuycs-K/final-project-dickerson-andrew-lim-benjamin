String[]names;
Kernel[]kernels;
int currentKernel;
PImage car, output;

void setup(){
  size(1450,500);
  car = loadImage("redcar.png");
  output = car.copy();
  currentKernel = 0;
  image(car,0,0);
  image(output,car.width,0);
  names = new String[]{
    "Identity", "Blur", "Sharpen",
    "Outline", "Left Sobel", "Right Sobel",
    "Top Sobel", "Emboss"
  };

  kernels = new Kernel[] {
    new Kernel( new float[][] {
      {0, 0, 0},
      {0, 1, 0},
      {0, 0, 0}
    }) ,
    new Kernel( new float[][] {
      {.111, .111, .111},
      {.111, .111, .111},
      {.111, .111, .111}
    }) ,
    new Kernel( new float[][] {
      {0, -1, 0},
      {-1, 5, -1},
      {0, -1, 0}
    }) ,
    new Kernel( new float[][] {
      {-1, -1, -1},
      {-1, 8, -1},
      {-1, -1, -1}
    }) ,
    new Kernel( new float[][] {
      {1, 0, -1},
      {2, 0, -2},
      {1, 0, -1}
    }) ,
    new Kernel( new float[][] {
      {-1, 0, 1},
      {-2, 0, 2},
      {-1, 0, 1}
    }) ,
    new Kernel( new float[][] {
      {1, 2,  1},
      {0, 0, 0},
      {-1, -2, -1}
    }),
    new Kernel( new float[][] {
      {-2, -1,  0},
      {-1, 1, 1},
      {0, 1, 2}
    })
  };
}

void draw(){
if(keyPressed){
  println("APPLY!");
  currentKernel++;
  currentKernel = currentKernel % 8;
  kernels[currentKernel].apply(car,output);
  image(car,0,0);
  image(output,car.width,0);
  
  textSize(32);
  fill(173, 216, 230);
  text(names[currentKernel], car.width+10, 35);
}

}
