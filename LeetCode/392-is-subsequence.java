class Solution {
    public boolean isSubsequence(String s, String t) {
        char[] s1 = s.toCharArray();
        char[] t1 = t.toCharArray();

        int len = s1.length;
        int correct = 0;
        if (correct == len) {
            return (true);
        }

        for (int i = 0; i < t1.length; i++) {
            if (t1[i] == s1[correct]) {
                correct++;
            }

            if (correct == len) {
                return (true);
            }
        }

        return (false);
    }
}