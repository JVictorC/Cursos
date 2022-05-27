fun main() {
    // Array nos Kotlin List, nao pode ser modificada
    // List Of nao pode ser Modificado
    val list: List<Int> = listOf(1,2,3,4,5)
    val mutableList: MutableList<Int> = mutableListOf(1,2,3,4,5)

    mutableList.add(5)
    mutableList.add(6)

    mutableList.remove(3)

    mutableList.map {
        println(it)
    }

    println("------------------------------------")

    list.map {
        println(it)
    }
    println(mutableList.size)
    println(mutableList.contains(3))
    println(mutableList.contains(1))
    println(mutableList)
}