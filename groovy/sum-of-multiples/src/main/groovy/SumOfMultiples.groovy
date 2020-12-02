class SumOfMultiples {

    static int sum(List<Integer> factors, int limit) {
        def sumTotal = new ArrayList<Integer>()
        factors.removeAll { it == 0 }
        if(factors.size()>0) {
            for(int i=1; i<limit; i++) {
                factors.each {
                    if(i%it==0) {
                        sumTotal.add(i)
                    }
                }
            }
            return sumTotal.stream().distinct().reduce(0, Integer::sum)
        } else {
            return 0
        }
    }
}