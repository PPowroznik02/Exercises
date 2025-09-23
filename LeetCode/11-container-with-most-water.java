import java.lang.Math;

class Solution {
    public int maxArea(int[] height) {
        int left = 0, right = height.length - 1;
        int maxArea = 0;
        int curentArea;

        while (left < right) {
            curentArea = ((height[left] < height[right]) ? height[left] : height[right]) * Math.abs(left - right);
            if (curentArea > maxArea)
                maxArea = curentArea;

            if (height[left] < height[right])
                left++;
            else
                right--;
        }

        return (maxArea);
    }
}