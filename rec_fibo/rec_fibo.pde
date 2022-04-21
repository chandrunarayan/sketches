public int fibo(int n)
{
  if (n <= 2)
  {
    return 1;
  } else
  {
    return fibo(n-1)+fibo(n-2);
  }
}

int max = 10;
public void setup() {
  for (int i = 1; i <= max; i++) {
    System.out.println("fibo("+i+"):" + fibo(i));
  }
}
