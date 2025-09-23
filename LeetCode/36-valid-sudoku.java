class Solution {
    public boolean isValidSudoku(char[][] board) {
        ArrayList<Character> values = new ArrayList<>();

        // Check in rows
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board.length; j++) {
                if (board[i][j] != '.') {
                    values.add(board[i][j]);
                }
            }
            Set<Character> withoutDuplicates = new HashSet<Character>(values);

            if (withoutDuplicates.size() != values.size()) {
                return false;
            }
            values.clear();
        }

        // check in columns
        for (int i = 0; i < board.length; i++) {
            for (int j = 0; j < board.length; j++) {
                if (board[j][i] != '.') {
                    values.add(board[j][i]);
                }
            }
            Set<Character> withoutDuplicates = new HashSet<Character>(values);

            if (withoutDuplicates.size() != values.size()) {
                return false;
            }
            values.clear();
        }

        // check in blocks
        for (int i = 0; i < board.length; i += 3) {
            for (int j = 0; j < board.length; j += 3) {
                for (int k = 0; k < 3; k++) {
                    if (board[i][j + k] != '.') {
                        values.add(board[i][j + k]);
                    }
                }
                for (int k = 0; k < 3; k++) {
                    if (board[i + 1][j + k] != '.') {
                        values.add(board[i + 1][j + k]);
                    }
                }
                for (int k = 0; k < 3; k++) {
                    if (board[i + 2][j + k] != '.') {
                        values.add(board[i + 2][j + k]);
                    }
                }

                Set<Character> withoutDuplicates = new HashSet<Character>(values);

                if (withoutDuplicates.size() != values.size()) {
                    return false;
                }
                values.clear();
            }

        }

        return true;

    }
}