"use strict";
var Geometria;
(function (Geometria) {
    let Area;
    (function (Area) {
        const PI = 3.14;
        function Circuferencia(raio) {
            return PI * Math.pow(raio, 2);
        }
        Area.Circuferencia = Circuferencia;
        function Retangulo(base, altura) {
            return base * altura;
        }
        Area.Retangulo = Retangulo;
    })(Area = Geometria.Area || (Geometria.Area = {}));
})(Geometria || (Geometria = {}));
// const PI = 2.99
// console.log(PI);
console.log(Geometria.Area.Circuferencia(10));
console.log(Geometria.Area.Retangulo(10, 20));
//# sourceMappingURL=namespaces.js.map