#include <stdio.h>
#include <stdlib.h>
#include <time.h>

main(int argc, char *argv[])
{ int n = atoi(argv[1]);

FILE *f=fopen("testfile","w+");
 int  i, j, k, m, *p;
  char *str1, *str2;
  long curtime;
  if (argc > 1)
     n = atoi(argv[1]);
  curtime = time(NULL);
  srand(curtime);
  str1 = "man";
  str2 = "men([";
  for (k=0 ; k<2 ; k++) {
    fprintf(f,"%s", str2);
     for (i=0 ; i<n ; i++) {
        fprintf(f,"%s%03d", str1, i+1);
        if (i != n-1)
           fprintf(f,",");
        else
           fprintf(f,"]).\n\n");
     }
     str1 = "wom";
     str2 = "women([";
  }
  p = malloc(n * sizeof(int));
  str1 = "man";
  str2 = "wom";
  for (k=0 ; k<2 ; k++) {
     for (j=0 ; j<n ; j++) {
        fprintf(f,"prefers(%s%03d,[", str1, j+1);
        for (i=0 ; i<n ; i++)
           *(p+i) = i+1;
        for (i=0 ; i<n ; i++) {
           m = rand() % n;
           while (*(p+m) == 0) {
              m = (++m) % n;
           }
           *(p+m) = 0;
           fprintf(f,"%s%03d", str2, m+1);
           if (i != n-1)
             fprintf(f,",");
           else
              fprintf(f,"]).\n");
        }
     }
     str1 = "wom";
     str2 = "man";
  }
fclose(f);
}
