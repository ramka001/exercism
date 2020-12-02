class IsbnVerifier {

    boolean isValid(String stringToVerify)  {

        String input = stringToVerify.replace("-", "");

        if (input.length() != 10) {
            return false;
        } else {
            int sum = 0;

            for (int i = 0; i < 9; i++)  {
                int digit = input.charAt(i) - '0';

                System.out.println(digit);

                if (0 > digit || 9 < digit)
                    return false;
                sum += (digit * (10 - i));
            }

            char last = input.charAt(9);
            if (last != 'X' && (last < '0' ||  last > '9')) {
                return false;
            }

            sum += ((last == 'X') ? 10 : (last - '0'));

            return (sum % 11 == 0);
        }
    }

    public static void main(String[]args) {
        IsbnVerifier v = new IsbnVerifier();
        System.out.println(v.isValid("3-598-21507-X"));
    }

}
