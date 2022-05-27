fun main() {
    val data = generateData()

    println(
        data.filter {
            it.nome.contains('H')
        }
    )

    println(
        data.filter { it.nome.contains('H') }.size
    )
}