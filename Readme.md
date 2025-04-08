## 1
```c
#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
void main()
{
int pid; 
pid=fork();
if(pid<0)
{
printf("fork failed");
exit(1);
}
else if(pid==0)
{
execlp("whoami","ls",NULL);
exit(0);
}
else
{
printf("\n Process id is :%d\n",getpid());
wait(NULL);
exit(0);
}
}
```
## 2
```c
#include<stdio.h>
#include<windows.h>
int main()
{
 HANDLE hProcess,hThread;
 STARTUPINFO si;
 PROCESS_INFORMATION pi;
 ZeroMemory(&si,sizeof(si));
 si.cb=sizeof(si);
 ZeroMemory(&pi,sizeof(pi));
 
if(!CreateProcess("C:\\Windows\\System32\\cmd.exe",NULL,NULL,NULL,FALSE,0,NUL
L,NULL,&si,&pi))
 {
 printf("Sorry! CreateProcess() failed\n");
 return -1;
 }
 else
 {
 printf("Well CreateProcess() looks OK\n");
 printf("exit after 5000ms\n");
 }
 WaitForSingleObject(pi.hProcess,5000);
 CloseHandle(pi.hProcess);
 CloseHandle(pi.hThread);
 return 0;
}
```
## 3
```c
#include<stdio.h>
#include<conio.h>
struct fileTable
{
char name[20];
int sb, nob;
}ft[30];
void main()
{
int i, j, n;
char s[20];
clrscr();
printf("Enter no of files :");
scanf("%d",&n);
for(i=0;i<n;i++)
{
printf("\nEnter file name %d :",i+1);
scanf("%s",ft[i].name);
printf("Enter starting block of file %d :",i+1);
scanf("%d",&ft[i].sb);
printf("Enter no of blocks in file %d :",i+1);
scanf("%d",&ft[i].nob);
}
printf("\nEnter the file name to be searched-- ");
scanf("%s",s);
for(i=0;i<n;i++)
if(strcmp(s, ft[i].name)==0)
break;
if(i==n)
printf("\nFile Not Found");
else
{
printf("\nFILE NAME START BLOCK NO OF BLOCKS BLOCKS OCCUPIED\n");
printf("\n%s\t\t%d\t\t%d\t",ft[i].name,ft[i].sb,ft[i].nob);
for(j=0;j<ft[i].nob;j++)
printf("%d, ",ft[i].sb+j);
}
getch();
}
```
## 4
```c
#include<stdio.h> 
struct
{
char dname[10],fname[10][10]; 
int fcnt;
}dir;
void main()
{
int i,ch; char 
f[30]; clrscr();
dir.fcnt = 0;
printf("\nEnter name of directory -- "); 
scanf("%s", dir.dname);
while(1)
{
printf("\n\n1. Create File\t2. Delete File\t3. Search File \n
4. Display Files\t5. Exit\nEnter your choice -- "); 
scanf("%d",&ch);
switch(ch)
{
case 1: printf("\nEnter the name of the file -- "); 
scanf("%s",dir.fname[dir.fcnt]); 
dir.fcnt++; break;
case 2: printf("\nEnter the name of the file -- "); 
scanf("%s",f); 
for(i=0;i<dir.fcnt;i++)
{
if(strcmp(f, dir.fname[i])==0)
{
printf("File %s is deleted ",f); strcpy(dir.fname[i],dir.fname[dir.fcnt-1]);
break;
}
if(i==dir.fcnt)
printf("File %s not found",f);
else
dir.fcnt--;
break;
case 3: printf("\nEnter the name of the file -- ");
scanf("%s",f);
for(i=0;i<dir.fcnt;i++)
{
if(strcmp(f, dir.fname[i])==0)
{
printf("File %s is found ", f);
break;
}
}
if(i==dir.fcnt)
printf("File %s not found",f);
break;
case 4: if(dir.fcnt==0)
printf("\nDirectory Empty");
else
{
printf("\nThe Files are -- ");
for(i=0;i<dir.fcnt;i++)
printf("\t%s",dir.fname[i]);
}
break;
default: exit (0);
}
}
getch();
}
```
## 5
```c
#include<stdio.h>
int tph, philname[20], status[20], howhung, hu[20], cho; 
void main()
{
int i; clrscr();
printf("\n\nDINING PHILOSOPHER PROBLEM");
printf("\nEnter the total no. of philosophers: ");
scanf("%d",&tph);
for(i=0;i<tph;i++)
{
philname[i]=(i+1); status[i]=1;
}
printf("How many are hungry : ");
scanf("%d", &howhung);
if(howhung==tph)
{
printf(“\n All are hungry..\nDead lock stage will occur”);
printf(\n”Exiting\n”);
else{
for(i=0;i<howhung;i++){
printf(“Enterphilosopher%dposition:”,(i+1));
scanf(“%d”,&hu[i]);
status[hu[i]]=2;
}
do
{
printf("1.One can eat at a time\t2.Two can eat at a time
\t3.Exit\nEnter your choice:");
scanf("%d", &cho);
switch(cho)
{
case 1: one();
break;
case 2: two();
break;
case 3: exit(0);
default: printf("\nInvalid option..");
}
}while(1);
}
}
void one()
{
int pos=0, x, i;
printf("\nAllow one philosopher to eat at any time\n");
for(i=0;i<howhung; i++, pos++)
{
printf("\nP %d is granted to eat", philname[hu[pos]]);
for(x=pos;x<howhung;x++)
printf("\nP %d is waiting", philname[hu[x]]);
}
}
void two()
{
int i, j, s=0, t, r, x;
printf("\n Allow two philosophers to eat at same
time\n"); for(i=0;i<howhung;i++)
{
for(j=i+1;j<howhung;j++)
{
if(abs(hu[i]-hu[j])>=1&& abs(hu[i]-hu[j])!=4)
{
printf("\n\ncombination %d \n", (s+1));
t=hu[i];
r=hu[j]; s++;
printf("\nP %d and P %d are granted to eat", philname[hu[i]],
philname[hu[j]]);
for(x=0;x<howhung;x++)
{
if((hu[x]!=t)&&(hu[x]!=r))
printf("\nP %d is waiting", philname[hu[x]]);
}
}
}
}
}
```
## Daa 3rd
```c
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<time.h>
void split(int[], int, int);
void combine(int[], int, int, int);
void main()
{
int a[15000], i, j;
long int n=500;
clock_t start, end;
clrscr();
while(n<=15000)
{
for(i=0;i<=n-1;i++)
{
a[i]=rand( );
}
start=clock( );
for(i=0;i<100;i++)
{
 split(a, 0, n-1);
}
end=clock( );
printf("\n the time taken for n=%lu is %f\n",n,(end-start)/CLK_TCK);
n=n+1000;
}
getch();
}
void split(int a[],int low,int high)
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
void combine(int a[],int low, int mid, int high)
{
int c[15000],i,j,k;
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
```
## Daa 4th comp
```c
#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<time.h>
void quick_sort(int[ ], int, int);
int partition(int[ ], int, int);
void main()
{
int a[3500], i, j;
long int n=500;
clock_t start, end;
clrscr();
while(n<=3500)
{
for(i=0;i<n;i++)
{
a[i]=rand();
}
start=clock();
for(j=0; j<100; j++)
{
quick_sort(a, 0, n-1);
}
end=clock();
printf("\n the time taken for n=%lu is %f\n", n,(end-start)/CLK_TCK);
n = n + 500;
}
getch();
}
void quick_sort(int a[], int low, int high)
{
int j;
if(low<high)
{
j=partition(a,low,high);
quick_sort(a,low,j-1);
quick_sort(a,j+1,high);
}
}
int partition(int a[], int low, int high)
{
int i, j, key, temp;
key=a[low];
i=low+1;
j=high;
while(1)
{
while(a[i] <= key && i <= high)
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
## Daa 1st
```c
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
```
## Daa 2nd
```c
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
```
## Daa 3rd
```c
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
```
## Daa 4th
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
## Daa 5th
```c
#include<stdio.h>
#include<conio.h>
#include<process.h>
#include<string.h>
int horspool(char[], char[]);
void main()
{
char text[300], pattern[20]; int ans;
clrscr();
printf("\n enter the text:\n");
scanf("%s", text);
printf("\n enter the pattern:\n");
scanf("%s", pattern);
ans=horspool(text, pattern);
if(ans==1)
{
printf("\n pattern found\n");
}
else
{
printf("\n pattern is not found\n");
}
getch();
}
int horspool(char text[], char pattern[])
{
int i, j, m, n, shift[300];
n=strlen(text);
m=strlen(pattern);
for(i=0; i<=n-1; i++)
{
shift[text[i]]=m;
}
for(j=0; j<=m-2; j++)
{
shift[pattern[j]]=m-1-j;
}
for(i=m-1; i<=n-1; i=i+shift[text[i]])
{
j=0;
while(pattern[m-1-j]==text[i-j] && j<=m-1)
{
++j;
}
if(j==m)
{
return 1;
}
}
return 0;
}
```