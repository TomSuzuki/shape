


void setup() {
  size(500, 500);
}


void draw() {

  boolean flg = drawShape();

  if (flg == true) {
    println();
    println("Check Shape Type");
    println(">> ", "Point Num：", data.point.size());
    background(255, 0, 0);

    Check check = new Check(data.point);
    println(check.getType());
  }
}
