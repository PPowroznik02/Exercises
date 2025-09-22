class Solution(object):
    def largestAltitude(self, gain):
        """
        :type gain: List[int]
        :rtype: int
        """
        alt = 0
        maximum = 0

        for g in gain:
            alt += g
            if maximum < alt:
                maximum = alt
        
        return(maximum)
