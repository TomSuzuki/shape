// object
class Object {
	
	private int type = 0;
	private Point point;
	private int col1,col2;
	private int size;
	
	private int[] col1s = new int[]{#0088FF,#7AB8D3,#C7DBCA,#FFDFB2,#ED9EED,#BF95BC};	// fill
	private int[] col2s = new int[]{#38AAFF,#0094D3,#7FFFD4,#FFBB5B,#F767D5,#BC53B3};	// stroke
	
	// コンストラクタ
	public Object(int type ,Point point,int size) {
		this.type = type;
		this.point = point;
		this.size = size;
		int r = int(random(col1s.length));
		col1 = col1s[r];
		col2 = col2s[r];
	}
	
	// 表示
	public void draw() {
		fill(col1);
		stroke(col2);
		if (type == 1) draw_triangle(point.getX(),point.getY(),size); // さんかく
		else if (type == 2) ellipse(point.getX(), point.getY(), size, size); // まる
		else if (type == 3) rect(point.getX() - size / 2, point.getY() - size / 2, size, size);; // しかく
	}
	
}

// 正三角形を描く
void draw_triangle(int x,int y,int n) {
	int angle = 0;
	
	float b = n * sqrt(3) / 4.0;
	float c = n / 4.0;
	float d = c * tan(radians(30));
	
	float x1 = 0;
	float y1 = - (b + d);
	
	float r = radians(120);
	float x2 = x1 * cos(r) - y1 * sin(r);
	float y2 = x1 * sin(r) + y1 * cos(r);
	
	float x3 = x1 * cos(r * 2) - y1 * sin(r * 2);
	float y3 = x1 * sin(r * 2) + y1 * cos(r * 2);
	
	pushMatrix();
	translate(x, y);
	rotate(radians(angle));
	triangle(x1, y1, x2, y2, x3, y3);
	popMatrix();
}
