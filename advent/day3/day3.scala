object DrunkSanta {

  def main(args: Array[String]){
    val directions = io.Source.fromFile(args(0)).mkString.split("")
    val changes = directions.map( x => coordChange(x) )
    val visits = changes.foldLeft(Array((0,0))){ (visited, move) =>
      val previous = visited.last
      val next = ( previous._1 + move._1, previous._2 + move._2 )
      visited :+ next
    }
    println(visits.distinct.length)
  }

  def coordChange(instruction: String): (Int, Int) = {
    instruction match {
      case ">" => (1,0)
      case "<" => (-1,0)
      case "^" => (0,1)
      case "v" => (0,-1)
    }
  }

}