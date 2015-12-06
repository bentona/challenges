object WrappingPaper{

  def main(args: Array[String]){
    val presents = io.Source.fromFile(args(0)).mkString.split("\n")
    val dimList = presents.map(x => x.split('x').map(_.toInt).sorted)
    println(dimList.map( p => ribbonCost(p)).sum)
  }

  def wrappingCost(d: Array[Int]) : Int  = {
    (d(0) * d(1) * 3) + (d(1) * d(2) * 2) + (d(0) * d(2) * 2)
  }

  def ribbonCost(d: Array[Int]) : Int = {
    (d(0) + d(1)) * 2 + presentVolume(d)
  }

  def presentVolume(d: Array[Int]) : Int = {
    d.foldLeft(1){ _*_ }
  }

}

