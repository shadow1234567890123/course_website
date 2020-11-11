package core.game;

import core.player.Player;

import java.util.HashMap;
import java.util.Map;

import core.board.Board;

public class Match {
	public Match() {
		// TODO Auto-generated constructor stub
	}

	public Match(int gameNumbers) {
		super();
		this.gameNumbers = gameNumbers;
	}
	
	public Match(int gameNumbers, Player one, Player another) {
		super();
		this.gameNumbers = gameNumbers;
		this.one = one;
		this.another = another;
	}

	public Map<String,Integer> process() {
		Player black = one;
		Player white = another;	
		for (int i = 0; i < gameNumbers; i++) {
			System.out.println("��ս������"+gameNumbers);
			System.out.println(black.name() + " : " + white.name() + " - " + (i + 1));
			Board board = new Board();
			Game game = new Game(board, black, white);
			String result = game.process();
			switch (result) {
			case "tie":
				tie++;
				break;
			case "White":
				if(i%2==0) {
					whiteWin++;
				}
				else {
					blackWin++;
				}
				
				break;
			case "Black":
				if(i%2==0) {
					
					blackWin++;
				}
				else {
					whiteWin++;
				}
				break;
			}
//			Player temp;
//			temp = black;
//			black = white;
//			white = temp;
			//exchange(black, white);
		}
		machResult.put(black.name(), blackWin);
		machResult.put(white.name(), whiteWin);
		machResult.put("tie", tie);

		return machResult;
	}

//	private void exchange(Player black, Player white) {
//		Player temp;
//		temp = black;
//		black = white;
//		white = temp;
//	}
	
	
	private int gameNumbers;	//һ�������ȼ���
	
	public Player getOne() {
		return one;
	}

	public void setOne(Player one) {
		this.one = one;
	}

	public Player getAnother() {
		return another;
	}

	public void setAnother(Player another) {
		this.another = another;
	}

	private Player one;			//����1
	private Player another;	    //����2
	
	private int whiteWin;
	private int blackWin;
	private int tie;
	
	Map<String, Integer> machResult=new HashMap<>();
}
