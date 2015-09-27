object Multiples {
	def main(args: Array[String]) {
		println(sum(selectMultiples(1 to 999 toSeq)))
	}
	
	def selectMultiples(args: Seq[Int]): Seq[Int] = args.filter((n: Int) => n % 3 == 0 || n % 5 == 0)

	def sum(args: Seq[Int]): Int = args.reduce((acc, n) => acc + n)
}
