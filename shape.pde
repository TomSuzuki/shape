// Ctrl + Shift + B

ArrayList<Object> object = new ArrayList<Object>();

void setup() {
	size(720, 540);
  strokeWeight(10);
}

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
