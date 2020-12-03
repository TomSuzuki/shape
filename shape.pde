// Ctrl + Shift + B

ArrayList<Object> object = new ArrayList<Object>();
ArrayList<Origin> origin = new ArrayList<Origin>();

// 初期化
void setup() {
	size(720, 540);
	strokeWeight(10);
	
	// load data
	Table table = loadTable("data.csv", "header");
	int id = 2;
	for (TableRow row : table.rows()) {
		String shape = row.getString("Shape");
		String data = row.getString("Data");
		origin.add(new Origin(shape, data, id++));
	}
	
	println("data num : ", table.getRowCount());
}

// 描画
void draw() {
	
	// draw object
	background(255);
	for (Object o : object) o.draw();
	
	// mouse
	boolean flg = drawShape();
	
	// check main
	if (flg == true) {
		
		// print
		println();
		println("Check Shape Type");
		println(">> ", "Point Num：", data.point.size());
		
		// data type
		Check check = new Check(data.point);
		println(">> ", "Type : ",check.get());
		
		// create object
		object.add(new Object(check.getType(),check.getCenter(),check.getSize()));
	}
}
