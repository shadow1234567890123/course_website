package g11;

import static core.board.PieceColor.BLACK;
import static core.board.PieceColor.EMPTY;
import static core.game.Move.SIDE;

import java.util.ArrayList;
import java.util.HashSet;

import core.board.Board;
import core.board.PieceColor;
import core.game.Move;
import g11.SBQ;
/**
 * 这个ValuedBoard是存放的一个棋盘，与Board不同的地方在于它存放的是一个位置、这个位置放置黑子影响的评估值、这个位置放置白子影响的评估值
 * @author lpdirect3d9
 *
 */
public class SVB {
	private SBQ blackQueue;
	private SWQ whiteQueue;
	public SVB(){
		blackQueue=new SBQ();
		whiteQueue=new SWQ();
	}
	public void draw(){
		String strBuff="";
		for(int i=0;i<19;i++)
			strBuff+=("        "+(char)('A'+i)+"   ");
		System.out.println(strBuff);
		for(int i=0;i<19;i++){
			System.out.print((char)('A'+i)+" ");
			for(int j=0;j<19;j++){
				System.out.printf("%4d %4d,  ",blackQueue.get(i*19+j),whiteQueue.get(i*19+j));
			}
			System.out.println();
		}
	}
	public void refresh(BB b){
		blackQueue.clear();
		whiteQueue.clear();
		for(int i=0;i<361;i++){
			if(b.get(i)==PieceColor.EMPTY){
				SB bn=new SB(i, 0);
				int[] before=new int[2];
				int[] after=new int[2];
				before[0]=b.getBlackValueSumInInfluencedRoads(i);
				before[1]=b.getWhiteValueSumInInfluencedRoads(i);
				b.set(i, PieceColor.BLACK);
				after[0]=b.getBlackValueSumInInfluencedRoads(i);
				b.set(i, PieceColor.WHITE);
				after[1]=b.getWhiteValueSumInInfluencedRoads(i);
				b.set(i, PieceColor.EMPTY);
				blackQueue.offer(i, after[0]-before[0]);
				whiteQueue.offer(i, after[1]-before[1]);
			}
		}
		//draw();
		/*HashSet<Integer> emptyPos=new HashSet<>();
		ArrayList<Road> relatedRoads = b.findInfluencedRoads(move);//根据对手的上一步推测出影响的路
		for(Road road:relatedRoads){
			emptyPos.addAll(road.getAllAvailablePos(b));
		}//影响的路中的空白点集合，这些点的（如果下黑子会影响的评价值）和（如果下白子会影响的评价值）要更新
		for(Integer i:emptyPos){
			//System.out.println("total "+emptyPos.size()+" blank pos");
			BlackNode bn=new BlackNode(i, 0);
			int[] before=new int[2];
			int[] after=new int[2];
			before[0]=b.getBlackValueSumInInfluencedRoads(move);
			before[1]=b.getWhiteValueSumInInfluencedRoads(move);
			b.set(i, PieceColor.BLACK);
			after[0]=b.getBlackValueSumInInfluencedRoads(move);
			b.set(i, PieceColor.WHITE);
			after[1]=b.getWhiteValueSumInInfluencedRoads(move);
			b.set(i, PieceColor.EMPTY);
			blackQueue.offer(i, after[0]-before[0]);
			whiteQueue.offer(i, after[1]-before[1]);
		}*/
	}
	public ArrayList<S1> getBestAtoms(BB b, int count, PieceColor pc){
		ArrayList<S1> atoms=new ArrayList<S1>();
		if(pc==PieceColor.BLACK){
			ArrayList<SB> blackNodes=blackQueue.getBestNodes(b, count);
			for(SB blackNode:blackNodes){
				atoms.add(new S1(blackNode.getPos(), blackNode.getBlackValue()));
			}
		}else{
			ArrayList<SW> whiteNodes=whiteQueue.getBestNodes(b, count);
			for(SW whiteNode:whiteNodes){
				atoms.add(new S1(whiteNode.getPos(), whiteNode.getWhiteValue()));
			}
		}
		return atoms;
	}
	public void clear(){
		blackQueue.clear();
		whiteQueue.clear();
	}
	public void remove(int pos){
		blackQueue.remove(pos);
		whiteQueue.remove(pos);
	}
	public static void main(String[] args){
		SVB vb=new SVB();
		vb.blackQueue.offer(1, 1);
		vb.blackQueue.offer(1, 2);
		vb.blackQueue.offer(1, 3);
		vb.blackQueue.offer(1, 4);
	}
}
