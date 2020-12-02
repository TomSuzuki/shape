// 描いたデータを保存する
Data data = new Data();

class Data {

  // 座標
  private ArrayList<Point> point;

  // コンストラクタ
  Data() {
    this.reset();
  }

  // データの追加
  public void addData() {
    point.add(new Point(mouseX, mouseY));
  }

  // 表示
  public void drawData() {
    stroke(1);
    fill(0);
    for (int i = 1; i < point.size(); i++) line(point.get(i-1).getX(), point.get(i-1).getY(), point.get(i).getX(), point.get(i).getY());
  }

  // 初期化
  public void reset() {
    point = new ArrayList<Point>();
  }
}

// 座標の保存
class Point {
  private int x = 0;
  private int y = 0;

  Point(int x, int y) {
    this.x = x;
    this.y = y;
  }

  int getX() {
    return  x;
  }

  int getY() {
    return y;
  }
}
