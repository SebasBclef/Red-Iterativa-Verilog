//Implementacion Conductual para las funciones X y Y, de Der a Izquierda
module celda_inicial_c(
    input wire  A,
    input wire  B,
    input reset,
    output wire X,
    output wire Y
); 
//Declaracion de variables para conectarlas al modulo, (A,B,x,y) son las entradas y (X,Y) son las salidas.
    assign X = A & ~B;
    assign Y = ~A & B;
//X corresponde a la funcion obtenida a mano resolviendo la red iterativa, X = (A')*B y Y = 0 
endmodule