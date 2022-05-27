fun main() {
    // Igual Set Em Python, parecido com um Array, porem com valores unicos, sem repeticoes
    // Mutable ou nao segue Regra de listOf e mutableListOf
    val set1: Set<String> = setOf<String>("Paris", "Berlim", "Madrid", "Madrid")
    val set2: MutableSet<String> = mutableSetOf<String>()


    set2.add("Sao Paulo")
    set2.remove("Sao Paulo")

    set2.contains("Sao Paulo")

    // Nao existe set2[index]
    // RemoveAt
    // Set e somente um Conjunto diferente de List, que e um conjunto ordenado
}