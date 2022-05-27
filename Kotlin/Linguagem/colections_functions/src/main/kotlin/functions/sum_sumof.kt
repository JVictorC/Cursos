fun main() {
    val data = generateData()


    // Sum so funciona com Numeros: Double, Float e Int
    println(
        listOf(1, 23, 45).sum()
    )


    // SumOf funciona com qualquer dado Numerico dentro de uma lista

    println(
        data.sumOf {
            it.ingredientes.size
        }
    )

    println(
        data.sumOf {
            it.calorias
        }
    )

}