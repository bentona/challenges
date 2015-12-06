object Parens{

  def main(args: Array[String]){
    val input = io.Source.fromFile(args(0)).mkString
    val intList = input.split("").map (n => n match {
      case "(" => 1
      case ")" => -1
      case _ => 0
    })

    println(floorMap(intList).indexOf(-1))
  }

  def total(intList: Array[Int]) : Int  = {
    intList.sum
  }

  def floorMap(intList: Array[Int]) : Array[Int] = {
    intList.foldLeft(Array(0)){ (floors, n) =>
      floors :+ (n + floors.last)
    }
  }

}

