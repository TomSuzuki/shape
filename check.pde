// check
class Check {
	// 座標
	private ArrayList<Point> point;
	private String data = "";
	private int type = 0;
	private int size = 0;
	
	// コンストラクタ
	private Check(ArrayList<Point> point) {
		this.point = new ArrayList<Point>();
		for (Point p : point) this.point.add(new Point(p));
		
		// get data
		data = compressionShape(point);
		println(">> ", "data : ", data);
	}
	
	// 形を調べる
	public String get() {
		int typeChangeCnt = 0;
		int len = data.length();
		int humming = - 1;
		Origin org = new Origin("","",0);
		for (Origin o : origin) {
			int h = o.getHumming(data);
			if ((humming == - 1 || h < humming) && h != - 1) {
				if (this.type != o.getType()) typeChangeCnt++;
				float v = 1.00 * (len - h) / len;
				humming = h;
				org = o;
				this.type = o.getType();
				println("humming log >> ","ID[" + o.getID() + "] \t","Match rate[" + nf(v,1,5) + "] \t","NAME[" + o.getName() + "] \t");
			}
		}
		
		println(">>","change count : ",typeChangeCnt);
		
		if (typeChangeCnt >= 4) {
			this.type = 0;
			org = new Origin("","",0);
		}
		
		return org.getName();
	}
	
	// 型を返す
	public int getType() {
		return type;
	}
	
	// 中心を求め、返す
	public Point getCenter() {
		Point min = new Point(point.get(0));
		Point max = new Point(point.get(0));
		for (Point p : point) {
			int x = p.getX();
			int y = p.getY();
			if (min.getX() > x) min.setX(x);
			if (min.getY() > y) min.setY(y);
			if (max.getX() < x) max.setX(x);
			if (max.getY() < y) max.setY(y);
		}
		int x = (max.getX() - min.getX()) / 2 + min.getX();
		int y = (max.getY() - min.getY()) / 2 + min.getY();
		this.size = ((max.getX() - min.getX()) + (max.getY() - min.getY())) / 2;
		return new Point(x,y);
	}
	
	// サイズを返す
	public int getSize() {
		return this.size;
	}
}

// ハミング距離を求める
int humming(String p1, String p2) {
	if (p1.length() != p2.length())return - 1;
	int n = 0;
	for (int i = 0; i < p1.length(); i++)
		if (!p1.substring(i, i + 1).equals(p2.substring(i, i + 1)))
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
		if (max.getX() < x) max.setX(x);
		if (max.getY() < y) max.setY(y);
	}
	int sizeX = max.getX() - min.getX();
	int sizeY = max.getY() - min.getY();
	
	// min size error
	if (sizeX < defaultShapeSize || sizeY < defaultShapeSize) return "";
	
	// draw grid
	int[][] gridDraw = new int[sizeX + 1][sizeY + 1];
	for (Point p : point) {
		int x = p.getX() - min.getX();
		int y = p.getY() - min.getY();
		gridDraw[x][y] = 1;
	}
	
	// create grid ...if gird < draw
	int[][] grid = new int[defaultShapeSize + 1][defaultShapeSize + 1];
	for (int x = 0;x < sizeX;x++) {
		for (int y = 0;y < sizeY;y++) {
			int gx = limit(Math.round(x * defaultShapeSize / sizeX), 0, defaultShapeSize);
			int gy = limit(Math.round(y * defaultShapeSize / sizeY), 0, defaultShapeSize);
			if (gridDraw[x][y] == 1) grid[gx][gy] = 1;
		}
	}
	
	// create String
	String s = "";
	for (int x = 0;x < defaultShapeSize;x++) for (int y = 0;y < defaultShapeSize;y++) s = s + grid[x][y];
	
	return s;
}

// 範囲内にデータを収める
int limit(int p1,int p2,int p3) {
	if (p1 < p2) return p2;
	if (p1 > p3) return p3;
	return p1;
}
