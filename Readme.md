## ADA lab 4
```c
#include<stdio.h>
#include<conio.h>
void quick_sort(int[ ], int, int);
int partition(int[ ], int, int);
void main()
{
int a[20], i, n;
clrscr();
printf("\n Enter the no. of elements:\t");
scanf("%d", &n);
printf("\n Enter the elements:\n");
for(i=0;i<=n-1;i++)
{
scanf("%d", &a[i]);
}
quick_sort(a, 0, n-1);
printf("\n The sorted array is:\n");
for(i=0;i<=n-1;i++)
{
printf("%d\t", a[i]);
}
getch();
}
void quick_sort(int a[], int low, int high)
{
int j;
if(low<high)
{
j = partition(a, low, high);
quick_sort(a, low, j-1);
quick_sort(a, j+1, high);
}
}
int partition(int a[ ], int low, int high)
{
int i, j, key, temp;
key = a[low];
i = low+1;
j = high;
while(1)
{
while(a[i] < key && i <= high)
{
++i;
}
while(a[j] > key && j >= low)
{
--j;
}
if(i < j)
{
temp = a[i];
a[i] = a[j];
a[j] = temp;
}
else
{
temp = a[low];
a[low] = a[j];
a[j] = temp;
return j;
}
}
}
```
## OS lab 6
```c
#include<stdio.h>
#include<conio.h>
struct process
{
int pid;
int bt;
int wt;
int tt;
}p[10],temp;
int main()
{
int i,j,n,totwt,tottt;
float avg1,avg2;
clrscr();
printf("\nEnter the number of process:\t");
scanf("%d",&n);
for(i=1;i<=n;i++)
{
p[i].pid=i;
printf("\nEnter the burst time:\t");
scanf("%d",&p[i].bt);
}
for(i=1;i<n;i++){
for(j=i+1;j<=n;j++)
{
if(p[i].bt>p[j].bt)
{
temp.pid=p[i].pid;
p[i].pid=p[j].pid;
p[j].pid=temp.pid;
temp.bt=p[i].bt;p[i].bt=p[j].bt;
p[j].bt=temp.bt;
}}}
p[1].wt=0;
p[1].tt=p[1].bt+p[1].wt;
i=2;
while(i<=n){
p[i].wt=p[i-1].bt+p[i-1].wt;
p[i].tt=p[i].bt+p[i].wt;
i++;
}
i=1;
totwt=tottt=0;
printf("\nProcess id \tbt \twt \ttt");
while(i<=n){
printf("\n\t%d \t%d \t%d t%d\n",p[i].pid,p[i].bt,p[i].wt,p[i].tt);
totwt=p[i].wt+totwt;
tottt=p[i].tt+tottt;
i++;
} avg1=totwt/n;
avg2=tottt/n;
printf("\n Average waiting time=%f\n Average turnaround time=%f",avg1,avg2);
getch();
return 0;
}
```