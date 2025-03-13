## Ds lab 1
```c
#include <stdio.h>
#include <conio.h>

typedef struct distance {
    int kms;
    int metres;
} DISTANCE;

DISTANCE add_distance(DISTANCE d1, DISTANCE d2);
DISTANCE subtract_distance(DISTANCE d1, DISTANCE d2);

int main() {
    DISTANCE d1, d2, d3, d4;
    int option;

    clrscr();

    do {
        printf("\n ***MAIN MENU***");
        printf("\n 1. Read the distances");
        printf("\n 2. Display the distances");
        printf("\n 3. Add the distances");
        printf("\n 4. Subtract the distances");
        printf("\n 5. EXIT");
        printf("\n Enter your option: ");
        scanf("%d", &option);

        switch (option) {
        case 1:
            printf("\n Enter the first distance in kms and metres: ");
            scanf("%d %d", &d1.kms, &d1.metres);
            printf("\n Enter the second distance in kms and metres: ");
            scanf("%d %d", &d2.kms, &d2.metres);
            break;
        case 2:
            printf("\n The first distance is: %d kms %d metres", d1.kms, d1.metres);
            printf("\n The second distance is: %d kms %d metres", d2.kms, d2.metres);
            break;
        case 3:
            d3 = add_distance(d1, d2);
            printf("\n The sum of two distances is: %d kms %d metres", d3.kms, d3.metres);
            break;
        case 4:
            d4 = subtract_distance(d1, d2);
            printf("\n The difference between two distances is: %d kms %d metres", d4.kms, d4.metres);
            break;
        case 5:
            printf("\n Exiting the program.");
            break;
        default:
            printf("\n Invalid option! Please try again.");
        }
    } while (option != 5);

    getch();
    return 0;
}

DISTANCE add_distance(DISTANCE d1, DISTANCE d2) {
    DISTANCE sum;
    sum.metres = d1.metres + d2.metres;
    sum.kms = d1.kms + d2.kms;

    if (sum.metres >= 1000) {
        sum.metres -= 1000;
        sum.kms += 1;
    }

    return sum;
}

DISTANCE subtract_distance(DISTANCE d1, DISTANCE d2) {
    DISTANCE sub;

    // Adjust distances for proper subtraction
    if (d1.metres < d2.metres) {
        d1.metres += 1000;
        d1.kms -= 1;
    }

    sub.metres = d1.metres - d2.metres;
    sub.kms = d1.kms - d2.kms;

    return sub;
}
```
## Ds lab 2
```c
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>
#include <malloc.h>

struct node {
   int data;
   struct node *next;
};

struct node *start = NULL;
struct node *create_ll(struct node *);
struct node *display(struct node *);
struct node *insert_beg(struct node *);
struct node *insert_end(struct node *);
struct node *delete_node(struct node *);

int main() {
   int option;
   do {
      printf("\n\n ******** MAIN MENU *******");
      printf("\n 1: Create a list");
      printf("\n 2: Display the list");
      printf("\n 3: Insert beginning");
      printf("\n 4: Insert end");
      printf("\n 5: Delete a specified node");
      printf("\n 6: Exit");
      printf("\n\n Enter your option: ");
      scanf("%d", &option);
      switch(option) {
         case 1: 
            start = create_ll(start);
            printf("\nLinked list created");
            break;
         case 2: 
            start = display(start);
            break;
         case 3: 
            start = insert_beg(start);
            break;
         case 4: 
            start = insert_end(start);
            break;
         case 5: 
            start = delete_node(start);
            break;
         case 6: 
            exit(0);
            break;
         default:
            printf("\nInvalid option");
            break;
      }
   } while(option != 6);
   getch();
   return 0;
}

struct node *create_ll(struct node *start) {
    struct node *new_node, *ptr;
    int num;
    printf("\n Enter -1 to end");
    printf("\n Enter the data: ");
    scanf("%d", &num);
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
       printf("Enter the data: ");
       scanf("%d", &num);
    }
    return start;
}

struct node *display(struct node *start) {
   struct node *ptr;
   ptr = start;
   if(ptr == NULL) {
      printf("\nList is empty");
      return start;
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
    printf("\n Enter the data: ");
    scanf("%d", &num);
    new_node = (struct node *)malloc(sizeof(struct node));
    new_node->data = num;
    new_node->next = start;
    start = new_node;
    return start;
}

struct node *insert_end(struct node *start) {
    struct node *ptr, *new_node;
    int num;
    printf("\n Enter the data: ");
    scanf("%d", &num);
    new_node = (struct node *)malloc(sizeof(struct node));
    new_node->data = num;
    new_node->next = NULL;
    ptr = start;
    if(ptr != NULL) {
        while(ptr->next != NULL)
            ptr = ptr->next;
        ptr->next = new_node;
    } else {
        start = new_node;
    }
    return start;
}

struct node *delete_node(struct node *start) {
    struct node *ptr, *preptr;
    int val;
    printf("\n Enter the value of the node which has to be deleted: ");
    scanf("%d", &val);
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
## DS lab 3
```c
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Structure for Book data
struct node {
    int book_id;
    char book_title[100];
    char author[100];
    int edition;
    struct node* next;
    struct node* prev;
};

// Function prototypes
struct node* create_dll(struct node* head);
void display_dll(struct node* head);
struct node* insert_front(struct node* head, int id, char title[], char author[], int edition);
struct node* insert_rear(struct node* head, int id, char title[], char author[], int edition);
struct node* delete_front(struct node* head);
struct node* delete_rear(struct node* head);
int count_nodes(struct node* head);

int main() {
    struct node* head = NULL;
    int option, book_id, edition;
    char title[100], author[100];

    do {
        printf("\n******** MAIN MENU *******");
        printf("\n1: Create DLL of N Books");
        printf("\n2: Display DLL");
        printf("\n3: Insert Book at Front");
        printf("\n4: Insert Book at Rear");
        printf("\n5: Delete Book from Front");
        printf("\n6: Delete Book from Rear");
        printf("\n7: Count the number of Books");
        printf("\n8: Exit");
        printf("\n\nEnter your option: ");
        scanf("%d", &option);

        switch (option) {
            case 1:
                head = create_dll(head);
                break;
            case 2:
                display_dll(head);
                break;
            case 3:
                printf("\nEnter Book ID, Title, Author, Edition: ");
                scanf("%d", &book_id);
                getchar(); // Consume newline
                fgets(title, sizeof(title), stdin);
                title[strcspn(title, "\n")] = 0; // Remove newline
                fgets(author, sizeof(author), stdin);
                author[strcspn(author, "\n")] = 0; // Remove newline
                scanf("%d", &edition);
                head = insert_front(head, book_id, title, author, edition);
                break;
            case 4:
                printf("\nEnter Book ID, Title, Author, Edition: ");
                scanf("%d", &book_id);
                getchar(); // Consume newline
                fgets(title, sizeof(title), stdin);
                title[strcspn(title, "\n")] = 0; // Remove newline
                fgets(author, sizeof(author), stdin);
                author[strcspn(author, "\n")] = 0; // Remove newline
                scanf("%d", &edition);
                head = insert_rear(head, book_id, title, author, edition);
                break;
            case 5:
                head = delete_front(head);
                break;
            case 6:
                head = delete_rear(head);
                break;
            case 7:
                printf("\nTotal number of books in DLL: %d\n", count_nodes(head));
                break;
            case 8:
                printf("\nExiting the program.\n");
                break;
            default:
                printf("\nInvalid option. Please try again.\n");
        }
    } while (option != 8);

    return 0;
}

// Create DLL with N books
struct node* create_dll(struct node* head) {
    int n, id, edition;
    char title[100], author[100];
    struct node* new_node;

    printf("\nEnter the number of books: ");
    scanf("%d", &n);

    for (int i = 0; i < n; i++) {
        printf("\nEnter Book ID, Title, Author, Edition: ");
        scanf("%d", &id);
        getchar(); // Consume newline
        fgets(title, sizeof(title), stdin);
        title[strcspn(title, "\n")] = 0; // Remove newline
        fgets(author, sizeof(author), stdin);
        author[strcspn(author, "\n")] = 0; // Remove newline
        scanf("%d", &edition);

        new_node = (struct node*)malloc(sizeof(struct node));
        new_node->book_id = id;
        strcpy(new_node->book_title, title);
        strcpy(new_node->author, author);
        new_node->edition = edition;
        new_node->next = NULL;
        new_node->prev = NULL;

        if (head == NULL) {
            head = new_node;
        } else {
            struct node* temp = head;
            while (temp->next != NULL) {
                temp = temp->next;
            }
            temp->next = new_node;
            new_node->prev = temp;
        }
    }
    return head;
}

// Display DLL
void display_dll(struct node* head) {
    if (head == NULL) {
        printf("\nThe DLL is empty.\n");
        return;
    }

    struct node* temp = head;
    printf("\nBOOK ID | BOOK TITLE | AUTHOR | EDITION\n");
    printf("-----------------------------------------\n");
    while (temp != NULL) {
        printf("%d | %s | %s | %d\n", temp->book_id, temp->book_title, temp->author, temp->edition);
        temp = temp->next;
    }
}

// Insert at front of DLL
struct node* insert_front(struct node* head, int id, char title[], char author[], int edition) {
    struct node* new_node = (struct node*)malloc(sizeof(struct node));
    new_node->book_id = id;
    strcpy(new_node->book_title, title);
    strcpy(new_node->author, author);
    new_node->edition = edition;
    new_node->prev = NULL;
    new_node->next = head;

    if (head != NULL) {
        head->prev = new_node;
    }
    head = new_node;
    return head;
}

// Insert at rear of DLL
struct node* insert_rear(struct node* head, int id, char title[], char author[], int edition) {
    struct node* new_node = (struct node*)malloc(sizeof(struct node));
    struct node* temp = head;

    new_node->book_id = id;
    strcpy(new_node->book_title, title);
    strcpy(new_node->author, author);
    new_node->edition = edition;
    new_node->next = NULL;

    if (head == NULL) {
        new_node->prev = NULL;
        head = new_node;
    } else {
        while (temp->next != NULL) {
            temp = temp->next;
        }
        temp->next = new_node;
        new_node->prev = temp;
    }
    return head;
}

// Delete from front of DLL
struct node* delete_front(struct node* head) {
    if (head == NULL) {
        printf("\nThe DLL is empty.\n");
        return head;
    }

    struct node* temp = head;
    head = head->next;
    if (head != NULL) {
        head->prev = NULL;
    }
    free(temp);
    printf("\nBook removed from the front.\n");

    return head;
}

// Delete from rear of DLL
struct node* delete_rear(struct node* head) {
    if (head == NULL) {
        printf("\nThe DLL is empty.\n");
        return head;
    }

    struct node* temp = head;
    while (temp->next != NULL) {
        temp = temp->next;
    }

    if (temp->prev != NULL) {
        temp->prev->next = NULL;
    } else {
        head = NULL;  // List has only one element
    }
    free(temp);
    printf("\nBook removed from the rear.\n");

    return head;
}

// Count the number of nodes in DLL
int count_nodes(struct node* head) {
    int count = 0;
    struct node* temp = head;

    while (temp != NULL) {
        count++;
        temp = temp->next;
    }
    return count;
}
```
## Ds lab 4
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
      printf("\n\n ******** MAIN MENU*");
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
##Ds lab 5
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
#include <stdio.h>
#include <stdlib.h>
#include <conio.h>  // for getch() in Turbo C++

struct Node {
    int data;
    struct Node *left, *right;
};

// Function to create a new node
struct Node* createNode(int data) {
    struct Node* newNode = (struct Node*)malloc(sizeof(struct Node));
    newNode->data = data;
    newNode->left = newNode->right = NULL;
    return newNode;
}

// Function to insert a node into the BST
struct Node* insert(struct Node* root, int data) {
    if (root == NULL) {
        return createNode(data);
    }
    if (data < root->data) {
        root->left = insert(root->left, data);
    } else if (data > root->data) {
        root->right = insert(root->right, data);
    }
    return root;
}

// Inorder traversal (Left, Root, Right)
void inorder(struct Node* root) {
    if (root != NULL) {
        inorder(root->left);
        printf("%d ", root->data);
        inorder(root->right);
    }
}

// Preorder traversal (Root, Left, Right)
void preorder(struct Node* root) {
    if (root != NULL) {
        printf("%d ", root->data);
        preorder(root->left);
        preorder(root->right);
    }
}

// Postorder traversal (Left, Right, Root)
void postorder(struct Node* root) {
    if (root != NULL) {
        postorder(root->left);
        postorder(root->right);
        printf("%d ", root->data);
    }
}

// Main function to provide the menu
int main() {
    struct Node* root = NULL;
    int choice, n, data, i;

    do {
        printf("\nMenu:");
        printf("\n1. Create BST with N integers");
        printf("\n2. Inorder Traversal");
        printf("\n3. Preorder Traversal");
        printf("\n4. Postorder Traversal");
        printf("\n5. Exit");
        printf("\nEnter your choice: ");
        scanf("%d", &choice);

        switch (choice) {
            case 1:
                printf("Enter the number of nodes: ");
                scanf("%d", &n);
                printf("Enter %d integers: ", n);
                for (i = 0; i < n; i++) {
                    scanf("%d", &data);
                    root = insert(root, data);
                }
                printf("BST created successfully.\n");
                break;
            case 2:
                printf("Inorder Traversal: ");
                inorder(root);
                printf("\n");
                break;
            case 3:
                printf("Preorder Traversal: ");
                preorder(root);
                printf("\n");
                break;
            case 4:
                printf("Postorder Traversal: ");
                postorder(root);
                printf("\n");
                break;
            case 5:
                printf("Exiting the program.\n");
                break;
            default:
                printf("Invalid choice! Please try again.\n");
        }
    } while (choice != 5);

    getch();  // Pause the program in Turbo C++
    return 0;
}
```
## Ds lab 7
```c
#include <stdio.h>
#include <conio.h>

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
    int maxOfRest; // Declare variable at the top to follow C89 standard
    if (n == 1) {
        return arr[0];
    }
    maxOfRest = findLargest(arr, n - 1); // Assign the value here
    if (arr[n - 1] > maxOfRest) {
        return arr[n - 1];
    } else {
        return maxOfRest;
    }
}

int main() {
    int choice;
    int n, i, a, b, gcd, largest;
    int arr[100]; // Fixed-size array since Turbo C++ doesn't support variable-length arrays

    clrscr(); // Clear the screen for Turbo C++

    printf("Select an operation:\n");
    printf("1. Tower of Hanoi\n");
    printf("2. GCD of two numbers\n");
    printf("3. Largest of 'n' numbers\n");
    printf("Enter your choice: ");
    scanf("%d", &choice);

    switch (choice) {
        case 1: {
            printf("Enter the number of disks: ");
            scanf("%d", &n);
            printf("Steps to solve Tower of Hanoi:\n");
            towerOfHanoi(n, 'A', 'C', 'B');
            break;
        }
        case 2: {
            printf("Enter two numbers to find GCD: ");
            scanf("%d %d", &a, &b);
            gcd = findGCD(a, b);
            printf("The GCD of %d and %d is: %d\n", a, b, gcd);
            break;
        }
        case 3: {
            printf("Enter the number of elements: ");
            scanf("%d", &n);

            printf("Enter the elements:\n");
            for (i = 0; i < n; i++) {
                scanf("%d", &arr[i]);
            }
            largest = findLargest(arr, n);
            printf("The largest number is: %d\n", largest);
            break;
        }
        default:
            printf("Invalid choice! Please select 1, 2, or 3.\n");
    }

    printf("\nPress any key to exit...");
    getch(); // Wait for key press
    return 0;
}

```
## OS LAB 4
```c
#include<stdio.h>

struct
{
    char dname[10], fname[10][10];
    int fcnt;
} dir;

void main()
{
    int i, ch;
    char f[30];
    clrscr();
    dir.fcnt = 0;
    printf("\nEnter name of directory -- ");
    scanf("%s", dir.dname);

    while(1)
    {
        printf("\n\n1. Create File\t2. Delete File\t3. Search File \n");
        printf("4. Display Files\t5. Exit\nEnter your choice -- ");
        scanf("%d", &ch);

        switch(ch)
        {
            case 1:
                printf("\nEnter the name of the file -- ");
                scanf("%s", dir.fname[dir.fcnt]);
                dir.fcnt++;
                break;

            case 2:
                printf("\nEnter the name of the file -- ");
                scanf("%s", f);
                for(i = 0; i < dir.fcnt; i++)
                {
                    if(strcmp(f, dir.fname[i]) == 0)
                    {
                        printf("File %s is deleted ", f);
                        strcpy(dir.fname[i], dir.fname[dir.fcnt - 1]);
                        dir.fcnt--;
                        break;
                    }
                }
                if(i == dir.fcnt)
                    printf("File %s not found", f);
                break;

            case 3:
                printf("\nEnter the name of the file -- ");
                scanf("%s", f);
                for(i = 0; i < dir.fcnt; i++)
                {
                    if(strcmp(f, dir.fname[i]) == 0)
                    {
                        printf("File %s is found ", f);
                        break;
                    }
                }
                if(i == dir.fcnt)
                    printf("File %s not found", f);
                break;

            case 4:
                if(dir.fcnt == 0)
                    printf("\nDirectory Empty");
                else
                {
                    printf("\nThe Files are -- ");
                    for(i = 0; i < dir.fcnt; i++)
                        printf("\n%s", dir.fname[i]);
                }
                break;

            default:
                exit(0);
        }
    }
}
```
#include<stdio.h>
#include<conio.h>
int a[10][10], n;
void bfs(int);
void main( )
{
int i, j,src;
clrscr( );
printf("\n enter the no of nodes:\t");
scanf("%d", &n);
printf("\n enter the adjacency matrix:\n");
for(i=1;i<=n;i++)
{
for(j=1;j<=n;j++)
{
scanf("%d", &a[i][j]);
}
}
printf("\n enter the source node:\t");
scanf("%d", &src);
bfs(src);
getch( );
}
void bfs(int src)
{
int q[10], f=0, r=-1, vis[10], i, j;
for(j=1;j<=n;j++)
{
vis[j]=0;
}
vis[src]=1;
r=r+1;
q[r]=src;
while(f<=r)
{
i=q[f];
f=f+1;
for(j=1;j<=n;j++)
{
if(a[i][j]==1&&vis[j]!=1)
{
vis[j]=1;
r=r+1;
q[r]=j;
}
}
}
for(j=1;j<=n;j++)
{
if(vis[j]!=1)
{
printf("\n Node %d is not reachable\n",j);
}
else
{
printf("\n Node %d is reachable\n",j);
}
}
}
#include<stdio.h>
#include<conio.h>
const int MAX = 10;
void fnTopological(int a[MAX][MAX], int n);
void main( )
{
int a[MAX][MAX], n;
int i, j;
clrscr( );
printf("\n Enter the number of vertices : ");
scanf("%d", &n);
printf("Enter the adjacency matrix -\n");
for (i=0; i<n; i++)
for (j=0; j<n; j++)
scanf("%d", &a[i][j]);
fnTopological(a,n);
printf("\n");
getch();
}
void fnTopological(int a[MAX][MAX], int n)
{
int in[MAX], out[MAX], stack[MAX], top=-1;
int i, j, k=0;
 
for (i=0;i<n;i++) 
{
in[i] = 0;
for (j=0; j<n; j++)
if (a[j][i] == 1)
in[i]++;
}
while(1)
{
for (i=0;i<n;i++)
{
if (in[i] == 0)
{
stack[++top] = i;
in[i] = -1;
}
}
if (top == -1)
break;
out[k] = stack[top--];
for (i=0;i<n;i++)
{
if (a[out[k]][i] == 1)
in[i]--;
}
k++;
}
printf("\nTopological Sorting is:- \n");
for (i=0;i<k;i++)
printf("%d ",out[i] + 1);
}
#include<stdio.h>
#include<conio.h>
#include<process.h>
void split(int[], int, int);
void combine(int[], int, int, int);
void main( )
{
int a[20], i, n;
clrscr( );
printf("\n enter the no. of elements:\t");
scanf("%d", &n);
printf("\n enter the elements:\n");
for(i=0;i<=n-1;i++)
{
scanf("%d", &a[i]);
}
split(a, 0, n-1);
printf("\n the sorted array is:\n");
for(i=0;i<=n-1;i++)
{
printf("%d\t",a[i]);
}
getch( );
}
void split(int a[], int low, int high)
{
int mid;
if(low<high)
{
mid=(low+high)/2;
split(a,low,mid);
split(a,mid+1,high);
combine(a,low,mid,high);
}
}
void combine(int a[], int low, int mid, int high)
{
int c[20],i,j,k;
i=k=low;
j=mid+1;
while(i<=mid&&j<=high)
{
if(a[i]<a[j])
{
c[k]=a[i];
++k;
++i;
}
else
{
c[k]=a[j];
++k;
++j;
}
}
if(i>mid)
{
while(j<=high)
{
c[k]=a[j];
++k;
++j;
}
}
if(j>high)
{
while(i<=mid)
{
c[k]=a[i];
++k;
++i;
}
}
for(i=low;i<=high;i++)
{
a[i]=c[i];
}
}

