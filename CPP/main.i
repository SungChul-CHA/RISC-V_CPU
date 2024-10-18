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
 int result[9][9];

 for (i = 1; i < 9 +1; i++) {
  for (j = 1; j < 9 +1; j++) {
   result[i-1][j-1] = mult(i, j);
  }
 }

 if (result[3][3] == 9) return 0;
 else return -1;

}
