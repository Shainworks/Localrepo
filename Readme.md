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