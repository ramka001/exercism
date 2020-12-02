import java.util.ArrayList;
import java.util.List;

class IsogramChecker {

    boolean isIsogram(String phrase) {
        return check(phrase);
    }

    private boolean check(String phrase) {
        List<Character> characterList = new ArrayList<>();

        char[] val = phrase.toCharArray();
        for (int i = 0; i < phrase.length(); i++)
            for (int j = i + 1; j < phrase.length(); j++)
                if ( (Character.toLowerCase(val[i]) == Character.toLowerCase(val[j])) && !Character.isSpaceChar(val[i]) && val[i] != '-' ) characterList.add(val[i]);

        return (characterList.size() == 0);
    }

}
