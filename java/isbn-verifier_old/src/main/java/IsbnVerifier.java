class IsbnVerifier {

    boolean isValid(String stringToVerify) {
        String input = stringToVerify.replaceAll("-", "");
        return input.length() == 10 && check(input) && charCheck(input);
    }

    private boolean check(String input) {
        if(input.charAt(9) == 'X') {
            return filter(input, 10) % 11 == 0;
        } else if(input.charAt(9) % 2 == 0) {
            return filter(input, (int) input.charAt(9)) % 11 == 0;
        } else return false;
    }

    private int filter(String input, int last) {
        return ((int) input.charAt(0) * 10) + ((int) input.charAt(1) * 9)  + ((int) input.charAt(2) * 8)
                + ((int) input.charAt(3) * 7)  + ((int) input.charAt(4) * 6) + ((int) input.charAt(5) * 5)
                + ((int) input.charAt(6) * 4)  + ((int) input.charAt(7) * 3) + ((int) input.charAt(8) * 2)
                + (last);
    }

    private boolean charCheck(String input) {
        try {
            for (int i = 0; i < 9; i++) {
                Integer.parseInt(String.valueOf(input.charAt(i)));
            }
            return true;
        } catch (NumberFormatException ex) {
            return false;
        }
    }

    public static void main(String[]args) {
        System.out.println(new IsbnVerifier().isValid("3-598-21507-X"));
//        System.out.println(264 % 11);
    }
}