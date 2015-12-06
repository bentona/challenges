object EvenFib {
  def main(args: Array[String]) = {
    var max:Int = 1
    var current:Int = 1
    Iterator.continually{
      max = max + 1
      current = fibn(max)
    }.takeWhile(current < 4000000)
  }

  def fibn(n: Int): Int = n match{
    case 1 | 2 => 1
    case n:Int => fibn(n - 1) + fibn(n - 2)
  }

}
