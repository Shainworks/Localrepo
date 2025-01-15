## Sorting Java
```java
import java.util.Arrays;

class Sort {
    // Generic method to arrange (sort) the array
    public <T extends Comparable<T>> void Arrange(T[] array) {
        Arrays.sort(array);
    }

    // Generic method to display the array
    public <T> void Display(T[] array) {
        for (T element : array) {
            System.out.print(element + " ");
        }
        System.out.println();
    }
}

public class GenericSortExample {
    public static void main(String[] args) {
        Sort sorter = new Sort();
        
        // Integer array
        Integer[] intArray = {5, 3, 8, 1, 9};
        System.out.println("Original Integer Array: ");
        sorter.Display(intArray);
        sorter.Arrange(intArray);
        System.out.println("Sorted Integer Array: ");
        sorter.Display(intArray);
        
        // String array
        String[] strArray = {"Banana", "Apple", "Cherry", "Date"};
        System.out.println("\nOriginal String Array: ");
        sorter.Display(strArray);
        sorter.Arrange(strArray);
        System.out.println("Sorted String Array: ");
        sorter.Display(strArray);
        
        // Double array
        Double[] doubleArray = {2.5, 3.7, 1.2, 4.8, 0.9};
        System.out.println("\nOriginal Double Array: ");
        sorter.Display(doubleArray);
        sorter.Arrange(doubleArray);
        System.out.println("Sorted Double Array: ");
        sorter.Display(doubleArray);
    }
}
```
## MultiThread Java
```Java
import java.util.Random;

class GenerateNumber implements Runnable {
    public void run() {
        Random random = new Random();
        while (true) {
            int number = random.nextInt(100);
            System.out.println("Generated Number: " + number);

            if (number % 2 == 0) {
                new Thread(new SquareNumber(number)).start();
            } else {
                new Thread(new CubeNumber(number)).start();
            }

            try {
                Thread.sleep(1000); // Sleep for 1 second
            } catch (InterruptedException e) {
                System.out.println(e);
            }
        }
    }
}

class SquareNumber implements Runnable {
    private int number;

    SquareNumber(int number) {
        this.number = number;
    }

    public void run() {
        System.out.println("Square of " + number + " is " + (number * number));
    }
}

class CubeNumber implements Runnable {
    private int number;

    CubeNumber(int number) {
        this.number = number;
    }

    public void run() {
        System.out.println("Cube of " + number + " is " + (number * number * number));
    }
}

public class MultiThreadedApp {
    public static void main(String[] args) {
        Thread generateThread = new Thread(new GenerateNumber());
        generateThread.start();
    }
}
```
## Exception handling Java
```Java
import java.util.Scanner;

public class ExceptionHandling {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        
        System.out.println("Choose an exception to handle:");
        System.out.println("1. ArithmeticException");
        System.out.println("2. ArrayIndexOutOfBoundsException");
        System.out.println("3. NumberFormatException");
        System.out.println("4. StringIndexOutOfBoundsException");
        System.out.println("5. NullPointerException");
        
        int choice = scanner.nextInt();
        
        switch(choice) {
            case 1:
                try {
                    System.out.println("Enter numerator and denominator:");
                    int numerator = scanner.nextInt();
                    int denominator = scanner.nextInt();
                    int result = numerator / denominator;
                    System.out.println("Result: " + result);
                } catch (ArithmeticException e) {
                    System.out.println("Error: Division by zero is not allowed.");
                }
                break;
                
            case 2:
                try {
                    int[] array = {1, 2, 3};
                    System.out.println("Enter index:");
                    int index = scanner.nextInt();
                    System.out.println("Element at index " + index + ": " + array[index]);
                } catch (ArrayIndexOutOfBoundsException e) {
                    System.out.println("Error: Array index is out of bounds.");
                }
                break;
                
            case 3:
                try {
                    System.out.println("Enter a number:");
                    String input = scanner.next();
                    int number = Integer.parseInt(input);
                    System.out.println("Number: " + number);
                } catch (NumberFormatException e) {
                    System.out.println("Error: Invalid number format.");
                }
                break;
                
            case 4:
                try {
                    System.out.println("Enter a string:");
                    String str = scanner.next();
                    System.out.println("Enter index:");
                    int index = scanner.nextInt();
                    char ch = str.charAt(index);
                    System.out.println("Character at index " + index + ": " + ch);
                } catch (StringIndexOutOfBoundsException e) {
                    System.out.println("Error: String index is out of bounds.");
                }
                break;
                
            case 5:
                try {
                    String str = null;
                    System.out.println("Length of the string: " + str.length());
                } catch (NullPointerException e) {
                    System.out.println("Error: Null pointer exception.");
                }
                break;
                
            default:
                System.out.println("Invalid choice.");
        }
        
        scanner.close();
    }
}
```
## 7th labset Java
```java
import java.util.Scanner;

class circle {
    double radius;
    String color;

    circle() {
        radius = 1.0;
        color = "blue";
    }

    circle(double radius) {
        this.radius = radius;
        color = "blue";
    }

    circle(double radius, String color) {
        this.radius = radius;
        this.color = color;
    }

    double getarea() {
        return Math.PI * radius * radius;
    }

    double getradius() {
        return radius;
    }

    String getcolor() {
        return color;
    }
}

class cylinder extends circle {
    double height;

    double getheight() {
        return height;
    }

    cylinder() {
        super();
        height = 2.0;
    }

    cylinder(double height) {
        super();
        this.height = height;
    }

    cylinder(double height, double radius) {
        super(radius);
        this.height = height;
    }

    cylinder(double height, double radius, String color) {
        super(radius, color);
        this.height = height;
    }

    double getarea() {
        return (2 * Math.PI * radius * height) + (2 * Math.PI * radius * radius);
    }

    double getvolume() {
        return super.getarea() * height;
    }

    void display() {
        System.out.println("Radius is " + super.radius + ", Height is " + height + ", Color is " + super.color + ", Area is " + getarea() + ", Volume is " + getvolume());
    }

    void check(cylinder c1, cylinder c2, int i, int j) {
        if (c1.radius == c2.radius && c1.height == c2.height && c1.color.equalsIgnoreCase(c2.color)) {
            System.out.println("The cylinders " + (i + 1) + " and " + (j + 1) + " are similar");
        }
    }
}

public class Main {
    public static void main(String[] args) {
        Scanner s = new Scanner(System.in);
        cylinder[] c = new cylinder[4];

        c[0] = new cylinder();
        c[1] = new cylinder(3.0);
        c[2] = new cylinder(3.0, 4.0);
        c[3] = new cylinder(3.0, 4.0, "Green");

        System.out.println("Enter the details of cylinder 4 (height, radius, and color):");
        double h = s.nextDouble();
        double r = s.nextDouble();
        String str = s.next();

        c[3] = new cylinder(h, r, str);

        for (int i = 0; i < 4; i++) {
            System.out.print("The dimensions of cylinder " + (i + 1) + " is ");
            c[i].display();
        }

        for (int i = 0; i < 4; i++) {
            for (int j = i + 1; j < 4; j++) {
                c[i].check(c[i], c[j], i, j);
            }
        }
    }
}
```
## 8th labset java
```java
// Main class to test the interface and account implementations
class TestAccountInterface {
    public static void main(String[] args) {
        // Test with HDFC Account
        IAccount account = new HDFCAccount();
        System.out.println("Transacting using HDFC Account");
        transactOnAccount(account);
        System.out.println();

        // Test with State Bank Account
        account = new StateBankAccount();
        System.out.println("Transacting using State Bank Account");
        transactOnAccount(account);
    }

    // Method to perform transactions on an account
    public static void transactOnAccount(IAccount account) {
        System.out.println();
        account.deposit(1000.0);
        printBalance("depositing 1,000.0", account);
        account.withdraw(2500.0);
        printBalance("withdrawing 2,500.0", account);
        account.deposit(4100.0);
        printBalance("depositing 4,100.0", account);
        account.withdraw(5000.0);
        printBalance("withdrawing 5,000.0", account);
        System.out.println();
    }

    // Method to print the account balance
    public static void printBalance(String message, IAccount account) {
        System.out.println("The balance after " + message + " is " + account.getBalance() + ".");
    }
}

// Account interface with basic operations
interface IAccount {
    double getBalance();

    void deposit(double amount);

    void withdraw(double amount);
}

// Implementation of the HDFC account
class HDFCAccount implements IAccount {
    private double totalDeposits;
    private double totalWithdrawals;

    @Override
    public double getBalance() {
        return totalDeposits - totalWithdrawals;
    }

    @Override
    public void deposit(double amount) {
        if (amount > 0) {
            totalDeposits += amount;
        } else {
            System.out.println("Invalid deposit amount. Please enter a positive value.");
        }
    }

    @Override
    public void withdraw(double amount) {
        if (amount > 0) {
            totalWithdrawals += amount;
        } else {
            System.out.println("Invalid withdrawal amount. Please enter a positive value.");
        }
    }
}

// Implementation of the State Bank account
class StateBankAccount implements IAccount {
    private double balance;

    @Override
    public double getBalance() {
        return balance;
    }

    @Override
    public void deposit(double amount) {
        if (amount > 0) {
            balance += amount;
        } else {
            System.out.println("Invalid deposit amount. Please enter a positive value.");
        }
    }

    @Override
    public void withdraw(double amount) {
        if (amount > 0) {
            balance -= amount;
        } else {
            System.out.println("Invalid withdrawal amount. Please enter a positive value.");
        }
    }
}
```
## 9th labset java package program
```java
cie package> student class>
// File: CIE/Student.java
package CIE;

public class Student {
    public String usn;
    public String name;
    public int sem;
}

cie>internals class>// File: CIE/Internals.java
package CIE;

public class Internals extends Student {
    public int[] internalMarks = new int[6];

    public Internals(String usn, String name, int sem, int[] internalMarks) {
        this.usn = usn;
        this.name = name;
        this.sem = sem;
        this.internalMarks = internalMarks;
    }
}


see packaage>external class > // File: SEE/External.java
package SEE;

import CIE.Student;

public class External extends Student {
    public int[] seeMarks = new int[6];

    public External(String usn, String name, int sem, int[] seeMarks) {
        this.usn = usn;
        this.name = name;
        this.sem = sem;
        this.seeMarks = seeMarks;
    }
}


main.java>
// File: Main.java
import CIE.Internals;
import SEE.External;

public class Main {
    public static void main(String[] args) {
        int N = 5; // Example number of students
        Internals[] internalStudents = new Internals[N];
        External[] externalStudents = new External[N];
        
        // Example data
        for (int i = 0; i < N; i++) {
            internalStudents[i] = new Internals("USN" + (i + 1), "Student" + (i + 1), 3, new int[]{80, 85, 75, 90, 88, 92});
            externalStudents[i] = new External("USN" + (i + 1), "Student" + (i + 1), 3, new int[]{70, 75, 65, 80, 78, 82});
        }
        
        for (int i = 0; i < N; i++) {
            System.out.println("Student: " + internalStudents[i].name);
            System.out.println("USN: " + internalStudents[i].usn);
            System.out.println("Semester: " + internalStudents[i].sem);
            
            int totalMarks = 0;
            for (int j = 0; j < 6; j++) {
                int finalMarks = internalStudents[i].internalMarks[j] + externalStudents[i].seeMarks[j];
                totalMarks += finalMarks;
                System.out.println("Course " + (j + 1) + " Final Marks: " + finalMarks);
            }
            System.out.println("Total Marks: " + totalMarks + "\n");
        }
    }
}
```
## ds lab
FIB
#include<stdio.h>
#include<conio.h>
int fib(int n)
{
  if(n==0)
    return 0;
  else if (n==1)
   return 1;
   else
     return (fib(n-1)+fib(n-2));
}
void main()
{
  int n,i=0,res;
  clrscr();
  printf("Enter a number of terms\n");
  scanf("%d",&n);
  printf("Fobonacci Series\n");
  for(i=0;i<n;i++)
  {
    res=fib(i);
    printf("%d\t",res);
  }
  getch();
}


GCD
#include<stdio.h>
#include<conio.h>
int gcd(int m,int n)
{
  int rem;
  rem=m%n;
  if(rem==0) return n;
  else
     return (gcd(n,rem));
}
void main()
{
  int n,m,res;
  clrscr();
  printf("Enter Two number\n");
  scanf("%d%d",&m,&n);
  res=gcd(m,n);
  printf("GCD of %d and %d = %d\n",m,n,res);
  getch();
}

FACTORIAL
#include<stdio.h>
#include<conio.h>
int fact(int n)
{
  if(n==0) return 1;
  return n*fact(n-1);
}
void main()
{
  int n,fac;
  clrscr();
  printf("Enter a number\n");
  scanf("%d",&n);
  fac=fact(n);
  printf("Factoriali(%d) is %d\n",n,fac);
  getch();
}


TOWER OF HANOI
#include<stdio.h>
#include<conio.h>
//int count=0;
void tower(int n,char source,char dest,char spare)
{
   if(n==1)
   {
     printf("Move disc  from %c to %c\n",source,dest);
    // count++;
     return;
   }
  else
   {
      tower(n-1,source,spare,dest);
      tower(1,source,dest,spare);
      tower(n-1,spare,dest,source);
   }
}

void main()
{
  int  n;
  clrscr();
  printf("Enter the number of disc\n");
  scanf("%d",&n);
  tower(n,'A','C','B');
  //printf("Total number of disc moves=%d",count);
  getch();
}


8th one 
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define MAX 5
int queue[MAX];
int front=-1,rear=-1;
void insert_rear();
int delete_front();
void display();
int peek();
void main()
{
  int ch,item;
  clrscr();
  for(;;)
  {
  printf("Press 1 for Insert \n 2 for Delete \n 3 for display\n");
  printf("Press 4 for Peek\n");
  printf("Enter your choice\n");
  scanf("%d",&ch);
  switch(ch)
  {
     case 1: insert_rear();
	     break;
     case 2 : item=delete_front();
	     if(item!=-1)
	     printf("Item deleted=%d",item);
	     break;
     case 3 : display();
	      break;
     case 4:item=peek();
	    if(item!=-1)
	     printf("First Value in the Queue=%d",item);
	     break;
    default : exit(0);
  }
}
  getch();
}
void insert_rear()
{
   int num;
   printf("\n Enter the item to be Inserted");
   scanf("%d",&num);
   if(rear==MAX-1)
    printf("Queue is full\n");
   else if(front==-1 && rear==-1)
      front=rear=0;
   else
    rear++;
    queue[rear]=num;
}
int delete_front()
{
   int item_deleted;
   if(front==-1 || front >rear)
   {
      printf("QUEUE is empty\n");
      return -1;
   }
   else
   {
	item_deleted=queue[front];
	front++;
		if(front>rear)
		  {
		     front=rear=-1;
		  }
     return item_deleted;
   }
}
void display()
{
 int i;
   if(front==-1 || front >rear)
     printf("QUEUE is empty\n");
  else
  {
   printf("Content of the QUEUE is\n");
   for(i=front;i<=rear;i++)
     printf("%d\t",queue[i]);
  }
}
int peek()
{
   if(front==-1 || front >rear)
     printf("QUEUE is empty\n");
  else
  {
     return queue[front];
  }
}


6th one fixer
#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>
#define MAX 20
void InfixtoPostfix(char source[],char target[]);
int getpriority(char);
void push(char [],char);
char pop(char []);
char st[MAX];
int top=-1;
int main()
{
    char infix[20],postfix[20];
    clrscr();
    printf("\n Enter any infix expression");
    gets(infix);
    InfixtoPostfix(infix,postfix);
    printf("\n The Corresponding postfix expression is :");
    puts(postfix);
    getch();
    return 0;
}
void InfixtoPostfix(char source[],char target[])
{
   int i=0,j=0;
   char temp;
   strcpy(target," ");
   while(source[i] !='\0')
   {
      if(source[i]=='(')
       {
	  push(st,source[i]);
	  i++;
       }
       else if(source[i] ==')')
	 {
	    while((top !=-1) && (st[top] !='('))
	      {
		 target[j]=pop(st);
		 j++;
	       }
	       if(top==-1)
	       {
		 printf("\n Incorrect Expression");
		 exit(1);
	       }
	       temp=pop(st);
	       i++;
	 }
	 else if(isdigit(source[i]) || isalpha(source[i]))
	   {
	      target[j]=source[i];
	      j++;
	      i++;
	    }
	 else if(source[i] =='+' || source[i]=='-' || source[i]=='*' || source[i]=='/'|| source[i]=='%')
	    {
	       while((top !=-1) && (st[top]!='(') && getpriority(st[top]) >= getpriority(source[i]))
		 {
		    target[j]=pop(st);
		    j++;
		  }
		  push(st,source[i]);
		  i++;
	    }
	    else
	    {
	      printf("\n Incorrect Expression");
		 exit(1);
	     }
      }
      while((top !=-1) && (st[top] !='('))
      {
	target[j]=pop(st);
	j++;
      }
      target[j]='\0';
}
int getpriority(char op)
{
    if(op=='/' || op=='*' || op=='%')
      return 1;
    else if(op=='+' || op=='-')
       return 0;
}
void push(char st[],char val)
{
   if(top==MAX-1)
      printf("\n Stack Overflow");
   else
    {
      top++;
      st[top]=val;
     }
}
char pop(char st[])
{
   char val=' ';
   if(top==-1)
     printf("\n Stak Underflow");
   else
     {
       val=st[top];
       top--;
      }
    return val;
}
## Java lab 6
```java
import java.util.*;

class Account {
    public String acc_name;
    public double acc_no;
    public int acc_type;
    public double balance;

    public void getdata(String name, double no, int type, double bal) {
        acc_name = name;
        acc_no = no;
        acc_type = type;
        balance = bal;
    }
}

class Savings extends Account {
    public void deposit(double amt) {
        balance = balance + amt;
        System.out.println(balance);
    }

    public void withdraw(double amt) {
        balance = balance - amt;
        System.out.println(balance);
    }

    public void interest(int time, int no) {
        double intr = balance * (1 + 6.0 / 100);
        intr = Math.pow(intr, (time * no));
        System.out.println("Interest calculated is: " + intr);
        balance = balance + intr;
        System.out.println("The new balance is: " + balance);
    }
}

class Current extends Account {
    public void deposit(double amt) {
        balance = balance + amt;
        System.out.println(balance);
    }

    public void withdraw(double amt) {
        balance = balance - amt;
        System.out.println(balance);
        check(balance);
    }

    public void check(double amt) {
        if (amt < 10000) {
            balance = balance - 500;
            System.out.println("Insufficient Balance, penalty applied. New balance: " + balance);
        }
    }
}

public class Main {
    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        int temp = 1;
        while (temp == 1) {
            System.out.println("Enter name: ");
            String name = sc.nextLine();
            System.out.println("Enter acc_no: ");
            double no = sc.nextDouble();
            System.out.println("Enter acc type (0 for Savings, 1 for Current): ");
            int type = sc.nextInt();
            double amt = 0;
            do {
                System.out.println("Enter balance: ");
                amt = sc.nextDouble();
            } while (type == 1 && amt < 10000);

            if (type == 0) {
                Savings s = new Savings();
                s.getdata(name, no, type, amt);

                System.out.println("\n1. Deposit\n2. Withdraw\n3. Interest");
                int temp3 = sc.nextInt();

                if (temp3 == 1) {
                    System.out.println("Enter Amount: ");
                    double amt1 = sc.nextDouble();
                    s.deposit(amt1);
                } else if (temp3 == 2) {
                    System.out.println("Enter Amount: ");
                    double amt1 = sc.nextDouble();
                    s.withdraw(amt1);
                } else if (temp3 == 3) {
                    System.out.println("Enter time period: ");
                    int tp = sc.nextInt();
                    System.out.println("Enter number of times: ");
                    int nof = sc.nextInt();
                    s.interest(tp, nof);
                }
            } else if (type == 1) {
                Current c = new Current();
                c.getdata(name, no, type, amt);

                System.out.println("\n1. Deposit\n2. Withdraw");
                int temp3 = sc.nextInt();

                if (temp3 == 1) {
                    System.out.println("Enter Amount: ");
                    double amt1 = sc.nextDouble();
                    c.deposit(amt1);
                } else if (temp3 == 2) {
                    System.out.println("Enter Amount: ");
                    double amt1 = sc.nextDouble();
                    c.withdraw(amt1);
                }
            }

            System.out.println("To continue enter 1, else 0");
            temp = sc.nextInt();
        }
        sc.close();
    }
}
```
## java lab 1
```java
import java.util.Scanner;

public class SeriesSum {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the value of n: ");
        int n = sc.nextInt();
        double sum = 0.0;

        for (int i = 1; i <= n; i++) {
            sum += 1.0 / (i * i);
        }

        System.out.println("The sum of the series is: " + sum);
    }
}
```
## java lab 2
```java
public class PascalsTriangle {
    public static void main(String[] args) {
        int rows = 5;

        for (int i = 0; i < rows; i++) {
            // Print spaces for alignment
            for (int j = 0; j < rows - i; j++) {
                System.out.print(" ");
            }

            int number = 1;
            for (int j = 0; j <= i; j++) {
                System.out.print(number + " ");
                number = number * (i - j) / (j + 1); // Compute the next number
            }
            System.out.println();
        }
    }
}
```
## java lab 4
```java
class Complex {
    private double real;
    private double imaginary;

    // Parameterized Constructor
    public Complex(double real, double imaginary) {
        this.real = real;
        this.imaginary = imaginary;
    }

    // Method to add two complex numbers
    public Complex add(Complex other) {
        double newReal = this.real + other.real;
        double newImaginary = this.imaginary + other.imaginary;
        return new Complex(newReal, newImaginary);
    }

    // Method to subtract two complex numbers
    public Complex subtract(Complex other) {
        double newReal = this.real - other.real;
        double newImaginary = this.imaginary - other.imaginary;
        return new Complex(newReal, newImaginary);
    }

    // Method to display the complex number
    public void display() {
        System.out.println(this.real + " + " + this.imaginary + "i");
    }
}

public class ComplexNumberDemo {
    public static void main(String[] args) {
        // Create two complex numbers using the parameterized constructor
        Complex c1 = new Complex(5.0, 3.0);
        Complex c2 = new Complex(2.0, 1.0);

        // Perform addition
        Complex sum = c1.add(c2);
        System.out.print("Sum: ");
        sum.display();

        // Perform subtraction
        Complex difference = c1.subtract(c2);
        System.out.print("Difference: ");
        difference.display();
    }
}
```
## java lab 3
```java
import java.util.Scanner;

public class NumberOrder {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.print("Enter the first number: ");
        int num1 = sc.nextInt();
        System.out.print("Enter the second number: ");
        int num2 = sc.nextInt();
        System.out.print("Enter the third number: ");
        int num3 = sc.nextInt();

        if (num1 < num2 && num2 < num3) {
            System.out.println("Increasing");
        } else if (num1 > num2 && num2 > num3) {
            System.out.println("Decreasing");
        } else {
            System.out.println("Neither increasing nor decreasing order");
        }
    }
}
```
## java lab 5
```java
class MyTime {
    private int hour;   // between 0 and 23
    private int minute; // between 0 and 59

    // Constructor
    public MyTime(int hour, int minute) {
        setTime(hour, minute);
    }

    // Method to set time with validation
    public void setTime(int hour, int minute) {
        if (hour >= 0 && hour < 24 && minute >= 0 && minute < 60) {
            this.hour = hour;
            this.minute = minute;
        } else {
            throw new IllegalArgumentException("Invalid time: hour must be 0-23 and minute must be 0-59.");
        }
    }

    // Getters
    public int getHour() {
        return hour;
    }

    public int getMinute() {
        return minute;
    }

    // Move to the next minute
    public MyTime nextMinute() {
        minute++;
        if (minute == 60) { // if minute reaches 60, reset to 0 and increment hour
            minute = 0;
            hour++;
            if (hour == 24) { // if hour reaches 24, reset to 0
                hour = 0;
            }
        }
        return this; // Return the updated instance
    }

    // Move to the next hour
    public MyTime nextHour() {
        hour++;
        if (hour == 24) { // if hour reaches 24, reset to 0
            hour = 0;
        }
        return this; // Return the updated instance
    }

    // Display time in HH:MM format
    @Override
    public String toString() {
        return String.format("%02d:%02d", hour, minute);
    }
}
public class TestMyTime {
    public static void main(String[] args) {
        // Create a MyTime instance
        MyTime time = new MyTime(23, 59);

        // Display the current time
        System.out.println("Initial time: " + time);

        // Test nextMinute()
        time.nextMinute();
        System.out.println("After nextMinute(): " + time);

        // Test nextHour()
        time.nextHour();
        System.out.println("After nextHour(): " + time);

        // Set a valid time
        time.setTime(12, 30);
        System.out.println("After setting time to 12:30: " + time);

        // Test getters
        System.out.println("Hour: " + time.getHour());
        System.out.println("Minute: " + time.getMinute());

        // Test invalid time (uncomment to see exception)
        // time.setTime(25, 61);
    }
}
```
## Ds lab 6
```c
#include<stdio.h>
#include<conio.h>
#include<string.h>
#include<ctype.h>
#include<stdlib.h>
#define MAX 20
void InfixtoPostfix(char source[],char target[]);
int getpriority(char);
void push(char [],char);
char pop(char []);
char st[MAX];
int top=-1;
int main()
{
    char infix[20],postfix[20];
    clrscr();
    printf("\n Enter any infix expression");
    gets(infix);
    InfixtoPostfix(infix,postfix);
    printf("\n The Corresponding postfix expression is :");
    puts(postfix);
    getch();
    return 0;
}
void InfixtoPostfix(char source[],char target[])
{
   int i=0,j=0;
   char temp;
   strcpy(target," ");
   while(source[i] !='\0')
   {
      if(source[i]=='(')
       {
	  push(st,source[i]);
	  i++;
       }
       else if(source[i] ==')')
	 {
	    while((top !=-1) && (st[top] !='('))
	      {
		 target[j]=pop(st);
		 j++;
	       }
	       if(top==-1)
	       {
		 printf("\n Incorrect Expression");
		 exit(1);
	       }
	       temp=pop(st);
	       i++;
	 }
	 else if(isdigit(source[i]) || isalpha(source[i]))
	   {
	      target[j]=source[i];
	      j++;
	      i++;
	    }
	 else if(source[i] =='+' || source[i]=='-' || source[i]=='*' || source[i]=='/'|| source[i]=='%')
	    {
	       while((top !=-1) && (st[top]!='(') && getpriority(st[top]) >= getpriority(source[i]))
		 {
		    target[j]=pop(st);
		    j++;
		  }
		  push(st,source[i]);
		  i++;
	    }
	    else
	    {
	      printf("\n Incorrect Expression");
		 exit(1);
	     }
      }
      while((top !=-1) && (st[top] !='('))
      {
	target[j]=pop(st);
	j++;
      }
      target[j]='\0';
}
int getpriority(char op)
{
    if(op=='/' || op=='*' || op=='%')
      return 1;
    else if(op=='+' || op=='-')
       return 0;
}
void push(char st[],char val)
{
   if(top==MAX-1)
      printf("\n Stack Overflow");
   else
    {
      top++;
      st[top]=val;
     }
}
char pop(char st[])
{
   char val=' ';
   if(top==-1)
     printf("\n Stak Underflow");
   else
     {
       val=st[top];
       top--;
      }
    return val;
}
```
## Ds Lab 8
```c
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define MAX 5
int queue[MAX];
int front=-1,rear=-1;
void insert_rear();
int delete_front();
void display();
int peek();
void main()
{
  int ch,item;
  clrscr();
  for(;;)                               
  {
  printf("Press 1 for Insert \n 2 for Delete \n 3 for display\n");
  printf("Press 4 for Peek\n");
  printf("Enter your choice\n");
  scanf("%d",&ch);
  switch(ch)
  {
     case 1: insert_rear();
	     break;
     case 2 : item=delete_front();
	     if(item!=-1)
	     printf("Item deleted=%d",item);
	     break;
     case 3 : display();
	      break;
     case 4:item=peek();
	    if(item!=-1)
	     printf("First Value in the Queue=%d",item);
	     break;
    default : exit(0);
  }
}
  getch();
}
void insert_rear()
{
   int num;
   printf("\n Enter the item to be Inserted");
   scanf("%d",&num);
   if(rear==MAX-1)
    printf("Queue is full\n");
   else if(front==-1 && rear==-1)
      front=rear=0;
   else
    rear++;
    queue[rear]=num;
}
int delete_front()
{
   int item_deleted;
   if(front==-1 || front >rear)
   {
      printf("QUEUE is empty\n");
      return -1;
   }
   else
   {
	item_deleted=queue[front];
	front++;
		if(front>rear)
		  {
		     front=rear=-1;
		  }
     return item_deleted;
   }
}
void display()
{
 int i;
   if(front==-1 || front >rear)
     printf("QUEUE is empty\n");
  else
  {
   printf("Content of the QUEUE is\n");
   for(i=front;i<=rear;i++)
     printf("%d\t",queue[i]);
  }
}
int peek()
{
   if(front==-1 || front >rear)
     printf("QUEUE is empty\n");
  else
  {
     return queue[front];
  }
}
```
## Ds lab 9
```c
#include < stdio.h > 
#include < stdlib.h >
#include<string.h>
struct node {
    int data;
    int priority;
    struct node * next;
};

struct node * start = NULL;
struct node *insert(struct node *start)
{
    int val,pri;
    struct node *ptr,*prev,*cur;
    ptr = (struct node * ) malloc(sizeof(struct node));
    printf("Enter the value and priority:\n");
    scanf("%d%d",&val,&pri);
    ptr->data=val;
    ptr ->priority = pri;
    if (start == NULL || pri < start->priority)
    {
	ptr->next=start;
	start=ptr;
    }
    else
    {
	prev=NULL;
	cur=start;
	while(cur  != NULL && pri >= cur->priority)
	{
	   prev=cur;
	   cur=cur->next;
	}
	prev->next=ptr;
	ptr->next=cur;
    }
    return start;
}

struct node *dequeue(struct node *start)
{
    struct node *ptr;

    if (start == NULL)
    {
	printf("\nUnderflow\n");
	exit(0);
    }
    else
    {
	ptr=start;
	printf("\n Deleted item is:%d",ptr->data);
	start=start->next;
	free(ptr);
    }
    return start;
}

void display(struct node *start)
{
    struct node *ptr;
    ptr=start;
    if (start == NULL)
    {
	printf("\nQueue is Empty\n");
    }
    else
    {
	printf("The queue is \n");
	while (ptr!=NULL)
	{
	    printf("\t%d[priority=%d]", ptr-> data,ptr->priority);
	    ptr = ptr -> next;
	}

    }
}

int main()
{
    int choice;
    printf("\nImplementation of Queue using Linked List\n");
    while (choice != 4)
    {
	printf("1.Enqueue\n2.Dequeue\n3.Display\n4.Exit\n");
	printf("\nEnter your choice : ");
	scanf("%d", & choice);
	switch (choice)
	{
	    case 1: start=insert(start);
		break;
	    case 2:
		    start=dequeue(start);
		break;
	    case 3:
		display(start);
		break;
	    case 4:
		exit(0);
		break;
	    default:
		printf("\nWrong Choice\n");
	}
    }
    return 0;
}
```
## Ds Lab 10
```c
#include<stdio.h>
#include<conio.h>
#include<malloc.h>
#include<process.h>
#include<string.h>
struct node
{
  int info;
  struct node *llink;
  struct node *rlink;
};
typedef struct node* NODE;

NODE insert(int,NODE);
NODE getnode();
NODE minimum(NODE);
void inorder(NODE);
void preorder(NODE);
void postorder(NODE);
void iterative_search(int,NODE);
NODE delete_item(int,NODE);
void main()
{
  int ch,item,flag,item_deleted;
  NODE root=NULL,min;
  clrscr();
  for(;;)
  {
      printf("Press 1 .INSERT \n 2. Inorder\n 3 preorder\n");
      printf("4.postorder\n5:Search\n6:Find minimum\n7.delete\n");
      printf("Enter your choice\n");
      scanf("%d",&ch);
      switch(ch)
      {
	case 1: printf("Enter the item to be inserted\n");
		scanf("%d",&item);
		root=insert(item,root);
		break;
	case 2: printf("Inorder tree traversal\n");
		inorder(root);
		break;
	case 3: printf("preorder tree traversal\n");
		preorder(root);
		break;
	case 4: printf("postorder tree traversal\n");
		postorder(root);
		break;

	case 5: if(root==NULL)
		 printf("Tree is empty\n");
		else
		 {
		   printf("Enter the item to be search\n");
		   scanf("%d",&item);
		   iterative_search(item,root);
		 }
		break;
	 case 6: min=minimum(root);
		 printf("smallest element =%d\n",min->info);
		 break;
	 case 7: printf("Enter the node to be deleted\n");
		scanf("%d",&item_deleted);
		root=delete_item(item,root);
		break;

/*       case 3: display(head);
	       break; */
       default: exit(0);
}//switch
}//for
getch();
}//main
NODE getnode()
{
  NODE x;
  x=(NODE)malloc(sizeof(struct node));
  if(x==NULL)
  {
    printf("Out of memeory\n");
    exit(0);
  }
  return x;
}
void freenode(NODE temp)
{
  free(temp);
}
NODE minimum(NODE root)
{
 NODE cur;
 if(root==NULL) return root;
 cur=root;
 while(cur->llink!=NULL)
   cur=cur->llink;
 return cur;
}
NODE insert(int item,NODE root)
{
   NODE temp,cur,prev;
   temp=getnode();
   temp->info=item;
   temp->llink=temp->rlink=NULL;
   if(root==NULL) return temp;
   prev=NULL;
   cur=root;
   while( cur !=NULL)
   {
     prev=cur;
     if(item <cur->info)
       cur=cur->llink;
     else
       cur=cur->rlink;
   }
   if(item< prev->info)
     prev->llink=temp;
   else
     prev->rlink=temp;
return root;
}
void inorder(NODE root)
{
  if(root !=NULL)
  {
    inorder(root->llink);
    printf("%d  ",root->info);
    inorder(root->rlink);
  }
}
void preorder(NODE root)
{
  if(root !=NULL)
  {
    printf("%d  ",root->info);
    preorder(root->llink);
    preorder(root->rlink);
  }
}
void postorder(NODE root)
{
  if(root !=NULL)
  {
    postorder(root->llink);
    postorder(root->rlink);
    printf("%d  ",root->info);
  }
}
void iterative_search(int item,NODE root)
{
 while(root !=NULL && item != root->info)
 {
   if(item< root->info)
     root=root->llink;
   else
     root=root->rlink;
 }
 if(item==root->info)
   printf("Succesfull search\n");
 else
   printf("Unsuccesful Search\n");
// return root;
}
NODE delete_item(int item,NODE root)
{
  NODE parent,cur,suc,psuc,ptr;
  if(root->llink==NULL)
  {
    printf("Tree is empty\n");
    return root;
  }
  parent=root;
  cur=root->llink;
  while(cur !=NULL && item !=cur->info)
  {
    parent=cur;
    if(item<cur->info)
      cur=cur->llink;
    else
      cur=cur->rlink;
  }
  if(cur==NULL)
  {
    printf("Item not found\n");
    return root;
  }
  if(cur->llink ==NULL)
    ptr=cur->rlink;
  else if(cur->rlink ==NULL)
    ptr=cur->llink;
  else
  {
    psuc=cur;
    cur=cur->llink;
    while(suc->llink!=NULL)
    {
      psuc=cur;
      suc=suc->llink;
    }
    if(cur==psuc)
    {
       suc->llink=cur->rlink;
    }
    else
    {
       suc->llink=cur->llink;
       psuc->llink=suc->rlink;
       suc->rlink=cur->rlink;
    }
   ptr=suc;
}
if(parent->llink==cur)
    parent->llink=ptr;
else
   parent->rlink=ptr;
freenode(cur);
   return root;
}
```
## Ds lab 7
```c
#include <stdio.h>

// Function for Tower of Hanoi
void towerOfHanoi(int n, char source, char destination, char auxiliary) {
    if (n == 1) {
        printf("Move disk 1 from %c to %c\n", source, destination);
        return;
    }
    towerOfHanoi(n - 1, source, auxiliary, destination);
    printf("Move disk %d from %c to %c\n", n, source, destination);
    towerOfHanoi(n - 1, auxiliary, destination, source);
}

// Function to find GCD of two numbers
int findGCD(int a, int b) {
    if (b == 0) {
        return a;
    }
    return findGCD(b, a % b);
}

// Function to find the largest of n numbers
int findLargest(int arr[], int n) {
    if (n == 1) {
        return arr[0];
    }
    int maxOfRest = findLargest(arr, n - 1);
    if (arr[n - 1] > maxOfRest) {
        return arr[n - 1];
    } else {
        return maxOfRest;
    }
}

int main() {
    int choice;
    printf("Select an operation:\n");
    printf("1. Tower of Hanoi\n");
    printf("2. GCD of two numbers\n");
    printf("3. Largest of 'n' numbers\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    switch (choice) {
        case 1: {
            int n;
            printf("Enter the number of disks: ");
            scanf("%d", &n);
            printf("Steps to solve Tower of Hanoi:\n");
            towerOfHanoi(n, 'A', 'C', 'B');
            break;
        }
        case 2: {
            int a, b;
            printf("Enter two numbers to find GCD: ");
            scanf("%d %d", &a, &b);
            int gcd = findGCD(a, b);
            printf("The GCD of %d and %d is: %d\n", a, b, gcd);
            break;
        }
        case 3: {
            int n;
            printf("Enter the number of elements: ");
            scanf("%d", &n);
            int arr[n];
            printf("Enter the elements:\n");
            for (int i = 0; i < n; i++) {
                scanf("%d", &arr[i]);
            }
            int largest = findLargest(arr, n);
            printf("The largest number is: %d\n", largest);
            break;
        }
        default:
            printf("Invalid choice! Please select 1, 2, or 3.\n");
    }

    return 0;
}
```


