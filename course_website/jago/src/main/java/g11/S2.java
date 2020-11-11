package g11;
import java.util.ArrayList;
import java.util.LinkedList;

import core.game.Move;

public class S2 implements Comparable<S2>{
	private int index1=-1;
	private int index2=-1;
	private int val=0;
	private S2 parent;
	public S2(S1 atom1, S1 atom2){
		if(atom1!=null)this.index1=atom1.getPos();
		if(atom2!=null)this.index2=atom2.getPos();
		if(atom2!=null)this.val=atom2.getVal();
	}
	public boolean hasChild(){
		return !(index1==-1||index2==-1);
	}
	public int getVal(){
		return val;
	}
	public void setVal(int val){
		this.val=val;
	}
	public int[] getPos(){
		int pos[]=new int[2];
		pos[0]=index1;
		pos[1]=index2;
		return pos;
	}
	@Override
	public int compareTo(S2 other) {
		return this.getVal()==other.getVal()?0:(this.getVal()<other.getVal()?1:-1);//从小到大排序
	}
	public S2 getParent() {
		return parent;
	}
	public void setParent(S2 parent) {
		this.parent = parent;
	}
}
