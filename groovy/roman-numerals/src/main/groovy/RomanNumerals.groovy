class RomanNumerals {

    RomanNumerals() {
        Integer.metaClass.getRoman = {  ->
            convert(delegate as Integer)
        }
    }

    static convert(Integer itr) {
        def output = ""

        if(itr>=1 && itr<4) {
            output = String.join("", Collections.nCopies(itr, "I"))
        } else if(itr==4) {
            output = "IV"
        }  else if(itr>=5 && itr <9) {
            output = String.join("", Collections.nCopies(itr/5 as Integer, "V")) + convert(itr%5)
        } else if(itr == 9) {
            output = "IX"
        } else if(itr >= 10 && itr < 40) {
            output = String.join("", Collections.nCopies(itr/10 as Integer , "X"))  + convert(itr%10)
        } else if(itr>=40 && itr<50) {
            output = String.join("", Collections.nCopies(itr/40 as Integer , "XL")) + convert(itr%40)
        } else if(itr>=50 && itr<90) {
            output = String.join("", Collections.nCopies(itr/50 as Integer , "L"))  + convert(itr%50)
        } else if(itr>=90 && itr<100) {
            output = String.join("", Collections.nCopies(itr/90 as Integer , "XC"))  + convert(itr%90)
        } else if(itr>=100 && itr<400) {
            output = String.join("", Collections.nCopies(itr/100 as Integer , "C"))  + convert(itr%100)
        } else if(itr>=400 && itr<500) {
            output = String.join("", Collections.nCopies(itr/400 as Integer , "CD"))  + convert(itr%400)
        } else if(itr>=500 && itr<900) {
            output = String.join("", Collections.nCopies(itr/500 as Integer , "D"))  + convert(itr%500)
        } else if(itr>=900 && itr<1000) {
            output = String.join("", Collections.nCopies(itr/900 as Integer , "CM"))  + convert(itr%900)
        } else if(itr>=1000 && itr<4000) {
            output = String.join("", Collections.nCopies(itr/1000 as Integer , "M"))  + convert(itr%1000)
        }
        return output
    }
}
