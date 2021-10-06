

namespace Geometria {
   export namespace Area {

        const PI = 3.14
    
        export function Circuferencia (raio: number): number{
            return PI * Math.pow(raio, 2)
        }
        
        export function Retangulo (base:number, altura: number): number {
            return base * altura
        }
    
    }
}



// const PI = 2.99
// console.log(PI);


console.log(Geometria.Area.Circuferencia(10));
console.log(Geometria.Area.Retangulo(10, 20)); 
