class Solution {
    public boolean isValid(String s) {
        Stack<Character> myStack = new Stack<>();

        for (int i = 0; i < s.length(); i++) {
            if (!myStack.empty()) {
                char top = myStack.pop();
                if (top == '(' && s.charAt(i) == ')') {
                    continue;
                } else if (top == '{' && s.charAt(i) == '}') {
                    continue;
                } else if (top == '[' && s.charAt(i) == ']') {
                    continue;
                }
                myStack.push(top);
            }
            myStack.push(s.charAt(i));
        }
        return myStack.empty();
    }
}