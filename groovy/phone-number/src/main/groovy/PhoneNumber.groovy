class PhoneNumber {
    static String clean(String input) {
        def output = input.replaceAll("[^0-9]", "")
        def number0 = Integer.parseInt(output.charAt(0) as String)
        def number1 = Integer.parseInt(output.charAt(1) as String)
        def number3 = Integer.parseInt(output.charAt(3) as String)
        def number4 = Integer.parseInt(output.charAt(4) as String)

        if(output.length()==10 &&  number0 > 1 && number3 > 1) {
            return output
        } else if(output.length()==11 && output.startsWith("1") && number1 > 1 && number4 > 1) {
            return output.substring(1)
        } else if(output.length()<10 || output.length()>11 || input.matches(["A-Za-z@!:"])) {
            throw new Exception()
        } else {
            throw new Exception()
        }
    }
}
