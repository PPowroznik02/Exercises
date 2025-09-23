class Solution {
    public void change(int[][] matrix, int row, int col) {
        for (int i = 0; i < matrix[0].length; i++) {
            matrix[row][i] = 0;
        }

        for (int i = 0; i < matrix.length; i++) {
            matrix[i][col] = 0;
        }
    }

    public void setZeroes(int[][] matrix) {
        ArrayList<Integer[]> indexes = new ArrayList<Integer[]>();

        for (Integer i = 0; i < matrix.length; i++) {
            for (Integer j = 0; j < matrix[0].length; j++) {
                if (matrix[i][j] == 0) {
                    Integer[] point = { i, j };
                    indexes.add(point);
                }
            }
        }

        for (Integer i = 0; i < indexes.size(); i++) {
            change(matrix, indexes.get(i)[0], indexes.get(i)[1]);
        }

    }
}