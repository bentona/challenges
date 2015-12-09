object NiceWords{

  def main(args: Array[String]){
    val input = io.Source.fromFile(args(0)).mkString
    val len = input.split("\n").filter(isValid _).length
    println(len)
  }

  def isValid(s: String): Boolean = {
    doubleChar(s) && threeVowel(s) && notBanned(s)
  }

  def doubleChar(s: String): Boolean = {
    val regexp = """([a-z])\1{1}""".r
    regexp.findFirstIn(s).isDefined
  }

  def threeVowel(s: String): Boolean = {
    val regexp = """.*[aeiou].*[aeiou].*[aeiou].*""".r
    regexp.findFirstIn(s).isDefined
  }

  def notBanned(s: String): Boolean = {
    val regexp = """(ab|cd|pq|xy)""".r
    !regexp.findFirstIn(s).isDefined
  }

}