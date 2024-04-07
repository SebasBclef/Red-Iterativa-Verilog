//Implementacion Conductual para las funciones X y Y, de Izq a Derecha
module celda_tipica_c
(
    input wire  A, //implementacion de las entradas A,B,x,y y una senal reset, que va ser necesaria para inducir retardos y reiniciar la senal 
                   // entre prueba y prueba.
    input wire  B,
    input wire x,
    input wire y,
    input reset,
    output wire X,//Implementacion de las salidas X y Y.
    output wire Y
); 
//Declaracion de variables para conectarlas al modulo, (A,B,x,y) son las entradas y (X,Y) son las salidas.
    assign X =  x | (~y & A & ~B);
    assign Y = y | (~X &  ~A & B ); 
//X corresponde a la funcion obtenida a mano resolviendo la red iterativa, X = x+(y')*(A)*(B') y Y = y+(x')*(A')*(B) 
endmodule