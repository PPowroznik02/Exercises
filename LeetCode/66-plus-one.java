class Solution {
    public int[] plusOne(int[] digits) {
        int len = digits.length - 1;

        while (len >= 0) {
            if (digits[len] == 9)
                digits[len] = 0;
            else {
                digits[len] += 1;
                return digits;
            }

            len--;
        }

        int[] newDigits = new int[digits.length + 1];
        newDigits[0] = 1;
        return newDigits;

    }
}