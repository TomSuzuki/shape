// check
class Check {
  // 座標
  private ArrayList<Point> point;

  private Check(ArrayList<Point> point) {
    point = new ArrayList<Point>();
    for (Point p : point) this.point.add(new Point(p.getX(), p.getY()));
  }

  public String getType() {
    return "不明な形です。";
  }
}
