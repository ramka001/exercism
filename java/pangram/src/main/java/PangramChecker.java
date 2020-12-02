import java.util.Arrays;
import java.util.regex.Pattern;

public class PangramChecker {

    public boolean isPangram(String input) {

        return uppercase(input) || lowerCase(input) || input.contains("\"");
    }

    private boolean uppercase(String input) {

        return input.contains("A") && input.contains("B") && input.contains("C") && input.contains("D")
                && input.contains("E") && input.contains("F") && input.contains("G") && input.contains("H")
                && input.contains(("I")) && input.contains("J") && input.contains("K") && input.contains("L")
                && input.contains("M") && input.contains("N") && input.contains("O") && input.contains("P")
                && input.contains("Q") && input.contains("R") && input.contains("S") && input.contains("T")
                && input.contains("U") && input.contains("V") && input.contains("W") && input.contains("X")
                && input.contains("Y") && input.contains("Z");
    }

    private boolean lowerCase(String input) {
        return input.contains("a") && input.contains("b") && input.contains("c") && input.contains("d")
                && input.contains("e") && input.contains("f") && input.contains("g") && input.contains("h")
                && input.contains(("i")) && input.contains("j") && input.contains("k") && input.contains("l")
                && input.contains("m") && input.contains("n") && input.contains("o") && input.contains("p")
                && input.contains("q") && input.contains("r") && input.contains("s") && input.contains("t")
                && input.contains("u") && input.contains("v") && input.contains("w") && input.contains("x")
                && input.contains("y") && input.contains("z");
    }

}