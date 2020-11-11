package OUC.neo4jtest;


import org.neo4j.driver.v1.AuthTokens;
import org.neo4j.driver.v1.Driver;
import org.neo4j.driver.v1.GraphDatabase;
import org.neo4j.driver.v1.Record;
import org.neo4j.driver.v1.Session;
import org.neo4j.driver.v1.StatementResult;
import org.neo4j.driver.v1.Transaction;
import org.neo4j.driver.v1.TransactionWork;

import static org.neo4j.driver.v1.Values.parameters;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Hello world!
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	
    	//获取pdbid列表
    	ArrayList<String> pdbIdList = null;
    	//获取name-in-notebook列表
    	ArrayList<String> nameInNotebookList = null;
    	try {
			pdbIdList = ReadExcel.getPdbIds();
			nameInNotebookList = ReadExcel.getNameInNotebooks();
		} catch (IOException e) {
			System.out.println("something error");
		}
    	//System.out.println(pdbIdList.toString());
    	//System.out.println(nameInNotebookList.toString());
    	
    	//连接数据库
        Driver driver = GraphDatabase.driver( "bolt://localhost:7688", AuthTokens.basic( "neo4j", "123456" ) );
        Session session = driver.session();

        for(String pdbId:pdbIdList)
        {
        	File file = new File("D:\\result/"+ pdbId +"_resultsum.txt");
        	if(!file.exists()) {
        		//System.out.println("not exist");
        		continue;
        	}
        	
        	BufferedReader reader = null;
        	
        	try {
				reader = new BufferedReader(new FileReader(file));
				String str = null;
				Boolean isFirstLine = true;
				while((str = reader.readLine())!=null)
				{
					if(isFirstLine)
					{
						isFirstLine = false;
						continue;
					}
					String[] first = new String[3];
					String[] second = new String[2];
					first = str.split("  ");
					second = first[2].split(" ");
					System.out.println(first[0]+"##"+first[1]+"##"+second[0]+"##"+second[1]);
					String name_in_notebook = first[0];
					double oriscore = Double.parseDouble(first[1]);
					double numatoms = Double.parseDouble(second[0]);
					double lescore = Double.parseDouble(second[1]);
					
					if(nameInNotebookList.contains(name_in_notebook) && oriscore < -8 && lescore < -0.3)
					{
						String pycher = "match(a:Compound),(b:pdb) where a.Name_in_notebook = '"+ name_in_notebook +"' AND b.pdbid = '"+ pdbId +"' create (a)-[r:有活性 {oriscore: "+oriscore+", numatoms: "+numatoms+",lescore: "+lescore+"} ]->(b) return r";
				        System.out.println(pycher);
				        session.run(pycher);
					}
					
				}
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					reader.close();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}

        	//System.out.println("exist");
        }


        /*session.run( "CREATE (a:Aaaa {name: {name}, title: {title}})",
                parameters( "name", "Arthur", "title", "King" ) );*/
        //String pycher = "match(a:Compound),(b:pdb) where a.Name_in_notebook = '"+ "1987-13" +"' AND b.pdbid = '"+ "3RUK" +"' create (a)-[r:active {fenshu1: 12, fenshu2: 11} ]->(b) return r";
        //System.out.println(pycher);
        //session.run(pycher);
        
        //session.run("MATCH ()-[r:hehe关系]-() DETACH delete r");
        
        /*StatementResult result = session.run( "MATCH (a:Aaaa) WHERE a.name = {name} " +
                                              "RETURN a.name AS name, a.title AS title",
                parameters( "name", "Arthur" ) );

        while ( result.hasNext() )
        {
            Record record = result.next();
            System.out.println( record.get( "title" ).asString() + " " + record.get( "name" ).asString() );
        }*/

        session.close();
        driver.close();
    }
}
