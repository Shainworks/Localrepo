7. write a script to count number of items present on a desktop.
import java.io.File;
public class DesktopItemCounter {
 public static void main(String[] args) {
 // Get user's home directory
 String desktopPath = System.getProperty("user.home") + "\\Desktop";
 // Desktop path (works for most systems)
 File desktopFolder = new File(desktopPath);
 if (desktopFolder.exists() && desktopFolder.isDirectory()) {
 File[] items = desktopFolder.listFiles();
 if (items != null) {
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
6.. Write a script to login a specific web page.
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
public class Webpage {
 public static void main(String[] args) {
 // Launch browser
 WebDriver driver = new ChromeDriver();
 // Open login page
 driver.get("https://the-internet.herokuapp.com/login");
 // Maximize window
 driver.manage().window().maximize();
 // Locate username field and enter value
 WebElement username = driver.findElement(By.id("username"));
 username.sendKeys("tomsmith");
 // Locate password field and enter value
 WebElement password = driver.findElement(By.id("password"));
 password.sendKeys("SuperSecretPassword!");
 // Click login button
 WebElement loginBtn = driver.findElement(By.id("submit"));
 loginBtn.click();
 // Optional: wait and verify login
 try {
 Thread.sleep(3000);
 } catch (InterruptedException e) {
 e.printStackTrace();
 }
 // Close browser
 driver.quit();
 }
}
8. Write a script to provide total number of objects present / available on the web page.
package webpage;
import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import java.util.List;
public class Objects {
 public static void main(String[] args) {
 // Initialize WebDriver
 WebDriver driver = new ChromeDriver();
 try {
 // Open webpage
 driver.get("https://example.com");
 // Maximize window
 driver.manage().window().maximize();
 // Wait for page to load (10 seconds)
 Thread.sleep(10000);
 // Get all elements
 List<WebElement> allElements = driver.findElements(By.xpath("//*"));
 // Print total count
 System.out.println("Total number of objects on the page: " + 
allElements.size());
 // Print each tag name
 for (WebElement element : allElements) {
 System.out.println("- <" + element.getTagName() + ">");
 }
 } catch (InterruptedException e) {
 System.out.println("Thread interrupted: " + e.getMessage());
 } 
 catch (Exception e) {
 e.printStackTrace();
 } finally {
 // Close browser
 driver.quit();
 }
 }
}
4. import org.openqa.selenium.By;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.support.ui.Select;
import java.util.List;
public class Combobox {
 public static void main(String[] args) {
 WebDriver driver = new ChromeDriver();
 try {
 driver.get("file:///C:/Users/user/Desktop/combo1.html");
 driver.manage().window().maximize();
 Thread.sleep(5000);
 WebElement dropdown =
 driver.findElement(By.id("MyDropdown"));
 Select select = new Select(dropdown);
 List<WebElement> options =
 select.getOptions();
 System.out.println(
 "Number of options in combo box is: "
 + options.size());
 for (WebElement option : options) {
 System.out.println(option.getText());
 }
 } catch (Exception e) {
e.printStackTrace();
 } finally {
 driver.quit();
 }}}
Html file
<!DOCTYPE html>
<html>
<head>
 <title>Combo Box Test</title>
</head>
<body>
 <h2>Select your option:</h2>
 <select id="MyDropdown">
 <option value="1">Option One</option>
 <option value="2">Option Two</option>
 <option value="3">Option Three</option>
 </select>
</body>
</html>