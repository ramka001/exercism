class Proverb {

    static recite(strings) {
        def builder = new StringBuilder()

        if(strings.isEmpty()) {
            return ''
        } else if(strings.size()==1) {
            return firstResponse(strings)
        } else {
            for(int i=0; i<strings.size()-1; i++) {
                builder.append("For want of a ${strings.get(i)} the ${strings.get(i+1)} was lost.\n")
            }
            return builder.append(firstResponse(strings)).toString()
        }
    }

    static firstResponse(strings) {
        return "And all for the want of a ${strings.first()}."
    }
}