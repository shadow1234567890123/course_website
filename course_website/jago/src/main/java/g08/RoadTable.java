package g08;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Map;
import java.util.PriorityQueue;
import java.util.Queue;


import core.board.PieceColor;

public class RoadTable {
	private final int SIZE=19;  
	//hashMap������������Ϊ�������ظ�����Ӱ�쵽������·,���24��
	HashMap<Integer, ArrayList<Road>> relateRoads =new HashMap<>();
	//����·����Ȩֵ�������򣬶���·ΪȨֵ��ߵ�·
	Queue<Road>  roadTable= new PriorityQueue<>(idComparator);
	public static Comparator<Road> idComparator =new Comparator<Road>()
	{
		public int compare(Road r1,Road r2)
		{
			return (int)(r2.value-r1.value);
		}
	};
	//·���ʼ��

	
	public ArrayList<Road> temp = new ArrayList<>();
	public void roadTableUpdate(int index,PieceColor color, int youOrMe) 
	{   //���Ӻ�˺����ɸ�������·��
		//��temp�б������·��
		ArrayList<Road> R = relateRoads.get(index);
		int len=R.size();
	    Road o;
		for(int i=0;i<len;i++)//���������ӵ���Ӱ�쵽������·
		{
			o =R.get(i);
			roadTable.remove(o);//��������·�����Ҹ��º���
			if(!o.SelfUpdate(index, color, youOrMe))
			{//�������·�Ѿ�������ˣ�ͬʱ���кڰ��ӣ�����ɾ������·�����м�¼
				R.remove(i);//��Ϊ���Ѿ�û���κμ�ֵ��
				i--;len--;//����ָ��
			}
			else
			{//������º�����·��Ȼֻ��һ����ɫ�����ӣ�����������ȶ��У��������ȶ�������
				roadTable.add(o);
			}		
		}
	}	

	public void roadTableUpdate(int index,PieceColor color, int youOrMe,Backups backup)
	{
		ArrayList<Road> R = relateRoads.get(index);
		int len=R.size();
	    Road o;
		for(int i=0;i<len;i++)//���������ӵ���Ӱ�쵽������·
		{
			o =R.get(i);
			roadTable.remove(o);//��������·�����Ҹ��º���
			if(!o.SelfUpdate(index, color, youOrMe))
			{//�������·�Ѿ�������ˣ�ͬʱ���кڰ��ӣ�����ɾ������·�����м�¼
				backup.Interrupt.add(R.remove(i));//��Ϊ���Ѿ�û���κμ�ֵ��
				i--;len--;//����ָ��
			}
			else
			{//������º�����·��Ȼֻ��һ����ɫ�����ӣ�����������ȶ��У��������ȶ�������
				roadTable.add(o);
			}		
		}
	}
	
	
	public void roadTableReturnBack(int index,int youOrMe,Backups backup) 
	{
		ArrayList<Road> R = relateRoads.get(index);
		//R.addAll(backup.Interrupt);		
		for(Road r : R)
		{
			roadTable.remove(r);
			r.SelfReturnBack(index, 1);
			if(r.Blacknum !=0 && r.Whitenum != 0)
				R.remove(r);
			else
			roadTable.add(r);
		}
		for(Road r : backup.Interrupt)
		{
			r.SelfReturnBack(index, 1);
			if(r.Blacknum ==0 || r.Whitenum == 0)
			{		
				R.add(r);
				roadTable.add(r);
			}
			
		}
	}
	
	public void clear()
	{
		roadTable.clear();
		relateRoads.clear();
		for(int i=0;i<SIZE;i++)
		{
			for(int j=0;j<SIZE;j++)
			{
				int pos = i*SIZE+j;
				relateRoads.put(pos, new  ArrayList<Road>());
				if(i<=5)
				{
					roadTable.add(new Road(pos,Direction.Down));
					if(j<=13)
					{
						roadTable.add(new Road(pos,Direction.RDown));
						roadTable.add(new Road(pos,Direction.Right));
					}
				}
				else if(i<=13)//i>5&&i<=13
				{
					roadTable.add(new Road(pos,Direction.Down));
					if(j<=13)
					{
						roadTable.add(new Road(pos,Direction.RUp));
						roadTable.add(new Road(pos,Direction.Right));
						roadTable.add(new Road(pos,Direction.RDown));
					}
				}
				else //i>13
				{
					if(j<=13)
					{
						roadTable.add(new Road(pos,Direction.RUp));
						roadTable.add(new Road(pos,Direction.Right));
					}
				}//end else
			}//end for��j��
		}//end for��i��
		
		roadTable.forEach(integer->
		{//��ʼ��relateRoads
			HashMap<Integer,Integer> temp=integer.emptyPos;
			for(Map.Entry<Integer, Integer> entry:temp.entrySet())
			{
				relateRoads.get(entry.getKey()).add(integer);
			}
		});	
	    roadTableUpdate(180, PieceColor.BLACK, 1);
		
	}
}
