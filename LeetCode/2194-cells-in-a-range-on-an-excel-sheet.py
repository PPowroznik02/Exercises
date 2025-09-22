class Solution(object):
    def cellsInRange(self, s):
        """
        :type s: str
        :rtype: List[str]
        """
        ans = []
        for l in (chr(i) for i in range(ord(s[0]), ord(s[3])+1)):
            for n in range(int(s[1]), int(s[4])+1):
                num = l + str(n)
                ans.append(num)
        
        return(ans)