#include <stdio.h>


int strcsp(const char *str1, const char *str2);

int main(void) {
     const char str1[] = "abcde2fghi3jk4l";
   const char str2[] = "k";
   int ret = -1;

   ret = strcsp(str1, str2);
   if(ret) {
      printf("First matching character: %i\n", ret);
   } else {
      printf("Character not found");
   }
   
   return(0);
}