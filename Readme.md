## Now this is my lab Cheat Code copy area
Enjoy guys all the lab programs are uploaded here......
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