fun main() {
    // Igual Map em Dart, Chave e Valor
    // mapOf<Key, Value>
    // Pair ira substituir o {} do dart e javaScript

    val map = mapOf<String, String>(
        Pair("Franca", "Paris"),
        Pair("Alemanha", "Berlim")
    )
    val map2 = mutableMapOf<String, String>()

    println(map)

    map.map {
        println(it)
    }


    // Adicao so funciona no mutable com a sintaxe parecida do JS e DART
    map2["Brasil"] = "Brasilia"

    println(map2)


}

