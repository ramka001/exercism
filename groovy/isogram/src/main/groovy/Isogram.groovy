class Isogram {

    static boolean isIsogram(String phrase) {

        def list = phrase.toLowerCase().toCharArray()

        def hm = new HashMap<Character, Integer>()

        list.findAll {
            def j = hm.get(it)
            hm.put(it, (j == null) ? 1 : j + 1)
        }

        if (hm.size() == 0) {
            return true
        } else  {
            return hm.entrySet()
                     .stream().filter(e -> e.value > 1 && String.valueOf(e.key).matches("^[a-z_-s]+\$") )
                     .findAll().size() == 0
        }

    }
}