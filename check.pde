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
		int len = data.length();
		
		// 仮
		String triangle = "0000000000000011000000000000110100000000001110010000000011100001000000111000000100000110000000010001100000000001001100000000000111000000000000011111000000000001000111000000000100000110000000010000000110000001000000000110000100000000000110010000000000000111";
		String circle = "0000111111110000000110000000110000100000000001000110000000000010010000000000001010000000000000011000000000000001100000000000000110000000000000011000000000000001100000000000000110000000000000011100000000000001011000000000001000110000000001100000111100111100";
		String square = "1111111111111111100000000000000110000000000000011000000000000001100000000000000110000000000000011000000000000001100000000000000110000000000000011000000000000001100000000000000110000000000000011000000000000001100000000000000110000000000000011111111111111111";
		
		int humming_triangle = humming(data,triangle);
		int humming_circle = humming(data,circle);
		int humming_square = humming(data,square);
		
		println("------------------------");
		println("humming");
		println(">>", "len : ", len);
		println(">> ","triangle : ",(100 * (len - humming_triangle) / len) ," % ");
		println(">> ","circle : ",(100 * (len - humming_circle) / len) , " % ");
		println(">> ","square : ",(100 * (len - humming_square) / len) , " % ");
		println("------------------------");
		
		int max = Math.min(humming_triangle,Math.min(humming_circle,humming_square));
		
		if (max == humming_triangle) return "三角形です。";
		if (max == humming_circle) return "丸です。";
		if (max == humming_square) return "四角形です。";
		
		return "不明な形です。";
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
