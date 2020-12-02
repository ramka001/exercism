class ProteinTranslation {

    static proteins(strand) {
        def strandValue = strand.toString()

        if(strandValue.length()==3) {
           defaultValues(strandValue)
        } else {

           def multiList = new ArrayList<String>()
           def strandList = strand.split("(?<=\\G.{3})")

           for(int i=0; i<strandList.size(); i++){
               if(strandList[i] == "UAG" || strandList[i] == "UAA" || strandList[i] == "UGA") {
                   if(i==0 || i > 2) {
                       break
                   } else if(i!=0) {
                      multiList.drop(i)
                   }
               } else {
                   multiList << defaultValues(strandList[i]).get(0)
               }
           }
           return multiList.unique()
        }
    }

    static defaultValues(strand) {

        def strandValue = strand.toString()
        def valueList = new ArrayList<String>()

        if(strandValue == "AUG") {
            valueList << "Methionine"
        } else if(strandValue == "UUU" || strandValue == "UUC") {
            valueList << "Phenylalanine"
        } else if(strandValue == "UUA" || strandValue == "UUG") {
            valueList << "Leucine"
        } else if(strandValue == "UCU" || strandValue == "UCC" || strandValue == "UCA" || strandValue == "UCG") {
            valueList << "Serine"
        } else if(strandValue == "UAU" || strandValue == "UAC") {
            valueList << "Tyrosine"
        } else if(strandValue == "UGG") {
            valueList << "Tryptophan"
        } else if (strandValue == "UGU" || strandValue == "UGC") {
            valueList << "Cysteine"
        } else {
            valueList.clear()
        }

        return valueList
    }
}