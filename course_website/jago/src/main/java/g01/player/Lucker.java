package g01.player;

import core.board.Board;
import core.game.Game;
import core.game.Move;
import core.player.Player;

import java.util.Random;

import static core.board.PieceColor.EMPTY;
import static core.game.Move.SIDE;

//�ֲ������߷�3��
public class Lucker extends Player {

	private Board board = new Board();
	@Override
	public Move findMove(Move arg0) {
		int num = 0;
		Board b = board;
    	Random rand = new Random();
    	int first1, first2, second1, second2;
    	while (true) {
    		if(num >= 10)
    			break;
    		//�ȶ�ά����һά��
    		first1 = 3+rand.nextInt(13);
    		first2 = 3+rand.nextInt(13);
    		second1 = 3+rand.nextInt(13);
    		second2 = 3+rand.nextInt(13);
    		
    		int index1 = first1*19+first2;
    		int index2 = second1*19+second2;
    		
    		if (index1 != index2 
    				&& b.get(index1) == EMPTY 
    				&& b.get(index2) == EMPTY)
    			return new Move(index1, index2);
    		num++;
    	}
    	while (true) {
    		int index1 = rand.nextInt(SIDE * SIDE);
    		int index2 = rand.nextInt(SIDE * SIDE);
    		
    		if (index1 != index2 
    				&& b.get(index1) == EMPTY 
    				&& b.get(index2) == EMPTY)
    			return new Move(index1, index2);
    	}
	}

	@Override
	public boolean isManual() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public String name() {
		// TODO Auto-generated method stub
		return "Lucker";
	}

	@Override
	public void playGame(Game game) {
		super.playGame(game);
		board = new Board();
	}

}
