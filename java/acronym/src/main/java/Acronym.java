import java.util.ArrayList;
import java.util.List;

class Acronym {


    private String phrase;

    Acronym(String phrase) {
        this.phrase = phrase;
    }

    String get() {
        return  String.join("", extract(phrase)).toUpperCase();
    }

    private List<String> extract(String phrase) {

        List<String> valueList = new ArrayList<>();

        if(phrase.contains("-")) {
            String updated = phrase.replace("-", " ");
           for(String s : updated.split("\\s")) {
               String val = String.valueOf(s.charAt(0));
               valueList.add(val);
           }

        } else {
            for(String s : phrase.split("\\s" )) {
                String val = String.valueOf(s.charAt(0));
                valueList.add(val);
            }
        }

        return valueList;
    }

}
