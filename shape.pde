


void setup() {
  size(500, 500);
}


void draw() {

  boolean flg = drawShape();

  if (flg == true) {
    println("ここで判定を行う。");
    background(255, 0, 0);
  }
}
