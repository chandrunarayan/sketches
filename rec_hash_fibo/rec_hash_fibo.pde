import java.util.*;
long max = 50;
Hashtable<Long, Long> map = new Hashtable<>();

public void setup() {
  for (int i = 1; i <= max; i++) {
    System.out.println("fibo("+i+"):" + fibo((long)i, map));
  }
}
public long fibo(long n, Hashtable map)
{
  if (n <= 2) {
    return 1;
  } else if (map.get(n) != null) {
    return (long)map.get(n);
    //
  } else {
    long result = fibo(n-1, map)+fibo(n-2, map);
    map.put(n,result);
    return result;
  }
}
