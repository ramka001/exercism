class Hamming {

    def distance(strand1, strand2) {
        def s1 = strand1.toString().toCharArray()
        def s2 = strand2.toString().toCharArray()

        if(s1.length !=s2.length) {
            throw new ArithmeticException()
        } else {
            def dif = new ArrayList<String>()

            for(int i = 0; i<s1.length; i++) {
                if(s1[i] != s2[i]) {
                    dif += s1[i]
                }
            }
            return dif.size()
        }
    }
}