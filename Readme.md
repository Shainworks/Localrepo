## This is a local repo
I'm just initializing it to learn how to manage repos locally
This is a chnge made in the feature branch
`
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
`c