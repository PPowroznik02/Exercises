class Solution {
    public int removeDuplicates(int[] nums) {
        int index = 1;
        int occurences = 0;

        for (int i = 1; i < nums.length; i++) {
            if (nums[i - 1] == nums[i]) {
                occurences++;
            } else {
                occurences = 0;
            }
            if (occurences <= 1) {
                nums[index] = nums[i];
                index++;
            }
        }
        return (index);

    }
}
