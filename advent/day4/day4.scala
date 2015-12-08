import java.security.MessageDigest

object AdventCoins{

  def main(args: Array[String]){
    var n = 1

    while(! isCoin(md5(s"${args(0)}$n"))){
      n = n + 1
    }

    println(n)
  }

  def md5(s: String): String = {
    val result = MessageDigest.getInstance("MD5").digest(s.getBytes)
    result.map("%02x".format(_)).mkString
  }

  def isCoin(hash: String): Boolean = {
    println(s"checking: $hash")
    hash.substring(0,6) == "000000"
  }

}

