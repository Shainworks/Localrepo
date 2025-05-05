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
printf(\n”Exiting\n”)
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
