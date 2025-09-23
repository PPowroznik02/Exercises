class Solution {
    public boolean isPalindrome(int x) {
        if (x < 0)
            return (false);

        long rev = 0, x2 = x;
        int len = (int) (Math.log10(x));

        for (int i = 1; i <= ((int) (Math.log10(x) + 1)); i++) {
            rev += (x2 % 10) * Math.pow(10, len);
            x2 /= 10;
            len--;
        }

        if (rev == x)
            return (true);
        else
            return (false);
    }
}