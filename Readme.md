## Now this is my lab Cheat Code copy area
Enjoy guys all the lab programs are uploaded here......
## 2nd lab set
```c
#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<malloc.h>

struct node {
    int data;
    struct node *next;
};

struct node *start=NULL;
struct node *create_ll(struct node *);
struct node *display(struct node *);
struct node *insert_beg(struct node *);
struct node *insert_end(struct node *);
struct node *delete_node(struct node *);

int main() {
    int option;
    do {
        printf("\n\n ******** MAIN MENU*******");
        printf("\n 1: Create a list");
        printf("\n 2: Display the list");
        printf("\n 3: Insert beginning");
        printf("\n 4: Insert end");
        printf("\n 5: Delete A specified node");
        printf("\n\n Enter your option:");
        scanf("%d",&option);

        switch(option) {
            case 1: start=create_ll(start);
                    printf("\nLinked list created");
                    break;
            case 2: start=display(start);
                    break;
            case 3: start=insert_beg(start);
                    break;
            case 4: start=insert_end(start);
                    break;
            case 5: start=delete_node(start);
                    break;
        }
    } while(option!=6);

    getch();
    return 0;
}

struct node *create_ll(struct node *start) {
    struct node *new_node,*ptr;
    int num;
    printf("\n Enter -1 to end");
    printf("\n Enter the data:");
    scanf("%d",&num);
    while(num != -1) {
        new_node = (struct node*) malloc(sizeof(struct node));
        new_node->data = num;
        if(start == NULL) {
            new_node->next = NULL;
            start = new_node;
        } else {
            ptr = start;
            while(ptr->next != NULL)
                ptr = ptr->next;
            ptr->next = new_node;
            new_node->next = NULL;
        }
        printf("Enter the data :");
        scanf("%d",&num);
    }
    return start;
}

struct node *display(struct node *start) {
    struct node *ptr;
    ptr = start;
    if(ptr == NULL) {
        printf("\nList is empty");
        return 0;
    }
    while(ptr != NULL) {
        printf("\t %d", ptr->data);
        ptr = ptr->next;
    }
    return start;
}

struct node *insert_beg(struct node *start) {
    struct node *new_node;
    int num;
    printf("\n Enter the data");
    scanf("%d",&num);
    new_node = (struct node *)malloc(sizeof(struct node));
    new_node->data = num;
    new_node->next = start;
    start = new_node;
    return start;
}

struct node *insert_end(struct node *start) {
    struct node *ptr, *new_node;
    int num;
    printf("\n Enter the data");
    scanf("%d",&num);
    new_node = (struct node *)malloc(sizeof(struct node));
    new_node->data = num;
    new_node->next = NULL;
    ptr = start;
    while(ptr->next != NULL) {
        ptr = ptr->next;
    }
    ptr->next = new_node;
    return start;
}

struct node *delete_node(struct node *start) {
    struct node *ptr, *preptr;
    int val;
    printf("\n Enter the value of the node which has to be deleted:");
    scanf("%d",&val);
    ptr = start;
    if(ptr->data == val) {
        start = start->next;
        free(ptr);
        return start;
    } else {
        while(ptr->data != val) {
            preptr = ptr;
            ptr = ptr->next;
        }
        preptr->next = ptr->next;
        free(ptr);
        return start;
    }
}
```
## 3rd labset
```c
#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<malloc.h>
#include<string.h>
struct node
{
struct node *prev;
int book_id;
char book_title[10];
char author[20];
int edition;
struct node *next;
};
struct node *start=NULL;
struct node *create_ll(struct node *);
struct node *display(struct node *);
struct node *count_node(struct node *);
struct node *delete_pos(struct node *);
int main()
{
int option;
clrscr();
do
{
printf("\n\n ******** MAIN MENU*******");
printf("\n 1: Create a list");
printf("\n 2: Display the list");
printf("\n 3: Count nodes");
printf("\n 4: Delete postion");
printf("\n\n Enter your option:");
scanf("%d",&option);
switch(option)
{
case 1: start=create_ll(start);
printf("\nDoubly Linked list created");
break;
case 2: start=display(start);
break;
case 3: start=count_node(start);
break;
case 4: start=delete_pos(start);
break;
}
}while(option!=5);
getch();
return 0;
}
struct node *create_ll(struct node *start)
{
struct node *new_node,*ptr,*preptr;
int book_id,edition;
char book_title[10],author[20];
printf("\n EnterBokk id as -1 to end");
printf("\n Enter the Book Id:");
scanf("%d",&book_id);
printf("\n Enter the Book Title:");
scanf("%s",book_title);
printf("\n Enter the Author:");
scanf("%s",author);
printf("\n Enter the Book Edition:");
scanf("%d",&edition);
while(book_id!=-1)
{
new_node=(struct node*) malloc(sizeof(struct node));
new_node->prev=NULL;
new_node->book_id=book_id;
strcpy(new_node->book_title,book_title);
strcpy(new_node->author,author);
new_node->edition=edition;
new_node->next=NULL;
if(start==NULL)
{
start=new_node;
}
else
{
ptr=start;
preptr=NULL;
while(ptr!=NULL&& book_id> ptr->book_id)
{
preptr=ptr;
ptr=ptr->next;
}
preptr->next=new_node;
new_node->next=ptr;
}
printf("Enter the Bookid:");
scanf("%d",&book_id);
if(book_id==-1)
break;
printf("\n Enter the Book Title:");
scanf("%s",book_title);
printf("\n Enter the Author:");
scanf("%s",author);
printf("\n Enter the Book Edition:");
scanf("%d",&edition);
}
return start;
}
struct node *display(struct node *start)
{
struct node *ptr;
ptr=start;
if(ptr==NULL)
{
printf("\nList is empty");
return 0;
}
while(ptr !=NULL)
{
printf("\t %d",ptr->book_id);
printf("\t %s",ptr->book_title);
printf("\t %s",ptr->author);
printf("\t %d",ptr->edition);
ptr=ptr->next;
}
return start;
}
struct node *count_node(struct node *start)
{
struct node *ptr;
int count=0;
ptr=start;
while(ptr!=NULL)
{
ptr=ptr->next;
count++;
}
printf("\nTotal Numbers of node=%d",count);
return start;
}
struct node *delete_pos(struct node *start)
{
struct node *ptr,*preptr,*temp;
int i,pos;
printf("Enter the postion");
scanf("%d",&pos);
temp=start;
for(i=1;i<pos && temp !=NULL;i++)
{
preptr=temp;
temp=temp->next;
ptr=temp->next;
}
if(temp!=NULL)
{
preptr->next=ptr;
ptr->prev=preptr;
free(temp);
}
else
{
printf("\nEnter valid postion");
}
return start;
}
```
```java
## ae java wala hai
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
## ooa lowde ae 4th labset hai 
```c
#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<malloc.h>
#include<math.h>
struct node
{
   int num;
   int coeff;
   struct node *next;
};
struct node *start1=NULL;
struct node *start2=NULL;
struct node *start3=NULL;
struct node *start4=NULL;
struct node *create_poly(struct node *);
struct node *display_poly(struct node *);
struct node *add_poly(struct node *,struct node *,struct node *);
struct node *add_node(struct node *,int,int);
void evaluate(struct node *);
int main()
{
   int option;
   clrscr();
   do
   {
      printf("\n\n ******** MAIN MENU*******");
      printf("\n 1: Enter the First Polynomial");
      printf("\n 2: Display the First Polynomial");
      printf("\n 3: Enter the Second Polynomial ");
      printf("\n 4: Display the Second Polynomial");
      printf("\n 5: Add the polnomials");
      printf("\n 6:Display the Result");
      printf("\n\n Enter your option:");
      scanf("%d",&option);
      switch(option)
      {
	 case 1: start1=create_poly(start1);
		 break;
	 case 2: start1=display_poly(start1);
		 break;
	 case 3: start2=create_poly(start2);
		 break;
	 case 4: start2=display_poly(start2);
		 break;
	 case 5: start3=add_poly(start1,start2,start3);
		 break;
	 case 6: start3=display_poly(start3);
		 break;
	 }
   }while(option!=7);
   getch();
   return 0;
}
struct node *create_poly(struct node *start)
{
    struct node *new_node,*ptr;
    int n,c;
    printf("\n Enter the number:");
    scanf("%d",&n);
    printf("\t Enter its coefficient:");
    scanf("%d",&c);
    while(n !=-1)
    {

       if(start==NULL)
       {
	 new_node=(struct node*) malloc(sizeof(struct node));
	 new_node->num=n;
	 new_node->coeff=c;
	 new_node->next=NULL;
	 start=new_node;
       }
       else
       {
	  ptr=start;
	  while(ptr->next !=NULL)
	    ptr=ptr->next;
	    new_node=(struct node*) malloc(sizeof(struct node));
	    new_node->num=n;
	    new_node->coeff=c;
	    ptr->next=new_node;
	    new_node->next=NULL;
	}
	printf("Enter the number :");
	scanf("%d",&n);
	if(n==-1)
	 break;
	printf("\t Enter its Coefficient");
	scanf("%d",&c);
    }
    return start;
}
struct node *display_poly(struct node *start)
{
   struct node *ptr;
   ptr=start;
   while(ptr !=NULL)
   {
      printf("\n %d x %d\t",ptr->num,ptr->coeff);
      ptr=ptr->next;
   }
   return start;
}

struct node *add_poly(struct node *start1,struct node *start2,struct node *start3)
{
    struct node *ptr1,*ptr2;
    int sum_num,c;
    ptr1=start1,ptr2=start2;
    while(ptr1 !=NULL && ptr2 !=NULL)
    {
       if(ptr1->coeff ==ptr2->coeff)
	 {
	   sum_num=ptr1->num+ptr2->num;
	   start3=add_node(start3,sum_num,ptr1->coeff);
	   ptr1=ptr1->next;
	   ptr2=ptr2->next;
	  }
	else if (ptr1->coeff > ptr2->coeff)
	  {
	   start3=add_node(start3,ptr1->num,ptr1->coeff);
	   ptr1=ptr1->next;
	  }
	else if (ptr1->coeff < ptr2->coeff)
	{
	   start3=add_node(start3,ptr2->num,ptr2->coeff);
	   ptr2=ptr2->next;
	}
    }
    if(ptr1 ==NULL)
    {
       while(ptr2!=NULL)
	{
	 start3=add_node(start3,ptr2->num,ptr2->coeff);
	   ptr2=ptr2->next;
	}
    }
    if(ptr2 ==NULL)
    {
       while(ptr1!=NULL)
	{
	 start3=add_node(start3,ptr1->num,ptr1->coeff);
	   ptr1=ptr1->next;
	}
    }
    return start3;
}
struct node *add_node(struct node *start,int n,int c)
{
  struct node *ptr,*new_node;
  if(start==NULL)
       {
	 new_node=(struct node*) malloc(sizeof(struct node));
	 new_node->num=n;
	 new_node->coeff=c;
	 new_node->next=NULL;
	 start=new_node;
       }
       else
       {
	  ptr=start;
	  while(ptr->next !=NULL)
	    ptr=ptr->next;
	    new_node=(struct node*) malloc(sizeof(struct node));
	    new_node->num=n;
	    new_node->coeff=c;
	    ptr->next=new_node;
	    new_node->next=NULL;
	}
   return start;
}
```
## aur ae wala 5th hai maze kr
```c
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#define MAX 5
int s[MAX],top=-1;
void push(int s[],int val);
int pop(int s[]);
int peek(int s[]);
void display(int s[]);
int main()
{
   int val,option;
   do
   {
     printf("\n****** MAIN MENU********");
     printf("\n 1: PUSH");
     printf("\n 2: POP");
     printf("\n 3: PEEK");
     printf("\n 4: DISPLAY");
     printf("\n 5: EXIT");
     printf("\n Enter Your option :");
     scanf("%d",&option);
     switch(option)
     {
	case 1: printf("\n Enter the Number to be pushed on stack");
		scanf("%d",&val);
		push(s,val);
		break;
	case 2:
		val=pop(s);
		if(val !=-1)
		printf("\n The value deleted from stack is : %d",val);
		break;
	case 3:
		val=peek(s);
		if(val !=-1)
		printf("\n The value stored at top of stack is : %d",val);
		break;
	case 4: display(s);
		break;
      }
  }while(option != 5);
  return 0;
}
void push (int s[],int val)
{
  if(top==MAX-1)
  {
     printf("\n STACK OVERFLOW");
  }
  else
  {
    top++;
    s[top]=val;
  }
}
int pop(int s[])
{
   int val;
   if(top == -1)
   {
     printf("\n STACK UNDERFLOW");
     return -1;
   }
   else
   {
      val=s[top];
      top--;
      return val;
   }
}
int peek(int s[])
{

   if(top == -1)
   {
     printf("\n STACK UNDERFLOW");
     return -1;
   }
   else
      return (s[top]);
}
void display(int s[])
{
  int i;
  if(top == -1)
   {
     printf("\n STACK EMPTY");
   }
   else
   {
      for(i=top;i>=0;i--)
	printf("\n %d\n",s[i]);
   }
}
```
## ae pehla wala labset hai C ka
```c
#include <stdio.h>
#include <conio.h>
 typedef struct distance 
 { 
     int kms; 
     int metres; 
 }   DISTANCE; 
     DISTANCE add_distance (DISTANCE, DISTANCE); 
     DISTANCE subtract_distance(DISTANCE,DISTANCE); 
     DISTANCE dl, d2, d3, d4; 
 int main() 
 { 
       int option; 
       clrscr (); 
    do 
    { 
        printf("\n ***MAIN MENU***"); 
        printf ("\n 1. Read the distances "); 
        printf ("\n 2. Display the distances"); 
        printf ("\n 3. Add the distances "); 
        printf ("\n 4. Subtract the distances"); 
        printf ("\n 5. EXIT"); 
        printf ("\n Enter your option: "); 
        scanf("%d", &option); 
     switch(option) 
     { 
      case 1: 
             printf("\n Enter the first distance in kms and metres: "); 
             scanf ("%d %d", &dl .kms, &dl .metres); 
             printf("\n Enter the second distancekms and metres: "); 
             scanf ("%d %d" , &d2 .kms, &d2 .metres); 
       break; 
      case 2: 
             printf("\n The first distance is: %d kms %d metres " , dl.kms, dl.metres); 
             printf("\n The second distance is: %d kms %d metres " , d2 .kms, d2 .metres); 
       break; 
      case 3: 
             d3 = add_distance(dl, d2); 
             printf("\n The sum of two distances is: %d kms %d metres", d3.kms, d3.metres); 
       break; 
      case 4: 
             d4 = subtract_distance(dl, d2); 
             printf("\n The difference between two distances is: %d kms %d metres ", d4.kms, d4 .metres); 
       break; 
     } 
    } 
     while(option != 5); 
     { 
       getch (); 
       return 0; 
     } 
 } 
  DISTANCE add_distance(DISTANCE dl, DISTANCE d2) 
  { 
     DISTANCE sum; 
     sum.metres = dl.metres + d2. metres; 
     sum.kms = dl.kms + d2.kms; 
       if(sum.metres >= 1000) 
       { 
                         sum.metres = sum.metres%1000; 
                         sum.kms += 1; 
       } 
                    return sum; 
  } 
  DISTANCE subtract_distance(DISTANCE dl,DISTANCE d2) 
  { 
     DISTANCE sub; 
       if(dl.kms > d2.kms) 
       { 
                         sub.metres = dl.metres - d2. metres; 
                         sub.kms = dl.kms - d2.kms; 
       } 
        else 
        { 
                    sub.metres = d2.metres - dl. metres; 
                    sub.kms = d2.kms - dl.kms; 
        } 
      if(sub.metres < 0) 
      { 
                    sub.kms = sub.kms - 1; 
                    sub.metres = sub.metres + 1000; 
      } 
                   return sub; 
  }
```
## ae java 5th wala hai
```java
class MyTime {
 private int hour;
 private int minute;
 MyTime(int hour, int minute) {
 setTime(hour, minute);
 }
 public void setTime(int hour, int minute) {
 if (hour >= 0 && hour <= 23 && minute >= 0 && minute <= 59) {
 this.hour = hour;
 this.minute = minute;
 } else {
 System.out.println("Invalid time. Hour should be between 0 and 23, and minute between 0 and 59.");
 }
 }
 public int getHour() {
 return hour;
 }
 public int getMinute() {
 return minute;
 }
 public MyTime nextMinute() {
 minute++;
 if (minute >= 60) {
 minute = 0;
 hour = (hour + 1) % 24;
 }
 return this;
 }
 public MyTime nextHour() {
 hour = (hour + 1) % 24;
 return this;
 }
}
class TestMyTime {
public static void main(String[] args) {
 MyTime t = new MyTime(23, 59);
 System.out.println("Current Time: " + t.getHour() + ":" + t.getMinute());
 t.nextMinute();
 System.out.println("Next Minute: " + t.getHour() + ":" + t.getMinute());
 t.nextHour();
 System.out.println("Next Hour: " + t.getHour() + ":" + t.getMinute());
 }
}
```
## 4th lab c
```c
#include<stdio.h>
#include<stdlib.h>
#include<conio.h>
#include<malloc.h>
#include<math.h>
struct node
{
   int num;
   int coeff;
   struct node *next;
};
struct node *start1=NULL;
struct node *start2=NULL;
struct node *start3=NULL;
struct node *start4=NULL;
struct node *create_poly(struct node *);
struct node *display_poly(struct node *);
struct node *add_poly(struct node *,struct node *,struct node *);
struct node *add_node(struct node *,int,int);
void evaluate(struct node *);
int main()
{
   int option;
   clrscr();
   do
   {
      printf("\n\n ******** MAIN MENU*******");
      printf("\n 1: Enter the First Polynomial");
      printf("\n 2: Display the First Polynomial");
      printf("\n 3: Enter the Second Polynomial ");
      printf("\n 4: Display the Second Polynomial");
      printf("\n 5: Add the polnomials");
      printf("\n 6:Display the Result");
      printf("\n\n Enter your option:");
      scanf("%d",&option);
      switch(option)
      {
	 case 1: start1=create_poly(start1);
		 break;
	 case 2: start1=display_poly(start1);
		 break;
	 case 3: start2=create_poly(start2);
		 break;
	 case 4: start2=display_poly(start2);
		 break;
	 case 5: start3=add_poly(start1,start2,start3);
		 break;
	 case 6: start3=display_poly(start3);
		 break;
	 }
   }while(option!=7);
   getch();
   return 0;
}
struct node *create_poly(struct node *start)
{
    struct node *new_node,*ptr;
    int n,c;
    printf("\n Enter the number:");
    scanf("%d",&n);
    printf("\t Enter its coefficient:");
    scanf("%d",&c);
    while(n !=-1)
    {

       if(start==NULL)
       {
	 new_node=(struct node*) malloc(sizeof(struct node));
	 new_node->num=n;
	 new_node->coeff=c;
	 new_node->next=NULL;
	 start=new_node;
       }
       else
       {
	  ptr=start;
	  while(ptr->next !=NULL)
	    ptr=ptr->next;
	    new_node=(struct node*) malloc(sizeof(struct node));
	    new_node->num=n;
	    new_node->coeff=c;
	    ptr->next=new_node;
	    new_node->next=NULL;
	}
	printf("Enter the number :");
	scanf("%d",&n);
	if(n==-1)
	 break;
	printf("\t Enter its Coefficient");
	scanf("%d",&c);
    }
    return start;
}
struct node *display_poly(struct node *start)
{
   struct node *ptr;
   ptr=start;
   while(ptr !=NULL)
   {
      printf("\n %d x %d\t",ptr->num,ptr->coeff);
      ptr=ptr->next;
   }
   return start;
}

struct node *add_poly(struct node *start1,struct node *start2,struct node *start3)
{
    struct node *ptr1,*ptr2;
    int sum_num,c;
    ptr1=start1,ptr2=start2;
    while(ptr1 !=NULL && ptr2 !=NULL)
    {
       if(ptr1->coeff ==ptr2->coeff)
	 {
	   sum_num=ptr1->num+ptr2->num;
	   start3=add_node(start3,sum_num,ptr1->coeff);
	   ptr1=ptr1->next;
	   ptr2=ptr2->next;
	  }
	else if (ptr1->coeff > ptr2->coeff)
	  {
	   start3=add_node(start3,ptr1->num,ptr1->coeff);
	   ptr1=ptr1->next;
	  }
	else if (ptr1->coeff < ptr2->coeff)
	{
	   start3=add_node(start3,ptr2->num,ptr2->coeff);
	   ptr2=ptr2->next;
	}
    }
    if(ptr1 ==NULL)
    {
       while(ptr2!=NULL)
	{
	 start3=add_node(start3,ptr2->num,ptr2->coeff);
	   ptr2=ptr2->next;
	}
    }
    if(ptr2 ==NULL)
    {
       while(ptr1!=NULL)
	{
	 start3=add_node(start3,ptr1->num,ptr1->coeff);
	   ptr1=ptr1->next;
	}
    }
    return start3;
}
struct node *add_node(struct node *start,int n,int c)
{
  struct node *ptr,*new_node;
  if(start==NULL)
       {
	 new_node=(struct node*) malloc(sizeof(struct node));
	 new_node->num=n;
	 new_node->coeff=c;
	 new_node->next=NULL;
	 start=new_node;
       }
       else
       {
	  ptr=start;
	  while(ptr->next !=NULL)
	    ptr=ptr->next;
	    new_node=(struct node*) malloc(sizeof(struct node));
	    new_node->num=n;
	    new_node->coeff=c;
	    ptr->next=new_node;
	    new_node->next=NULL;
	}
   return start;
}
```
# Labset 6 DS
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