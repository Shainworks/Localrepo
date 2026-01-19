1. Write a C program for error detection using CRC-CCITT 
(16-bits).  
// Include headers   
#include<stdio.h>   
#include<string.h>   
// length of the generator polynomial   
#define N strlen(gen_poly)   
// data to be transmitted and received   
char data[28];   
// CRC value   
char check_value[28];   
// generator polynomial   
char gen_poly[10];   
// variables    
int data_length,i,j;   
// function that performs XOR operation   
void XOR(){   
// if both bits are the same, the output is 0   
// if the bits are different the output is 1   
for(j = 1;j < N; j++)   
check_value[j] = (( check_value[j] == gen_poly[j])?'0':'1');       
}   
// Function to check for errors on the receiver side   
void receiver(){   
// get the received data   
    printf("Enter the received data: ");   
    scanf("%s", data);   
    printf("\n-----------------------------\n");   
    printf("Data received: %s", data);   
// Cyclic Redundancy Check   
    crc();   
// Check if the remainder is zero to find the error   
    for(i=0;(i<N-1) && (check_value[i]!='1');i++);   
        if(i<N-1)   
          printf("\nError detected\n\n");   
        else   
            printf("\nNo error detected\n\n");   
}   
   
void crc(){   
    // initializing check_value   
    for(i=0;i<N;i++)   
        check_value[i]=data[i];   
    do{   
    // check if the first bit is 1 and calls XOR function   
        if(check_value[0]=='1')   
            XOR();   
// Move the bits by 1 position for the next computation   
        for(j=0;j<N-1;j++)   
            check_value[j]=check_value[j+1];   
        // appending a bit from data   
        check_value[j]=data[i++];   
    }while(i<=data_length+N-1);   
// loop until the data ends   
}   
   
int main()   
{   
    // get the data to be transmitted   
    printf("\nEnter data to be transmitted: ");   
    scanf("%s",data);   
    printf("\n Enter the Generating polynomial: ");   
    // get the generator polynomial   
    scanf("%s",gen_poly);   
    // find the length of data   
    data_length=strlen(data);   
    // appending n-1 zeros to the data   
    for(i=data_length;i<data_length+N-1;i++)   
        data[i]='0';   
    printf("\n----------------------------------------");   
// print the data with padded zeros   
    printf("\n Data padded with n-1 zeros : %s",data);   
    printf("\n----------------------------------------");   
// Cyclic Redundancy Check   
    crc();   
// print the computed check value   
    printf("\nCRC or Check value is : %s",check_value);   
// Append data with check_value(CRC)     
    for(i=data_length;i<data_length+N-1;i++)   
        data[i]=check_value[i-data_length];   
    printf("\n----------------------------------------");   
// printing the final data to be sent   
    printf("\n Final data to be sent : %s",data);   
    printf("\n----------------------------------------\n");   
// Calling the receiver function to check errors   
    receiver();   
        return 0;   
}  
2. Write a C program to generate Hamming Code for error 
detection and correction.  
#include <stdio.h> 
#include <math.h> 
int input[32]; 
int code[32]; 
int ham_calc(int,int); 
void main() 
{ 
 int n,i,p_n = 0,c_l,j,k; 
 printf("Please enter the length of the Data Word: "); 
 scanf("%d",&n); 
 printf("Please enter the Data Word:\n"); 
 for(i=0;i<n;i++) 
 { 
  scanf("%d",&input[i]); 
 } 
 
 i=0; 
 while(n>(int)pow(2,i)-(i+1)) 
 { 
  p_n++; 
  i++; 
 } 
 c_l = p_n + n; 
 j=k=0; 
 for(i=0;i<c_l;i++) 
 { 
   
  if(i==((int)pow(2,k)-1)) 
  { 
   code[i]=0; 
   k++; 
  } 
  else 
  { 
   code[i]=input[j]; 
   j++; 
  } 
 } 
 for(i=0;i<p_n;i++) 
 { 
  int position = (int)pow(2,i); 
  int value = ham_calc(position,c_l); 
  code[position-1]=value; 
 } 
 printf("\nThe calculated Code Word is: "); 
 for(i=0;i<c_l;i++) 
  printf("%d",code[i]); 
 printf("\n"); 
 printf("Please enter the received Code Word:\n"); 
 for(i=0;i<c_l;i++) 
  scanf("%d",&code[i]); 
 
 int error_pos = 0; 
 for(i=0;i<p_n;i++) 
 { 
  int position = (int)pow(2,i); 
  int value = ham_calc(position,c_l); 
  if(value != 0) 
   error_pos+=position; 
 } 
 if(error_pos == 1) 
  printf("The received Code Word is correct.\n"); 
 else 
  printf("Error at bit position: %d\n",error_pos); 
} 
int ham_calc(int position,int c_l) 
{ 
 int count=0,i,j; 
 i=position-1; 
 while(i<c_l) 
 { 
  for(j=i;j<i+position;j++) 
  { 
   if(code[j] == 1) 
    count++; 
  } 
  i=i+2*position; 
 } 
 if(count%2 == 0) 
  return 0; 
 else 
  return 1; 
}
3. Write a C program to implement Distance vector Routing 
algorithm
 
#include<stdio.h> 
int dist[50][50],temp[50][50],n,i,j,k,x; 
void dvr(); 
int main() 
{ 
    printf("\nEnter the number of nodes : "); 
    scanf("%d",&n); 
    printf("\nEnter the distance matrix :\n"); 
    for(i=0;i<n;i++) 
    { 
        for(j=0;j<n;j++) 
        {    
            scanf("%d",&dist[i][j]); 
            dist[i][i]=0; 
            temp[i][j]=j; 
        } 
        printf("\n"); 
 } 
     dvr();  
     printf("enter value of i &j:"); 
     scanf("%d",&i); 
  scanf("%d",&j);    
  printf("enter the new cost"); 
  scanf("%d",&x);    
  dist[i][j]=x; 
  printf("After update\n\n");      
     dvr(); 
  return 0;  
} 
void dvr() 
{ 
 for (i = 0; i < n; i++) 
            for (j = 0; j < n; j++) 
             for (k = 0; k < n; k++) 
                 if (dist[i][k] + dist[k][j] < dist[i][j]) 
                 { 
                     dist[i][j] = dist[i][k] + dist[k][j]; 
                     temp[i][j] = k; 
                 } 
                  
 for(i=0;i<n;i++) 
        { 
            printf("\n\nState value for router %d is \n",i+1); 
            for(j=0;j<n;j++) 
                printf("\t\nnode %d via %d Distance%d",j+1,temp[i][j]+1,dist[i][j]); 
        }    
    printf("\n\n"); 
 
}
4. Write a C program to implement Open Shortest Path First 
Routing Algorithm 
 
  #include <stdio.h> 
  #include <string.h> 
  int main() 
  { 
  int count,src_router,i,j,k,w,v,min; 
  int cost_matrix[100][100],dist[100],last[100]; 
  int flag[100]; 
   printf("\n Enter the no of routers"); 
  scanf("%d",&count);  
  printf("\n Enter the cost matrix values:"); 
  for(i=0;i<count;i++) 
  { 
  for(j=0;j<count;j++) 
  { 
   printf("\n%d->%d:",i,j); 
  scanf("%d",&cost_matrix[i][j]); 
  if(cost_matrix[i][j]<0)cost_matrix[i][j]=1000; 
  } 
  } 
   printf("\n Enter the source router:"); 
  scanf("%d",&src_router); 
  for(v=0;v<count;v++) 
  { 
  flag[v]=0; 
  last[v]=src_router; 
  dist[v]=cost_matrix[src_router][v]; 
  } 
  flag[src_router]=1; 
  for(i=0;i<count;i++) 
  { 
  min=1000; 
  for(w=0;w<count;w++) 
  { 
  if(!flag[w]) 
  if(dist[w]<min) 
  { 
  v=w; 
  min=dist[w]; 
  } 
  } 
  flag[v]=1; 
  for(w=0;w<count;w++) 
  { 
  if(!flag[w]) 
  if(min+cost_matrix[v][w]<dist[w]) 
  { 
  dist[w]=min+cost_matrix[v][w]; 
  last[w]=v; 
  } 
  } 
  } 
  for(i=0;i<count;i++) 
  { 
   printf("\n%d==>%d:Path taken:%d",src_router,i,i); 
  w=i; 
  while(w!=src_router) 
  { 
   printf("\n<--%d",last[w]);w=last[w]; 
  } 
printf("\n Shortest path cost:%d",dist[i]); 
} 
}
5. Write a C Program to implement Border Gateway Protocol 
(BGP) 
#include <stdio.h> 
#include<conio.h> 
int main() 
{ 
int n; 
int i,j,k; 
int a[10][10],b[10][10]; 
printf("\n Enter the number of nodes:"); 
scanf("%d",&n); 
for(i=0;i<n;i++) 
{ 
for(j=0;j<n;j++) 
{ 
printf("\n Enter the distance between the host %d - %d:",i+1,j+1); 
scanf("%d",&a[i][j]); 
}} 
for(i=0;i<n;i++) 
{ 
for(j=0;j<n;j++) 
{ 
printf("%d\t",a[i][j]); 
} 
printf("\n"); 
} 
for(k=0;k<n;k++) 
{ 
for(i=0;i<n;i++) 
{ 
for(j=0;j<n;j++) 
{ 
if(a[i][j]>a[i][k]+a[k][j]) 
{ 
a[i][j]=a[i][k]+a[k][j]; 
}}}} 
for(i=0;i<n;i++) 
{ 
for(j=0;j<n;j++) 
{ 
b[i][j]=a[i][j]; 
if(i==j) 
{ 
b[i][j]=0; 
} 
}} 
printf("\n The output matrix:\n"); 
for(i=0;i<n;i++) 
{ 
for(j=0;j<n;j++) 
{ 
printf("%d\t",b[i][j]); 
} 
printf("\n"); 
} 
getch(); 
} 
