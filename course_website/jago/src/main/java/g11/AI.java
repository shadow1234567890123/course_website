package g11;

import static core.board.PieceColor.EMPTY;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.PriorityQueue;

import core.board.Board;
import core.board.PieceColor;
import core.game.Game;
import core.game.Move;
import core.player.Player;

public class AI extends core.player.AI {
	//private int moveCount=0;
	private static final int searchBreadth=100;//閸擃亝鐏婇幖婊呭偍閻ㄥ嫬绠嶆惔锔肩礉鐏忚鲸妲哥拠瀛樻付婢舵碍婀佹径姘毌娑擃亣濡悙锟�?
	private static final int searchDepth=1;//閸擃亝鐏婇幖婊呭偍閻ㄥ嫭绻佹惔锟�?
	private SVB vb=new SVB();
	@Override
	public void playGame(Game game){
		super.playGame(game);
		b=new BB();
	}
	public Move findMove(Move move) {
		if(move!=null){
			b.set(move.index1(), getColor().opposite());
			b.set(move.index2(), getColor().opposite());
		}//鏇存柊瀵规墜鐨勮蛋锟�?
		S2 curNode=new S2(null, null);
		S2 bestNode=dfs(b, getColor(), curNode, null,1);

		b.set(bestNode.getPos()[0], getColor());
		b.set(bestNode.getPos()[1], getColor());
		//鏇存柊鑷繁鐨勮蛋锟�?
		return new Move(bestNode.getPos()[0], bestNode.getPos()[1]);
	}
	private S2 dfs(BB b, PieceColor color, S2 curNode, S2 parent,int curDepth){//鏉╂柨娲栨稉锟芥稉鐙給de閼哄倻鍋ｆ担锟�?璐熼拃钘夌摍閻ㄥ嫬寮懓锟�?
		if(curDepth>searchDepth){
			S2 result=new S2(null, null);
			result.setVal(getVal(b,color,2));
			return result;
		}
		vb.refresh(b);
		ArrayList<S1> atoms=vb.getBestAtoms(b, 100, color);
		ArrayList<S2> nodesToChoose=getBestNodesFromAtoms(color, b, atoms);
		curNode.setVal(color==PieceColor.BLACK?Integer.MIN_VALUE:Integer.MAX_VALUE);
		for(int i=0;i<nodesToChoose.size();i++){//鐏忓棛顑囨禍灞伙拷浣风瑏閵嗕降锟藉倶锟藉倶锟藉倷閲滃鍛达拷澶庡Ν閻愮绻樼悰灞剧槷鏉堝喛绱濋柅澶婂毉閺堬拷娴兼濡悙锟�?
			if(color==PieceColor.BLACK){//姒涙垼澹婇弰鐤X閺傜櫢绱濈拠鍕強閸婅壈绉烘径褑绉烘總锟�?
				int[] pos=new int[2];
				pos[0]=nodesToChoose.get(i).getPos()[0];
				pos[1]=nodesToChoose.get(i).getPos()[1];
				//System.out.println(""+Move.row(pos[0])+Move.col(pos[0])+Move.row(pos[1])+Move.col(pos[1]));
				b.set(pos[0],color);
				b.set(pos[1],color);
				//int curVal=getVal(b);
				S2 newNode=dfs(b, color.opposite(), nodesToChoose.get(i), curNode, curDepth+1);
				if(curNode!=null)
					curNode.setVal(Math.max(newNode.getVal(),curNode.getVal()));
				b.set(pos[0],PieceColor.EMPTY);
				b.set(pos[1],PieceColor.EMPTY);
			}else{//閻э拷?锟藉閺勭枹IN閺傜櫢绱濈拠鍕強閸婅壈绉虹亸蹇氱Ш婵傦拷
				int[] pos=new int[2];
				pos[0]=nodesToChoose.get(i).getPos()[0];
				pos[1]=nodesToChoose.get(i).getPos()[1];
				//System.out.println(""+Move.row(pos[0])+Move.col(pos[0])+Move.row(pos[1])+Move.col(pos[1]));
				b.set(pos[0],color);
				b.set(pos[1],color);
				//int curVal=getVal(b);
				S2 newNode=dfs(b, color.opposite(), nodesToChoose.get(i), curNode, curDepth+1);
				if(curNode!=null)
					curNode.setVal(Math.min(newNode.getVal(),curNode.getVal()));
				b.set(pos[0],PieceColor.EMPTY);
				b.set(pos[1],PieceColor.EMPTY);
			}
		}
		S2 bestNode=nodesToChoose.get(0);
		if(color==PieceColor.BLACK){
			for(int i=1;i<nodesToChoose.size();i++){
				if(nodesToChoose.get(i).getVal()>bestNode.getVal()){
					bestNode=nodesToChoose.get(i);
				}
			}
		}else{
			for(int i=1;i<nodesToChoose.size();i++){
				if(nodesToChoose.get(i).getVal()<bestNode.getVal()){
					bestNode=nodesToChoose.get(i);
				}
			}
		}
		return bestNode;
	}
	
	@Override
	public String name() {
		return "g11";
	}
	private int getVal(BB b,PieceColor color, int putCount){//濡澧滐拷?锟借顥愰惄妯兼畱鐠囧嫪鍙婇崙鑺ユ殶
		int val=0;
		for(int i=0;i<361;i++){
			for(int j=0;j<4;j++){
				val+=b.getRoads()[i][j].getVal(b,color,putCount);
			}
		}
		//System.out.println();
		return val;
	}
	private S2 getBestNodeFromAtoms(PieceColor color, BB b, ArrayList<S1> atoms){
		PriorityQueue<S2> nodes=new PriorityQueue<S2>(new Comparator<S2>() {
			@Override
	        public int compare(S2 n1, S2 n2) {
				return (color==PieceColor.BLACK?1:-1)*n1.compareTo(n2);
			}
		}); 
		for(S1 atom1:atoms){
			b.set(atom1.getPos(), color);
			int val1=getVal(b,color,1);
			atom1.setVal(val1);
			for(S1 atom2:atoms){
				if(atom1.getPos()>atom2.getPos()){
					b.set(atom2.getPos(), color);
					int val2=getVal(b,color,2);
					atom2.setVal(val2);
					S2 node=new S2(atom1, atom2);
					node.setVal(getVal(b,color,2));
					nodes.offer(node);
					b.set(atom2.getPos(), EMPTY);
				}
			}
			b.set(atom1.getPos(), EMPTY);
		}//閸︺劍澧嶉張澶嬪腹閼芥劗娈憂娑擃亣鎯わ拷?锟芥劒缍呯純顔绘崲闁琚辨稉顏囨儰鐎涙劧绱濋幎锟�?*(n-1)娑擃亝顥愰惄妯跨槑娴兼澘锟借壈顔囪ぐ鏇氱瑓閺夈儱缍嬫担婊嗗Ν閻愶拷
		S2 bestNode=nodes.poll();
		return bestNode;
	}
	private ArrayList<S2> getBestNodesFromAtoms(PieceColor color, BB b, ArrayList<S1> atoms){
		PriorityQueue<S2> nodes=new PriorityQueue<S2>(new Comparator<S2>() {
			@Override
	        public int compare(S2 n1, S2 n2) {
				return (color==PieceColor.BLACK?1:-1)*n1.compareTo(n2);
			}
		}); 
		for(S1 atom1:atoms){
			b.set(atom1.getPos(), color);
			int val1=getVal(b,color,1);
			atom1.setVal(val1);
			for(S1 atom2:atoms){
				if(atom1.getPos()>atom2.getPos()){
					b.set(atom2.getPos(), color);
					int val2=getVal(b,color,2);
					atom2.setVal(val2);
					S2 node=new S2(atom1, atom2);
					node.setVal(getVal(b,color,2));
					nodes.offer(node);
					b.set(atom2.getPos(), EMPTY);
				}
			}
			b.set(atom1.getPos(), EMPTY);
		}//閸︺劍澧嶉張澶嬪腹閼芥劗娈憂娑擃亣鎯わ拷?锟芥劒缍呯純顔绘崲闁琚辨稉顏囨儰鐎涙劧绱濋幎锟�?*(n-1)娑擃亝顥愰惄妯跨槑娴兼澘锟借壈顔囪ぐ鏇氱瑓閺夈儱缍嬫担婊嗗Ν閻愶拷
		ArrayList<S2> nodesToChoose=new ArrayList<>();
		int nodesSize=nodes.size();
		for(int i=0;i<Math.min(searchBreadth, nodesSize);i++){//闁褰囬崜宄稉顏勭秼閸撳秵娼甸惇瀣付婵傜晫娈戦懞鍌滃仯
			S2 newNode=nodes.poll();
			nodesToChoose.add(newNode);
		}
		return nodesToChoose;
	}
	BB b=null;
}
