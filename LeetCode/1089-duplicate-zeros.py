class Solution(object):
    def duplicateZeros(self, arr):
        """
        :type arr: List[int]
        :rtype: None Do not return anything, modify arr in-place instead.
        """
        def shiftVals(self, idx, arr):
            for i in range(len(arr)-1, idx, -1):
                arr[i] = arr[i-1]
        
        i = 0
        while i < len(arr):
            if arr[i] == 0:
                shiftVals(self, i, arr)
                i += 2
            else:
                i += 1
