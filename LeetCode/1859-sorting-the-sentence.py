class Solution(object):
    def sortSentence(self, s):
        """
        :type s: str
        :rtype: str
        """
        ans = []
        dict = {}
        substrings = s.split(' ')

        for sub in substrings:
            dict[sub[-1]] = sub[:(len(sub)-1)]
        
        for i in range(1, len(substrings)+1):
            ans.append(dict[str(i)])
        
        ans = ' '.join(ans)
        return(ans)