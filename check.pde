// check
class Check {
	// 座標
	private ArrayList<Point> point;
	private String data = "";
	
	private Check(ArrayList<Point> point) {
		this.point = new ArrayList<Point>();
		for (Point p : point) this.point.add(new Point(p));
		
		// get data
		data = compressionShape(point);
		println(">> ", "data : ", data);
	}
	
	public String getType() {
		return "不明な形です。";
	}
}

// ハミング距離を求める
int humming(String p1, String p2) {
	if (p1.length() != p2.length())return - 1;
	int n = 0;
	for (int i = 0; i < p1.length(); i++)
		if (!p1.subSequence(i, 1).equals(p2.subSequence(i, 1)))
			n++;
	return n;
}

// 座標データの圧縮を行う
final int defaultShapeSize = 16;
String compressionShape(ArrayList<Point> point) {
  // get size
	Point min = new Point(point.get(0));
	Point max = new Point(point.get(0));
	for (Point p : point) {
		int x = p.getX();
		int y = p.getY();
		if (min.getX() > x) min.setX(x);
		if (min.getY() > y) min.setY(y);
		if (max.getX() < x) min.setX(x);
		if (max.getY() < y) min.setY(y);
	}
  int sizeX = max.getX() - min.getX();
  int sizeY = max.getY() - min.getY();
	
	return "";
}
