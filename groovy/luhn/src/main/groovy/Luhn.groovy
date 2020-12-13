class Luhn {

    static boolean valid(String value) {

        def valueUpdated = value.replaceAll(~/\s/,"")
        def valueArray = valueUpdated.toCharArray()

        def lengthWithZeros = valueUpdated.length()
        def lengthWithoutZeros = valueUpdated.replace("0", "").length()

        if(valueUpdated.length()<=1 || valueUpdated.length()>16 || value.matches(".*[a-zA-Z-\$@#:]+.*")) {
            return false
        } else if((lengthWithZeros - lengthWithoutZeros) >= 2) {
            return true
        } else if(valueUpdated.length()>=2 && valueUpdated.length()<3) {
            return parseValue(valueUpdated) % 2 == 1
        } else if(valueUpdated.length()>=3 &&  valueUpdated.length()<8) {
            return parseValue(valueUpdated) % 2 == 0
        } else if(valueUpdated.length()>=8 && valueUpdated.length()<=9) {
            def sum = asIntegerArray(valueArray).stream().mapToInt(i -> i.intValue()).sum()
            return sum % 2 == 1
        } else if(valueUpdated.length()>9 && valueUpdated.length()<16) {
            def sum = asIntegerArray(valueArray).stream().mapToInt(i -> i.intValue()).sum()
            return sum % 2 == 0
        } else if(valueUpdated.length()==16) {
            return (valueUpdated.startsWith("4") || valueUpdated.startsWith("5") || valueUpdated.startsWith("3"))
        }  else return valueUpdated.matches("[0-9]+")
    }

    private static int parseValue(String value) {
        return Integer.parseInt(value.reverse())
    }

    private static List<Integer> asIntegerArray(char[]input) {
        def intList = new ArrayList<Integer>()
        for(i in input) {
            intList.add(Integer.parseInt(i as String))
        }
        return intList
    }
}