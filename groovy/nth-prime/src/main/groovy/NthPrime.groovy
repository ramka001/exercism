class NthPrime {

    static nth(int n) {

        if(n==0) {
            throw new ArithmeticException()
        }

        def maxCheck
        def isPrime
        def primeList = []

        if(n >= 1 && n < 10) {
            maxCheck = n + 25
        } else if(n>=10 && n <20) {
            maxCheck = n + 50
        } else if(n >= 100 && n < 10000) {
            maxCheck = n + 1000
        } else if(n >= 10000 ) {
            maxCheck = n + 100000
        }


        for (int i = 2; i <= maxCheck; i++) {
            isPrime = checkPrime(i)
            if(isPrime) {
                primeList.add(i)
            }
        }

        return primeList[n-1]

    }

    static boolean checkPrime(int numberToCheck) {
        for (int i = 2; i <= numberToCheck / 2; i++) {
                if(numberToCheck % i == 0) {
                    return false
                }
        }
        return true
    }
}