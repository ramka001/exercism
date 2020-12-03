class Luhn {

    static boolean valid(String value) {
        if(value.length()<=1) {
            return false
        } else if(value.length()>1 && value.length()<=3) {
            if(value.startsWith("0")) {
                return Integer.parseInt(value.reverse()) % 10 == 0
            } else if(value.length()==2) {
                return Integer.parseInt(value.reverse()) % 10 != 0
            }
        } else if(value.length()>3) {
        }
    }

}
