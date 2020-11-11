package ouc.zhx.dao;

import org.apache.ibatis.annotations.Select;
import ouc.zhx.domain.Game;
import ouc.zhx.domain.PlayerInfo;

import java.util.List;

public interface IChallengeDao {

    @Select("select * from playersubmitinfo where groupId!=#{groupId}")
    public List<PlayerInfo> findAllPlayer(int groupId);

    @Select("select * from gameinfo")
    public List<Game> findAllGame();

    @Select("select * from playersubmitinfo where groupId=#{arg0} and gameId=#{arg1}")
    public PlayerInfo findPlayer(int groupId, int gameId);

    @Select("insert into playersubmitinfo(groupId,submitDate,parentPath,name,comment,gameId) " +
            "values(#{groupId},#{submitDate},#{parentPath},#{name},#{comment},#{gameId})" +
            "on duplicate key update submitDate=#{submitDate},name=#{name},comment=#{comment},parentPath=#{parentPath}; ")
    public void updatePlayer(PlayerInfo playerInfo);
}
