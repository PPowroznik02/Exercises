class Solution {
    public boolean isPalindrome(String s) {
        s = s.toLowerCase();
        s = s.replaceAll("[^a-z0-9]", "");

        char[] c = s.toCharArray();

        int right = c.length - 1;

        for (int left = 0; left < c.length / 2; left++) {
            System.out.print(c[left]);
            if (c[left] != c[right]) {
                return (false);
            }
            right--;
        }

        return (true);
    }
}