class RnaTranscription {

    String transcribe(String dnaStrand) {
        if (dnaStrand.length() > 1) {
            return multiConversion(dnaStrand);
        } else {
            return conversion(dnaStrand);
        }
    }

    private String conversion(String dnaStrand) {
        switch (dnaStrand) {
            case "A": return "U";
            case "C": return "G";
            case "G": return "C";
            case "T": return "A";
        }
        return dnaStrand;
    }

    private String multiConversion(String dnaStrand) {
        String output = null;
        if(dnaStrand.contains("A") || dnaStrand.contains("T") || dnaStrand.contains("C") || dnaStrand.contains("G")) {
            output = dnaStrand.replace("A","U")
                    .replace("T","A")
                    .replace("C","X")
                    .replace("G", "C")
                    .replace("X","G");
        }
        return output;
    }

}
