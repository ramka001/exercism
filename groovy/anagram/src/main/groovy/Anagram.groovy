class Anagram {

    def charList = new ArrayList<Character>()
    def subject = ""

    Anagram(subject) {
        this.subject = subject
        def subChars = subject.toString().toLowerCase().toCharArray()

        subChars.each {
            charList.add(it)
        }
    }

    def find(candidates) {

        def listString = new ArrayList<String>()

        candidates.each {
            def candidateList = it.toLowerCase().toCharArray().toList()

            if ( (it.toLowerCase() != this.subject.toLowerCase() ) && ( candidateList.sort() == charList.sort() ) ) {
                 listString.add(it)
            }
        }
        return listString
    }
}