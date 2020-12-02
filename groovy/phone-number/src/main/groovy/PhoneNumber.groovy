class PhoneNumber {
    static String clean(String input) {
        def output = input.replaceAll("[^0-9]", "")

        if(output.length()==10 && !(output.startsWith("0")) && !(output.startsWith("1")) &&
           !(output.charAt(3).toString()=="0") && !(output.charAt(3).toString()=="1")) {
            return output
        } else if(output.length()==11 && output.startsWith("1") && !(output.charAt(1).toString()=="0") &&
                  !(output.charAt(1).toString()=="1") && !(output.charAt(4).toString()=="0") &&
                  !(output.charAt(4).toString()=="1")) {
                return output.substring(1)
        } else if(output.length()<10 || output.length()>11 || input.contains("@") ||
                input.contains("!") || input.contains(":") ||  input.contains(["A-Za-z"])) {
            throw new Exception()
        } else {
            throw new Exception()
        }
    }
}
