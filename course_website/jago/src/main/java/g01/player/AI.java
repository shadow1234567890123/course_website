package g01.player;

//enum被隐式地用static final定义过，所以。。。

import core.board.Board;
import core.board.PieceColor;
import core.game.Move;

import java.util.ArrayList;

import static core.board.PieceColor.*;

public class AI extends core.player.AI {
	private int WIDTH = 19;
	private int ROAD_NUM = 6;
	private Board board = new Board();

	private PieceColor getOpponentColor() {
		return this.getColor() == WHITE ? BLACK : WHITE;
	}

	@Override
	public Move findMove(Move opponentMove) {
        if (opponentMove == null) {
            Move move = firstMove();
            board.makeMove(move);
            return move;
        }
        else {
            board.makeMove(opponentMove);
        }
		//********preparing for finding*********//

		Board b = board();
		int pos1 = -1, pos2 = -1;
		PieceColor[][] board = new PieceColor[19][19];
		PieceColor[] line_board = new PieceColor[19*19];
		for(int i = 0; i < WIDTH*WIDTH; i++)
			line_board[i] = b.get(i);
		for(int i = 0; i < WIDTH; i++)
			for(int j = 0; j < WIDTH; j++)
				board[i][j] = b.get(getPos(i, j));

		//********finish preparing**************//
		PieceColor color = this.getColor();
		PieceColor opponentColor = this.getOpponentColor();
		int meMaxColorNum = 0, opponentMaxColorNum = 0;
		double maxReferenceValue = 0;
		Road meMaxRoad = null, opponentMaxRoad = null,  maxRoad = null;
		Road choosenRoad = null;
		//boolean on_off = false;
		for(int i = 0; i < WIDTH*WIDTH; i++) {
			ArrayList<Road> roads = Road.findRoads(line_board, i);
			for(Road road: roads) {
				//road.printState();
				int opponentNum = road.countPiece(opponentColor), myNum = road.countPiece(color);

				double referenceValue = opponentNum  * 0.8 + myNum * 1.2;
				if (referenceValue > maxReferenceValue && road.hasTowSpace()) {
					 maxRoad = road;
					maxReferenceValue = referenceValue;
				}

				/*
				if(road.countPiece(opponentColor) > opponentMaxColorNum
						&& road.hasTowSpace()) {
					opponentMaxRoad = road;
					opponentMaxColorNum = road.getColorNum(opponentColor);
				}
				if(road.countPiece(color) > meMaxColorNum
						&& road.hasTowSpace()) {
					meMaxRoad = road;
					meMaxColorNum = road.getColorNum(color);
				}*/
			}
		}

		//choosenRoad = meMaxColorNum > opponentMaxColorNum ?
		//		meMaxRoad : opponentMaxRoad;
		//choosenRoad.printState();
		choosenRoad = maxRoad;
		//System.out.println(choosenRoad.getState()[1].shortName());
		for(int i = 0; i < 6; i++) {
			if(choosenRoad.getState()[i] == PieceColor.EMPTY) {
				if(pos1 == -1)
					pos1 = choosenRoad.getPosOnBoard(i);
				else {
					if(pos2 == -1) {
						pos2 = choosenRoad.getPosOnBoard(i);
						break;
					}
				}
			}
		}
		Move move = new Move(pos1, pos2);
		b.makeMove(move);
		return move;
	}
	public Board board() {
		return board;
	}

	//pos : 0 - 360
	//row and col are 0 to 18
	private int getRow(int pos) {
		return pos / WIDTH;
	}
	private int getCol(int pos) {
		return pos - (pos / WIDTH) * WIDTH;
	}
	private int getPos(int row, int col) {
		return WIDTH * row + col;
	}
	@Override
	public String name() {
		return "g01";
	}

}
