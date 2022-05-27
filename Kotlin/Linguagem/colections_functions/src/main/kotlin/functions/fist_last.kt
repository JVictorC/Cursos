fun main() {
    val data = generateData()

    println(data)

    println("First ${data.first {
        it.nome == "Omelete"
    }}")

    println("Last ${data.last()}")
}