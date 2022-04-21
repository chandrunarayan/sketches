public long fibo(long n)
{
  if (n <= 2)
  {
    return 1;
  } else
  {
    return fibo(n-1)+fibo(n-2);
  }
}

long max = 50;
public void setup() {
  for (long i = 1; i <= max; i++) {
    System.out.println("fibo("+i+"):" + fibo(i));
  }
}
