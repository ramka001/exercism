class Series {

    static slices(series, sliceLength) {

        if(sliceLength==0 || series.length() < sliceLength || sliceLength < 0 ) {
            throw new ArithmeticException()
        } else {

            def input = series.toList()
            def filter = new ArrayList<List<String>>()
            def output = new ArrayList<String>()

            for(int i=0; i<input.size(); i++) {
                if(i+sliceLength>input.size()) {
                    break
                } else {
                    filter << input.subList(i,i+sliceLength)
                }
            }
            filter.each {
               output << it.join("")
            }
            return output
        }
    }
}