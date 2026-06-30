6) import org.openqa.selenium.By; 
import org.openqa.selenium.WebDriver; 
import org.openqa.selenium.chrome.ChromeDriver; 
public class LoginPage { 
public static void main(String[] args) throws Exception { 
WebDriver driver = new ChromeDriver();      
driver.get("https://the-internet.herokuapp.com/login");       
driver.findElement(By.id("username")).sendKeys("tomsmith"); 
driver.findElement(By.id("password")) .sendKeys("SuperSecretPassword!"); 
driver.findElement(By.id("submit")).click(); 
Thread.sleep(3000); 
driver.quit(); 
} 
} 
7)import java.io.File; 
public class DesktopItemCounter { 
public static void main(String[] args) { 
String desktopPath = System.getProperty("user.home") + "\\Desktop"; 
File desktopFolder = new File(desktopPath); 
if (desktopFolder.exists() && desktopFolder.isDirectory()) { 
File[] items = desktopFolder.listFiles(); 
if (items! null) { 
System.out.println("Number of items on Desktop: " + items.length); 
for(File item:items) 
{ 
System.out.println("-" + item.getName()); 
} 
} 
else 
{ 
System.out.println("could not read contents of Desktop"); 
} 
} else 
{ 
System.out.println("Desktop folder not found at :" + desktopPath); 
} 
} 
} 
9)import org.openqa.selenium.By; 
import org.openqa.selenium.WebDriver; 
import org.openqa.selenium.WebElement; 
import org.openqa.selenium.chrome.ChromeDriver; 
 
import java.util.List; 
 
public class Objects { 
    public static void main(String[] args) { 
        WebDriver driver = new ChromeDriver(); 
        driver.get("https://example.com"); 
        List<WebElement> elements = driver.findElements(By.xpath("//*")); 
 
       System.out.println("Total number of objects on the page: " + elements.size()); 
 
        for (WebElement e : elements) { 
            System.out.println(e.getTagName()); 
        } 
 
        driver.quit(); 
    } 
} 
 
 
 
10)import org.openqa.selenium.By; 
import org.openqa.selenium.WebDriver; 
import org.openqa.selenium.WebElement; 
import org.openqa.selenium.chrome.ChromeDriver; 
import java.util.List; 
 
public class Combobox { 
    public static void main(String[] args) { 
        WebDriver driver = new ChromeDriver(); 
 
 driver.get("file:///C:/Users/DELL/Documents/combo1.html"); 
 
     List<WebElement> options =              driver.findElements(By.xpath("//select/option")); 
 System.out.println("Number of options in combo box is: "+ options.size()); 
  for (WebElement option : options) { 
            System.out.println(option.getText()); 
        } 
 driver.quit(); 
    } 
} 
<!DOCTYPE html> 
<html> 
<head> 
<title>Combo Box Test</title> 
</head> 
<body> 
<h2>Select your option:</h2> 
<select> 
<option>Option One</option> 
<option>Option Two</option> 
<option>Option Three</option> 
</select> 
</body> 
</html> 
8.import java.io.FileInputStream;
import java.io.FileOutputStream;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class UpdateExcel {

    public static void main(String[] args) {

        try {
            // Excel file path
            String filePath = "D:\\students.xlsx";

            FileInputStream fis = new FileInputStream(filePath);
            XSSFWorkbook workbook = new XSSFWorkbook(fis);
            XSSFSheet sheet = workbook.getSheetAt(0);

            // Student records
            Object[][] data = {
                    {101, "Amit", "CSE", 85},
                    {102, "Riya", "ECE", 90},
                    {103, "Kiran", "ME", 78},
                    {104, "Sneha", "EEE", 88},
                    {105, "Rahul", "Civil", 82},
                    {106, "Pooja", "ISE", 91}
            };

            // Update records
            for (int i = 0; i < data.length; i++) {

                Row row = sheet.getRow(i + 1);

                if (row == null) {
                    row = sheet.createRow(i + 1);
                }

                row.createCell(0).setCellValue((Integer) data[i][0]);
                row.createCell(1).setCellValue((String) data[i][1]);
                row.createCell(2).setCellValue((String) data[i][2]);
                row.createCell(3).setCellValue((Integer) data[i][3]);
            }

            fis.close();

            FileOutputStream fos = new FileOutputStream(filePath);
            workbook.write(fos);

            fos.close();
            workbook.close();

            System.out.println("6 Student records updated successfully.");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
1 and 3.
#include <stdio.h>

int main() {
    int locks, stocks, barrels;
    int totalLocks = 0, totalStocks = 0, totalBarrels = 0;
    float sales, com;

    while (1) {
        printf("Enter number of locks (-1 to exit): ");
        scanf("%d", &locks);

        if (locks == -1)
            break;

        printf("Enter number of stocks and barrels: ");
        scanf("%d%d", &stocks, &barrels);

        if (locks > 0 && locks <= 70 && totalLocks + locks <= 70)
            totalLocks += locks;
        else
            printf("Invalid locks input.\n");

        if (stocks > 0 && stocks <= 80 && totalStocks + stocks <= 80)
            totalStocks += stocks;
        else
            printf("Invalid stocks input.\n");

        if (barrels > 0 && barrels <= 90 && totalBarrels + barrels <= 90)
            totalBarrels += barrels;
        else
            printf("Invalid barrels input.\n");

        printf("\nTotals: Locks=%d Stocks=%d Barrels=%d\n\n",
               totalLocks, totalStocks, totalBarrels);
    }

    sales = totalLocks * 45.0 + totalStocks * 30.0 + totalBarrels * 25.0;

    if (sales > 1800)
        com = 100 + 120 + 0.20 * (sales - 1800);
    else if (sales > 1000)
        com = 100 + 0.15 * (sales - 1000);
    else
        com = 0.10 * sales;

    printf("\nTotal Sales = %.2f", sales);
    printf("\nCommission = %.2f\n", com);

    return 0;
}
