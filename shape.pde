// Ctrl + Shift + B

void setup() {
	size(500, 500);
}


void draw() {
	
	// check main
	boolean flg = drawShape();
	if (flg == true) {
		// debug
		background(255, 0, 0);
		
		// print
		println();
		println("Check Shape Type");
		println(">> ", "Point Num：", data.point.size());
		
		// data type
		Check check = new Check(data.point);
		println(">> ", "Type : ",check.getType());
	}
}
