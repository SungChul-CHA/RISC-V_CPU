# 0 "main.c"
# 0 "<built-in>"
# 0 "<command-line>"
# 1 "main.c"


int mult(int a, int b) {
 int result, i;
 for (i = 0; i < b; i++) {
  result += a;
 }

 return result;
}


int main() {
 int i, j;
 int result[20];

 for (i = 1; i < 20; i++) {
  for (j = 1; j < 20; j++) {
   result[i-1] = mult(i, j);
  }
 }

 return 0;
}
