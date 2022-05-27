fun main() {
    // Lambdas e uma funcao anonima sem nome que pode ser passada por parametros
    // Parametros -> Corpo
    // Ultima linha do lambda e o returno


    val a = { println("Hello") }

    a()

    val b = { x: Int -> x * x }

    println(b(10))

    // Quando vemos essa estrutura e que estou passando uma funcao por apramentro

    receiveA {
        println("teste")
    }

    receveiB { 5 }

}
// () -> Unit : Recebe Uma func por parametro
fun receiveA(lambda: () -> Unit ) {
    lambda()
}

fun receveiB(lambda: () -> Int) {
    println(lambda())
}