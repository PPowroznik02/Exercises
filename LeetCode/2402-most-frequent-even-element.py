class Solution(object):
    def mostFrequentEven(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        occurances = {}

        for n in nums:
            if n % 2 == 0:
                if n in occurances:
                    occurances[n] += 1
                else:
                    occurances[n] = 1

        if not occurances:
            return(-1)
        else:
            max_value = max(occurances.values())

            highest_keys = [key for key, value in occurances.items() if value == max_value]

            return(min(highest_keys))