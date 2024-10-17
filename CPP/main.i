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
 int result[3][3];

 for (i = 1; i < 3 +1; i++) {
  for (j = 1; j < 3 +1; j++) {
   result[i][j] = mult(i, j);
  }
 }

 return 0;
}
