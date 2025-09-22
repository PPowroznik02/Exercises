class Solution {
    public String longestCommonPrefix(String[] strs) {
        String prefix = strs[0];

        for (int i = 1; i < strs.length; i++) {
            String s = strs[i];

            while (prefix.length() > 0) {
                if (!s.startsWith(prefix)) {
                    prefix = prefix.substring(0, prefix.length() - 1);
                } else {
                    break;
                }
            }
        }
        return prefix;
    }
}