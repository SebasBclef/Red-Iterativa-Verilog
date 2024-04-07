// Implementacion estructural de la celda final  de derecha a izquierda
// Entrada W que es la entrada de la celda tipica y con una salida de Z
module celda_final_e (
    input wire W,
    input wire A,
    input wire B,
    output wire Z
);

// Cable para conectar a la compuerta 
wire W_neg;

// INVERSOR PARA GENERAR !W que al final se obitne Z=!W
inversor inversorW_cf (
    .entrada(W),
    .salida(Z)
 );
endmodule