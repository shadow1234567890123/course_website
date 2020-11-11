package g11;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.Iterator;
import java.util.PriorityQueue;
import core.board.Board;
import core.board.PieceColor;

public class SBQ {
	private PriorityQueue<Integer> positions;
	private SB[] blackBoard;
	public SBQ(){
		blackBoard=new SB[361];
		for(int i=0;i<361;i++)
			blackBoard[i]=new SB(i, 0);
		positions=new PriorityQueue<Integer>(new Comparator<Integer>() {
			@Override
			public int compare(Integer o1, Integer o2) {
				return blackBoard[o1].getBlackValue()<blackBoard[o2].getBlackValue()?1:-1;
			}
		});
	}
	public boolean offer(int pos, int blackValue){
		blackBoard[pos].setBlackValue(blackValue);
		return positions.offer(pos);
	}
	public void clear(){
		positions.clear();
	}
	public void remove(int pos){
		positions.remove(pos);
	}
	public ArrayList<Integer> getBestPos(Board b, int count){
		ArrayList<Integer> result=new ArrayList<Integer>();
		int i=0;
		for(Iterator<Integer> iter = positions.iterator(); iter.hasNext()&&i<count;){
			Integer pos=(Integer)iter.next();
			if(b.get(pos)==PieceColor.EMPTY){
				result.add(pos);
				i++;
			}else{
				positions.remove(iter);
			}
		}
		return result;
	}
	public ArrayList<SB> getBestNodes(BB b, int count){
		ArrayList<SB> result=new ArrayList<SB>();
		int i=0;
		for(Iterator<Integer> iter = positions.iterator(); iter.hasNext()&&i<count;){
			Integer pos=(Integer)iter.next();
			if(b.get(pos)==PieceColor.EMPTY){
				result.add(new SB(pos, blackBoard[pos].getBlackValue()));
				i++;
			}else{
				positions.remove(iter);
			}
		}
		return result;
	}
	public void draw(){
		for(Iterator<Integer> iter = positions.iterator(); iter.hasNext();){
			(blackBoard[(Integer)iter.next()]).draw();
		}
	}
	public int get(int i){
		return blackBoard[i].getBlackValue();
	}
}
