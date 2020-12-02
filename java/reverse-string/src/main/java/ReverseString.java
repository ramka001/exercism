class ReverseString {

    String reverse(String inputString) {

        StringBuilder builder = new StringBuilder();

        for(Character c : inputString.toCharArray()) {
            builder.append(c);
        }

       return builder.reverse().toString();
    }
  
}