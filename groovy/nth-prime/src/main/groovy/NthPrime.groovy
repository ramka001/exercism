class NthPrime {

    static nth(int n) {

        if(n==0) {
            throw new ArithmeticException()
        }

        findNthPrime(n)
    }

    private static int findNthPrime(int n) {
        def count = 0, num = 1, i, output=0

        while(count < n){

            num=num+1

            for (i = 2; i <= num; i++){
                if (num % i==0) {
                    break
                }
            }
            if (i == num){
                count = count + 1
            }

            output = i
        }
        return output
    }
}