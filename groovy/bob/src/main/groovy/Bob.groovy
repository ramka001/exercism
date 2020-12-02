class Bob {

    static response(input) {
        def input2 = input.trim()

        if(blanks(input2) == "") {
            return "Fine. Be that way!"
        }  else if(hasUpperCase(input2) && !endsWithQuestionSymbol(input2) && !endsWithNumber(input2) ) {
            return "Whoa, chill out!"
        } else if(!hasUpperCase(input2)  && endsWithQuestionSymbol(input2) && hasCapitalFirst(input2)
                  || endsWithQuestionSymbol(input2) && !hasCapitalFirst(input2)) {
            return "Sure."
        } else if(hasUpperCase(input2) && endsWithQuestionSymbol(input2)) {
            return "Calm down, I know what I'm doing!"
        } else if(hasOption1(input2) || hasOption2(input2) || hasOption3(input2) || hasOption4(input2)
                 || hasOption5(input2) || containsMultiLine(input2) || expression(input2)) {
            return "Whatever."
        }
    }

    static def blanks(input) {
       return input.toString().trim()
    }

    static def containsMultiLine(input) {
        return input.toString().contains("\n")
    }

    static def expression(input) {
        return input.toString().contains("mmm")
    }

    static def hasExclamation(input) {
        return input.toString().contains("!")
    }

    static def endsWithExclamation(input) {
        return input.toString().endsWith("!")
    }

    static def hasQuestion(input) {
        return input.toString().contains("?")
    }

    static def endsWithQuestionSymbol(input) {
        return input.toString().endsWith("?")
    }

    static def hasCapitalFirst(input) {
        return Character.isUpperCase(input.toString().codePointAt(0))
    }

    static def hasUpperCase(input) {
        def upperCase = input.toString().toUpperCase()
        return input.toString().contains(upperCase)
    }

    static def endsWithNumber(input) {
        return  Character.isDigit(input.toString().charAt(input.toString().length()-1))
    }

    static def hasOption1(input) {
        return (hasCapitalFirst(input) && endsWithExclamation(input))
    }

    static def hasOption2(input) {
        return (endsWithExclamation(input) && !hasUpperCase(input))
    }

    static def hasOption3(input) {

        return (hasCapitalFirst(input) && !hasExclamation(input))
    }

    static def hasOption4(input) {
         return endsWithNumber(input) && !hasExclamation(input)
    }

    static def hasOption5(input) {
        return (hasCapitalFirst(input) && hasQuestion(input))
    }
}