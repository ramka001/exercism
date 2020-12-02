class NucleotideCount {

    static count(strand) {
        def occurrenceMap = new HashMap<String,Long>()

        if(strand.matches("[ACGT]+") || strand=="") {
            long totalA  = strand.chars().filter(ch -> ch == 'A').count()
            occurrenceMap.put("A",totalA)

            long totalC  = strand.chars().filter(ch -> ch == 'C').count()
            occurrenceMap.put("C",totalC)

            long totalG  = strand.chars().filter(ch -> ch == 'G').count()
            occurrenceMap.put("G",totalG)

            long totalT  = strand.chars().filter(ch -> ch == 'T').count()
            occurrenceMap.put("T",totalT)

            return occurrenceMap

        } else {
            throw new Exception()
        }
    }
}