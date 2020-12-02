import java.util.ArrayList;
import java.util.List;

class ArmstrongNumbers {


	boolean isArmstrongNumber(int numberToCheck) {

	  int[] numbers = createArrayFromNumber(numberToCheck);

      List<Integer> list = new ArrayList<>();

      int length = numbers.length;

      for (int number : numbers) {
           int output = (int) Math.pow(number,length);
           list.add(output);
      }

      return numberToCheck == sumList(list);
    }

    private int sumList(List<Integer> list) {
        int sum = 0;

        for (int i : list) {
            sum = sum + i;
        }
        return sum;
    }

    private int[] createArrayFromNumber(int number) {
        String str = (Integer.valueOf(number)).toString();

        char[] chArr = str.toCharArray();

        int[] arr = new int[chArr.length];

        for (int i = 0; i< chArr.length; i++) {
            arr[i] = Character.getNumericValue(chArr[i]);
        }
        return arr;
    }

}