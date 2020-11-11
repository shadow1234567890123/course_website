package g11;

public class SW {
	public int getPos() {
		return pos;
	}
	public void setPos(int pos) {
		this.pos = pos;
	}
	public int getWhiteValue() {
		return whiteValue;
	}
	public void setWhiteValue(int whiteValue) {
		this.whiteValue = whiteValue;
	}
	private int pos;
	private int whiteValue;
	public SW(int pos, int whiteValue){
		this.pos=pos;
		this.whiteValue=whiteValue;
	}
	public void draw(){
		System.out.println("Pos:"+pos+", Value:"+whiteValue);
	}
}
