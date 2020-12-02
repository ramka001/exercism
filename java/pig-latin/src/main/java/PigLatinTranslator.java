class PigLatinTranslator {

    String translate(String input) {

        StringBuilder builder = new StringBuilder();

        if(input.contains(" ")) {
            String[] words = input.split("\\W+");
            String str = "";
            for (String word : words) {
                str = builder.append(process(word)).append(" ").toString();
            }
            return str.trim();
        } else return process(input);
    }

    private String process(String input) {
        char[] vowels = "aeiou".toCharArray();
        char[] consonants = "bcdfghjklmnpqrstvwxyz".toCharArray();

        StringBuilder builder = new StringBuilder();

        for(char c: vowels) {
            if(input.toLowerCase().startsWith(String.valueOf(c))) {
                builder.append(input).append("ay");
            }
        }

        if(input.length() == 2) {
            builder.append(input,1,2).append(input,0,1).append("ay");
        } else  {
            if(input.toLowerCase().startsWith("squ") || input.toLowerCase().startsWith("thr")
                    || input.toLowerCase().startsWith("sch")) {
                builder.append(input.substring(3)).append(input, 0, 3).append("ay");

            } else if(input.toLowerCase().startsWith("rh") || input.toLowerCase().startsWith("ch")
                    || input.toLowerCase().startsWith("qu")  || input.toLowerCase().startsWith("th") ) {
                builder.append(input.substring(2)).append(input, 0, 2).append("ay");
            } else if(input.toLowerCase().startsWith("ytt") || input.toLowerCase().startsWith("xr")) {
                builder.append(input).append("ay");
            } else {
                for(char c: consonants) {
                    if(input.toLowerCase().startsWith(String.valueOf(c))) {
                        builder.append(input.substring(1)).append(input, 0, 1).append("ay");
                    }
                }
            }
        }
        return builder.toString();
    }
}