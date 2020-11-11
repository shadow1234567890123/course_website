package g08;
import java.awt.Point;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import baseline.player.Board4AI;
import core.board.PieceColor;
import core.game.Game;
import core.game.Move;

public class AI extends core.player.AI 
{
	public StaticBoard b;
	public PieceColor myPieceColor;
	public PieceColor yourPieceColor;
//	@Override
//	public void playGame(Game game) {
//		_game = game;
//	}
    public AI()
    {
    	super();
    	b = new StaticBoard();	
    }
	@Override
	public String name() {
		return "g08";
	}
	public void playGame(Game game) {
		super.playGame(game);
		b.clear();
		myPieceColor = this.getColor();
		yourPieceColor = myPieceColor.opposite();
	}

   
	@Override
	public Move findMove(Move opponentMove) 
	{
//		myPieceColor = this.getColor();
//     	yourPieceColor = myPieceColor.opposite();
		int c,v;
		Road road ;
		
		if(opponentMove == null)
		{
			b.IsetPiece(new Point(9,10),this.getColor());
			b.IsetPiece(new Point(10,10), myPieceColor);
			Move move = new Move(181,200);
			return move;
		}
		
		c=opponentMove.index1();
		v=opponentMove.index2();
		b.YousetPiece(new Point(c/19,c%19), yourPieceColor);
		b.YousetPiece(new Point(v/19,v%19), yourPieceColor);

		int[] p=new int[2];	
		
		HashMap<Integer,Integer> h ;
		
		for(int i=0;i<2;i++)
		{
			road = StaticBoard.table.roadTable.peek();
			h = road.emptyPos;//取出该路的所有空位
			if(road.value>9000)
			{			
				for(Map.Entry<Integer, Integer> entry:h.entrySet())
				{//空位里选第一个落子  
					p[i] = entry.getKey();	break;
				}
			}
			else
			{
				p[i] = findnextMove(h);
			}
			
		
			b.IsetPiece(new Point(p[i]/19,p[i]%19), myPieceColor);
		}
		Move move = new Move(p[0],p[1]);
		return move;
	}
	
	public int findnextMove(HashMap<Integer,Integer> h)
	{
		int max = Integer.MIN_VALUE;
		int maxpos = 0;
		HashMap<Integer,Integer> p = new HashMap<Integer,Integer>() ;
		for(Map.Entry<Integer, Integer> entry:h.entrySet())
		{
			p.put(entry.getKey(), entry.getValue());
		}

		for(Map.Entry<Integer, Integer> entry:p.entrySet())
		{
			Backups backup= new Backups(entry.getKey());
			Point point =new Point(entry.getKey()/19,entry.getKey()%19);
			b.ITry(point, myPieceColor,backup);
			ArrayList<Road> temp = new ArrayList<>();
			int power = 0;
			Road t;
			
			if(myPieceColor == PieceColor.BLACK)
			{
				for(int i=0;i<20;i++)
				{
					t = StaticBoard.table.roadTable.poll();
					power += (t.Blacknum-t.Whitenum)*100;
					temp.add(t);
				}
			}
			else
			{
				for(int i=0;i<5;i++)
				{
					t = StaticBoard.table.roadTable.poll();
					power += (t.Whitenum-t.Blacknum)*100;
					temp.add(t);
				}
			}
			
			StaticBoard.table.roadTable.addAll(temp);	
			if(power>max)
			{
				max = power;
				maxpos=entry.getKey();
			}
			b.Returnback(point, 1,backup);
		}	
		return maxpos;
		
	}

}
