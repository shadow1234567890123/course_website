package OUC.neo4jtest;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ArrayList;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;


public class ReadExcel {
	private static final String EXCEL_XLS = "xls";
    private static final String EXCEL_XLSX = "xlsx";
	
    //读取pdb.xlsx，获取pdb列表
	public static ArrayList<String> getPdbIds() throws IOException
	{
		File finalXlsxFile = new File("D:\\pdb.xlsx");
		Workbook workBook = null;
        FileInputStream in = new FileInputStream(finalXlsxFile);
        if(finalXlsxFile.getName().endsWith(EXCEL_XLS)){     //Excel&nbsp;2003
        	workBook = new HSSFWorkbook(in);
        }else if(finalXlsxFile.getName().endsWith(EXCEL_XLSX)){    // Excel 2007/2010
        	workBook = new XSSFWorkbook(in);
        }
        
        ArrayList<String> list = new ArrayList<String>();
        
        // sheet 对应一个工作页
        Sheet sheet = workBook.getSheetAt(0);
        int rowNumber = sheet.getLastRowNum();    // 第一行从0开始算

        for (int i = 1; i <= rowNumber; i++) {
            Row row = sheet.getRow(i);
            if(row != null && row.getCell(1) != null && !list.contains(row.getCell(1).toString()))
            {
            	list.add(row.getCell(1).toString());
            }
        }
        return list;
	}
	
	//读取Sample.xlsx，获取Name-in-notebook列表
	public static ArrayList<String> getNameInNotebooks() throws IOException
	{
		File finalXlsxFile = new File("D:\\Sample-0628-2.xlsx");
		Workbook workBook = null;
        FileInputStream in = new FileInputStream(finalXlsxFile);
        if(finalXlsxFile.getName().endsWith(EXCEL_XLS)){     //Excel&nbsp;2003
        	workBook = new HSSFWorkbook(in);
        }else if(finalXlsxFile.getName().endsWith(EXCEL_XLSX)){    // Excel 2007/2010
        	workBook = new XSSFWorkbook(in);
        }
        
        ArrayList<String> list = new ArrayList<String>();
        
        // sheet 对应一个工作页
        Sheet sheet = workBook.getSheetAt(0);
        int rowNumber = sheet.getLastRowNum();    // 第一行从0开始算

        for (int i = 2; i <= rowNumber; i++) {
            Row row = sheet.getRow(i);
            if(row != null && row.getCell(0) != null && !list.contains(row.getCell(0).toString()))
            {
            	list.add(row.getCell(0).toString());
            }
        }
        return list;
	}
	
	

}
