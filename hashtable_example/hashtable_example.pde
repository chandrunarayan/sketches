import java.util.*;
Hashtable<String, Integer> map = new Hashtable<>();
int n = 0;
void setup() {
  map.put("kaito", n++);
  map.put("miguel", n++);
  map.put("grace", n++);
  map.put("noah", n++);
  map.put("ethan", n++);
  map.put("luke", n++);
  map.put("tully", n++);
  //map.put("chandru", n++);
  
  System.out.println(map);
  System.out.println(map.get("ethan"));
  System.out.println(map.get("chandru"));
}
