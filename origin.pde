// 元データ
class Origin {
	
	private int type = 0;
	private String data;
	private int id;
	private String[] typeStr = new String[]{"unknown","triangle","circle","square"};
	
	// コンストラクタ
	public Origin(String type,String data,int id) {
		this.data = data;
		this.id = id;
		for (int i = 0;i < typeStr.length;i++) if (type.equals(typeStr[i])) this.type = i;
	}
	
	// ハミング距離を返す
	public int getHumming(String p1) {
		return humming(this.data,p1);
	}
	
	// 型を返す
	public int getType() {
		return this.type;
	}
	
	// 名前を返す
	public String getName() {
		return this.typeStr[this.type];
    }

	// IDを返す
	public int getID(){
		return this.id;
	}
	
}