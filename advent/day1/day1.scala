object Parens{

	def main(args: Array[String]){
		val input = io.Source.fromFile(args(0)).mkString
		val floorDiff = input.split("").foldLeft(0) { (total, p) =>
			val offset = p match {
				case "(" => 1
				case ")" => -1
				case _ => 0
			}
			total + offset
		}
		println(floorDiff)
	}

}
