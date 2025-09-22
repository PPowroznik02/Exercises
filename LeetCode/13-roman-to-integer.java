class Solution {
    public int romanToInt(String s) {
        Map<Character, Integer> romanNums = new HashMap<>();
        romanNums.put('I', 1);
        romanNums.put('V', 5);
        romanNums.put('X', 10);
        romanNums.put('L', 50);
        romanNums.put('C', 100);
        romanNums.put('D', 500);
        romanNums.put('M', 1000);

        Integer result = 0;
        for (int i = 0; i < s.length() - 1; i++) {
            if (romanNums.get(s.charAt(i + 1)) > romanNums.get(s.charAt(i))) {
                result -= romanNums.get(s.charAt(i));
            } else {
                result += romanNums.get(s.charAt(i));
            }
        }
        result += romanNums.get(s.charAt(s.length() - 1));
        return result;
    }
}