package core.game;

import static core.board.PieceColor.BLACK;
import static core.board.PieceColor.EMPTY;
import static core.board.PieceColor.WHITE;

import java.awt.Frame;

import core.player.Player;
import jagoclient.Global;
import jagoclient.board.GoFrame;
import jagoclient.board.LocalGoFrame;
import core.board.Board;


/** Controls the play of the game.
 *  @author
 */
public class Game {
	private static final int MAXSTEP = 180;
	
	
    /** A new Game, using BOARD to play on */
	public Game(Board board) {
        _board = board;
    }
	
	
	public Game(Board board, Player black, Player white) {
		this(board);
		this.black = black;
		this.white = white;
		black.setColor(BLACK);
		white.setColor(WHITE);
		black.playGame(this);
		white.playGame(this);
		
		Global.setApplet(false);
		Global.home(System.getProperty("user.home"));
		Global.readparameter(".go.cfg");
		Global.createfonts();
		//Global.frame(new Frame());
		
		
		//JagoSound.play("high", "", true);
		_constBoard = new LocalGoFrame(new Frame(), Global.resourceString("Local_Viewer"));
		
		//_constBoard=new PartnerGoFrame(new PartnerFrame("title", false), "Local_Viewer", 2000, 2000,2000, 1000, 1000,1000);
		//_constBoard=new IgsGoFrame(new ConnectionFrame("name", "UTF-8"), "title");
		//_constBoard.alarm();
		Global.setcomponent(_constBoard);
	}
	
	public boolean isValidMove(Move move) {
    	if(Move.validSquare(move.index1())&&Move.validSquare(move.index2())&&_board.get(move.index1()) == EMPTY&&_board.get(move.index2()) == EMPTY) {
    		return true;
    	}
    	return false;
    }
	
    /** My board and its read-only view. */
    private Board _board;
    private GoFrame _constBoard = new GoFrame("liuziqi");
    //private GoFrame _constBoard;
    //private PartnerGoFrame _constBoard;
    //private IgsGoFrame _constBoard;
    public String process() {
    	Move currentMove = null;
    	_board.clear();
    	_board.draw();
    	int step = 0;
    	
        while (true) {
        	Move move = null;
        	if (_board.whoseMove() == BLACK) {
        		currPlayer = black;
        		currTimer=blackTimer;
        	} else {
        		currPlayer = white;
        		currTimer=whiteTimer;
        	}
        	
    		if (currPlayer.isManual()) System.out.print(currPlayer.getColor() + ">");
    		
    		try {
    			
//    			thread=new Thread(new Runnable() {
//					@Override
//					public void run() {
//						// TODO Auto-generated method stub
//						while(true) {
//							if(currTimer.getCountTime()>5) {
//								
//							}
//							try {
//								Thread.sleep(1000);
//							} catch (InterruptedException e) {
//								// TODO Auto-generated catch block
//								e.printStackTrace();
//							}
//							
//						}
//					}
//				});
//    			thread.start();
    			currTimer.restartTime();
    			move = currPlayer.findMove(currentMove);
    			currTimer.stopTime();
    			//thread.stop();
    			if(currTimer.getCountTime()>900) {
    				result=currPlayer.getColor() + "--" + currPlayer.name()+" out of time��"+currPlayer.getColor().opposite()+" is Win";
    				System.out.println(result);
    				_constBoard.B.setResult(result);
    				record();
    				//break;
    				return currPlayer.getColor().opposite().toString();
    			}
    			if(!isValidMove(move)) {
    				result=currPlayer.getColor() + "--" + currPlayer.name()+" appear error position��"+currPlayer.getColor().opposite()+" is Win";
    				System.out.println(result);
    				_constBoard.B.setResult(result);
    				record();
    				//break;
    				return currPlayer.getColor().opposite().toString();
    			}
    			
			} catch (Exception e) {
				result=currPlayer.getColor() + "--" + currPlayer.name()+" appear exception��"+currPlayer.getColor().opposite()+" is Win";
				System.out.println(result);
				_constBoard.B.setResult(result);
				record();
				//break;
				return currPlayer.getColor().opposite().toString();
			}
    		
    		
            step++;
        	System.out.println(step + "> " + currPlayer.name() + "(" + currPlayer.getColor().shortName().toUpperCase() + "): " + "move " + move.toString());
        	_board.makeMove(move);
        	_board.draw();
//        	try {
//				Thread.sleep(500);
//			} catch (InterruptedException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
        	int i = move.row0() - 'A';
        	int j = move .col0() - 'A';
        	_constBoard.B.set(j, i);
        	_constBoard.B.showinformation();
        	_constBoard.B.copy();
        	
//        	try {
//				Thread.sleep(500);
//			} catch (InterruptedException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
        	i = move.row1() - 'A';
        	j = move.col1() - 'A';
        	_constBoard.B.set(j, i);
        	_constBoard.B.showinformation();
        	_constBoard.B.copy(); 
        	
        	currentMove = move;
        	
        	
        	if (_board.gameOver()) {
        		result="Game Over, " + currPlayer.getColor() + "--" + currPlayer.name() + " is win";
        		System.out.println(result);
        		_constBoard.B.setResult(result);
        		record();
        		//break;
        		return currPlayer.getColor().toString();
        	}
        	
        	if (step == MAXSTEP) {
        		result="Game Over, draw...";
        		System.out.println(result);
        		_constBoard.B.setResult(result);
        		record();
        		//break;
        		return "tie";
        	}
        }
    }
    
    /**  recording the game into a file */
    public void record() {
    	//��¼����˫�����֣�����ʱ�䣬���������
    	
    	//��¼�����������߲�
    	_constBoard.B.setinformation(black.name(), "", white.name(), "", "", "");
    	_constBoard.doAction("Save");
    }
    
    Player black = null;	//ִ�ڵ�����
    Player white = null;    //ִ�׵�����
    Timer blackTimer=new Timer();
    Timer whiteTimer=new Timer();
    
    
    Thread thread;
    Player currPlayer;
	Timer currTimer;
	String result;
    //ArrayList<Move> moveList = new ArrayList<>();
}
