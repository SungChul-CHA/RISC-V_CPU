#define	MAX_CNT	20

int mult(int a, int b) {
	int result, i;
	for (i = 0; i < b; i++) {
		result += a;
	}
	
	return result;
}


int main() {
	int i, j;
	int result[MAX_CNT];
	
	for (i = 1; i < MAX_CNT; i++) {
		for (j = 1; j < MAX_CNT; j++) {
			result[i-1] = mult(i, j);
		}
	}

	return 0;
}
