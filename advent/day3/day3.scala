object DrunkSanta {

  def main(args: Array[String]){
    val directions = io.Source.fromFile(args(0)).mkString.split("")
    val changes = directions.map( x => coordChange(x) )
    val splitChanges = changes.grouped(2).toList
    val origSantaChanges = splitChanges.map(x => x(0))
    val roboSantaChanges = splitChanges.map(x => x(1))

    val allVisits = Array(origSantaChanges, roboSantaChanges).map( changes => visits(changes) )
    println(allVisits.flatten.distinct.length)
  }

  def visits(changes: List[(Int,Int)]): Array[(Int, Int)] = {
    changes.foldLeft( Array((0,0)) ){ (visited, move) =>
      val previous = visited.last
      val next = ( previous._1 + move._1, previous._2 + move._2 )
      visited :+ next
    }
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