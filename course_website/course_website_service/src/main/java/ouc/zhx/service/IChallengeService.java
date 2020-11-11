package ouc.zhx.service;

import ouc.zhx.domain.Game;
import ouc.zhx.domain.PlayerInfo;

import java.util.List;

public interface IChallengeService {
    //提交新的棋手
    public boolean updatePlayer(PlayerInfo playerInfo);
    //筛选出组号对应的所有挑战信息

    //筛选出棋类、对方棋手（棋手的名字及组号）及棋手信息（组号、提交棋手时间、备注信息）
    public List<Game> queryAllGame();

    public List<PlayerInfo> queryAllPlayer(int groupId); //不包括自己的棋手

    public PlayerInfo queryPlayer(int groupId, int gameId);   //自己的棋手

}
