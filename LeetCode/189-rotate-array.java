class Solution {
    public void swap(int[] nums, int a, int b) {
        int tmp = nums[a];
        nums[a] = nums[b];
        nums[b] = tmp;
    }

    public void rev(int[] nums, int start, int end) {
        while (start < end) {
            swap(nums, start, end);
            System.out.println(end);
            start++;
            end--;
        }
    }

    public void rotate(int[] nums, int k) {
        int len = nums.length;
        int start, end;

        k %= len;

        rev(nums, 0, len - 1);
        rev(nums, 0, k - 1);
        rev(nums, k, len - 1);

    }
}