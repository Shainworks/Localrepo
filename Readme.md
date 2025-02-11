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

struct node {
    int coeff;
    int power;
    struct node *next;
};

struct node* create_poly(struct node *start);
struct node* display_poly(struct node *start);
struct node* add_poly(struct node *start1, struct node *start2);
struct node* insert_at_end(struct node *start, int coeff, int power);

int main() {
    struct node *start1 = NULL, *start2 = NULL, *start3 = NULL;
    int option;

    do {
        printf("\n******** MAIN MENU *******");
        printf("\n1: Enter the First Polynomial");
        printf("\n2: Display the First Polynomial");
        printf("\n3: Enter the Second Polynomial");
        printf("\n4: Display the Second Polynomial");
        printf("\n5: Add the Polynomials");
        printf("\n6: Display the Result");
        printf("\n7: Exit");
        printf("\n\nEnter your option: ");
        scanf("%d", &option);

        switch(option) {
            case 1: 
                start1 = create_poly(start1);
                break;
            case 2: 
                start1 = display_poly(start1);
                break;
            case 3: 
                start2 = create_poly(start2);
                break;
            case 4: 
                start2 = display_poly(start2);
                break;
            case 5: 
                start3 = add_poly(start1, start2);
                break;
            case 6: 
                start3 = display_poly(start3);
                break;
            case 7:
                printf("\nExiting the program.\n");
                break;
            default:
                printf("\nInvalid option.\n");
        }
    } while(option != 7);

    return 0;
}

struct node* create_poly(struct node *start) {
    int coeff, power;
    struct node *new_node, *ptr;

    printf("\nEnter the terms of the polynomial (enter -1 for power to end):\n");
    printf("Enter coefficient and power: ");
    scanf("%d %d", &coeff, &power);

    while (power != -1) {
        start = insert_at_end(start, coeff, power);

        printf("Enter coefficient and power: ");
        scanf("%d %d", &coeff, &power);
    }

    return start;
}

struct node* insert_at_end(struct node *start, int coeff, int power) {
    struct node *new_node, *ptr;
    new_node = (struct node*) malloc(sizeof(struct node));
    new_node->coeff = coeff;
    new_node->power = power;
    new_node->next = NULL;

    if (start == NULL) {
        start = new_node;
    } else {
        ptr = start;
        while (ptr->next != NULL) {
            ptr = ptr->next;
        }
        ptr->next = new_node;
    }

    return start;
}

struct node* display_poly(struct node *start) {
    struct node *ptr;
    if (start == NULL) {
        printf("\nThe polynomial is empty.\n");
        return start;
    }

    printf("\nPolynomial: ");
    ptr = start;
    while (ptr != NULL) {
        printf("%dx^%d ", ptr->coeff, ptr->power);
        if (ptr->next != NULL && ptr->coeff >= 0)
            printf("+ ");
        ptr = ptr->next;
    }
    printf("\n");

    return start;
}

struct node* add_poly(struct node *start1, struct node *start2) {
    struct node *ptr1 = start1, *ptr2 = start2, *start3 = NULL;

    while (ptr1 != NULL && ptr2 != NULL) {
        if (ptr1->power == ptr2->power) {
            start3 = insert_at_end(start3, ptr1->coeff + ptr2->coeff, ptr1->power);
            ptr1 = ptr1->next;
            ptr2 = ptr2->next;
        } else if (ptr1->power > ptr2->power) {
            start3 = insert_at_end(start3, ptr1->coeff, ptr1->power);
            ptr1 = ptr1->next;
        } else {
            start3 = insert_at_end(start3, ptr2->coeff, ptr2->power);
            ptr2 = ptr2->next;
        }
    }

    while (ptr1 != NULL) {
        start3 = insert_at_end(start3, ptr1->coeff, ptr1->power);
        ptr1 = ptr1->next;
    }

    while (ptr2 != NULL) {
        start3 = insert_at_end(start3, ptr2->coeff, ptr2->power);
        ptr2 = ptr2->next;
    }

    return start3;
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


