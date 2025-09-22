class Solution(object):
    def leftRightDifference(self, nums):
        """
        :type nums: List[int]
        :rtype: List[int]
        """
        out = []

        for i in range(len(nums)):
            left = sum(nums[:i])
            right = sum(nums[i+1:])

            out.append(abs(left-right))

        return(out)
            