import java.util.HashMap;

class Solution {
    public int[] twoSum(int[] nums, int target) {
        Map<Integer, Integer> numsIndexes = new HashMap<>();
        for (int i = 0; i < nums.length; i++) {
            if (numsIndexes.containsKey(target - nums[i])) {
                return new int[] { i, numsIndexes.get(target - nums[i]) };
            }
            numsIndexes.put(nums[i], i);
        }
        return new int[] {};
    }
}