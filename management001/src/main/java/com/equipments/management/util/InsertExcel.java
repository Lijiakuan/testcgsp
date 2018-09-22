package com.equipments.management.util;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 2017/12/3.
 */
public class InsertExcel {
    public InsertExcel(){}
    public static void start(InputStream in , String path) throws FileNotFoundException, IOException {
        Workbook book = getWorkBook(in,path);   //1.获取工作簿
        List<Sheet> sheets = getSheets(book);   //2.获取所有工作表
        SheetIterator(sheets);    //3.对所有工作表进行操作
    }

    //1.获取工作簿
    public static Workbook getWorkBook(InputStream in,String path) throws FileNotFoundException, IOException {
        return path.endsWith(".xls") ? (new HSSFWorkbook(in))
                : (path.endsWith(".xlsx") ? (new XSSFWorkbook(in)) : (null));
    }

    //2.获取所有工作表
    private static List<Sheet> getSheets(Workbook book) {
        int numberOfSheets = book.getNumberOfSheets();
        System.out.println("numberOfSheets:" + numberOfSheets);
        List<Sheet> sheets = new ArrayList<Sheet>();
        for (int i = 0; i < numberOfSheets; i++) {
            sheets.add(book.getSheetAt(i));
        }
        return sheets;
    }

    //3.对所有工作表进行操作
    private static void SheetIterator(List<Sheet> sheets) {
        /*
        for (int i = 0; i < sheets.size(); i++) {    //循环每一张工作表
            Sheet sheet = sheets.get(i);
            if (sheet.getLastRowNum() > 1) {    //判断是否为空表，获取有数据的最后一行的行数。如果为零则为空表
                System.out.println(sheet.getSheetName() + "=============");     //打印不为空的工作表名字
            }
            Iterator<Row> iterator = sheet.iterator();   //迭代器
            //用两个while循环遍历所有单元格
            while (iterator.hasNext()) {           //遍历每一行
                Row nextRow = iterator.next();
                if (nextRow.getRowNum() < 1) {
                    continue;
                    //nextRow.getRowNum()就是获取行数，由表中看出第一行(getRowNum()=0)为表头，直接跳过
                }

                //从第二行开始是有用的数据，要保存早数据库，第二行：nextRow.getRowNum()=1
                Iterator<Cell> cellIterator = nextRow.cellIterator();

                //设置实体类
                Course course = new Course();
                while (cellIterator.hasNext()) {         //遍历每一行的每一列
                    Cell cell = cellIterator.next();
                    switch(cell.getColumnIndex()){
                        case 0:
                            //将单元格内容设置为String类型，也可以这样写cell.setCellType(Cell.CELL_TYPE_STRING);
                            cell.setCellType(1);
                            course.setId(Integer.parseInt(cell.getStringCellValue()));
                            break;
                        case 1:   //第二列（系）
                            cell.setCellType(1);
                            course.setDept(cell.getStringCellValue());
                            break;
                        case 2:   //第三列（课程）
                            cell.setCellType(1);
                            course.setCourse(cell.getStringCellValue());
                            break;
                        case 3:
                            cell.setCellType(1);
                            course.setCredit(Double.parseDouble(cell.getStringCellValue()));
                            break;

                        case 4:
                            cell.setCellType(1);
                            course.setBook_num(cell.getStringCellValue());
                            break;
                        case 5:   //第六列是日期，需要进行特殊处理
                            //将单元格内容设置为number类型，也可以这样写cell.setCellType(Cell.CELL_TYPE_NUMERIC);
                            cell.setCellType(0);
                            SimpleDateFormat ftm = new SimpleDateFormat("yyyy-MM-dd");
                            double value = cell.getNumericCellValue();
                            Date date = org.apache.poi.ss.usermodel.DateUtil.getJavaDate(value);
                            if (HSSFDateUtil.isCellDateFormatted(cell)) {
                                course.setPublish_date(ftm.format(date));
                                //如果这里打印的话，还是会打印出数字，但是保存到数据库会变成日期格式
                            }
                            break;
                        case 6:
                            cell.setCellType(1);
                            course.setBook_name(cell.getStringCellValue());
                            break;
                    }
                    System.out.print("   ");
                }

                try {
                    //到这里已经遍历完一行Execl的所有单元格，并存储到model里面了，现在调用方法保存到数据库
                    CourseImp c = new CourseImp();
                    if(c.Exist(course.getId())==true){
                        System.out.println("此id对象已存在于数据库,不可重复添加");
                        continue;
                    }else{
                        c.save(course);
                    }

                } catch (Exception e) {
                    e.printStackTrace();
                }

                System.out.println("   ");
            }
            System.out.println("   ");
        }
        */
    }

}
