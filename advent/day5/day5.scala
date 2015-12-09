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
    checkRegexp(s, regexp)
  }

  def threeVowel(s: String): Boolean = {
    val regexp = """.*[aeiou].*[aeiou].*[aeiou].*""".r
    checkRegexp(s, regexp)
  }

  def notBanned(s: String): Boolean = {
    val regexp = """(ab|cd|pq|xy)""".r
    !checkRegexp(s, regexp)
  }

  def checkRegexp(s: String, regexp: scala.util.matching.Regex): Boolean = {
    regexp findFirstIn s match {
      case Some(_) => true
      case _ => false
    }
  }


}