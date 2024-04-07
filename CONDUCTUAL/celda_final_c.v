//Implementacion Conductual para las funciones X y Y, de Izq a Derecha
module celda_final_c(
    input wire  X,
    input wire  Y,
    input wire A,
    input wire B,
    input reset,
    output wire Z,
    output wire Z_out
); 
//Declaracion de variables para conectarlas al modulo, (x,y) son las entradas y (Z) son las salidas.
    assign Z =  ~X;
    assign Z_out= Z;
//X corresponde a la funcion obtenida a mano resolviendo la red iterativa, Z = (y')() y x = 0. 
//Ademas, la senal Z_out es la que vamos a considerar como 'Z disparada en bajo'
endmodule

