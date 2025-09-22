class Solution(object):
    def fizzBuzz(self, n):
        """
        :type n: int
        :rtype: List[str]
        """

        def singleFizzBuzz(n):
            if (n % 3 == 0) & (n % 5 == 0):
                return('FizzBuzz')
            elif n % 3 == 0:
                return('Fizz')
            elif n % 5 == 0:
                return('Buzz')
            else:
                return(str(n))

        out = []

        for i in range(1, n+1):
            out.append(singleFizzBuzz(i))
        
        return(out)