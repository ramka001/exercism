class Triangle {

    def a,b,c

    Triangle(a, b, c) {
        this.a = a
        this.b = b
        this.c = c
    }

    boolean isEquilateral() {
        return a == b && b == c && a != 0.0 && b != 0.0 && c != 0.0
    }

    boolean isIsosceles() {
        if(a==b && b==c && a==c)  {
            return true
        } else if(a!=b && a!=c && b!=c) {
            return false
        } else if(a==b!=c && a>c && b>c) {
            return true
        } else if(b==c!=a && b>a && c>a)  {
            return true
        } else return a == c != b && a>b && c>b
    }

    boolean isScalene() {
        return a != b && b != c && a != c && !(a > b * 2 || a > c * 2) && !(b > a * 2 || b > c * 2) && !(c > b * 2 || c > a * 2)
    }


}
