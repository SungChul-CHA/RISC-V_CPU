#define MAX_CNT	9

int mult(int a, int b) {
	int result, i;
	for (i = 0; i < b; i++) {
		result += a;
	}
	
	return result;
}


int main() {
	int i, j;
	int result[MAX_CNT][MAX_CNT];
	
	for (i = 1; i < MAX_CNT+1; i++) {
		for (j = 1; j < MAX_CNT+1; j++) {
			result[i-1][j-1] = mult(i, j);
		}
	}

	if (result[3][3] == 9) return 0;
	else return -1;

}
