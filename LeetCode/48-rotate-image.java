class Solution {
    public void swap(int[][] matrix, int i, int j, int k, int l) {
        int tmp = matrix[i][j];
        matrix[i][j] = matrix[k][l];
        matrix[k][l] = tmp;
    }

    public void rotate(int[][] matrix) {
        int n = matrix.length - 1;

        // change rows
        for (int i = 0; i <= n / 2; i++) {
            for (int j = 0; j <= n; j++) {
                swap(matrix, i, j, n - i, j);
            }
        }

        // transpose matrix
        for (int i = 0; i <= n; i++) {
            for (int j = i + 1; j <= n; j++) {
                swap(matrix, i, j, j, i);
            }
        }
    }
}