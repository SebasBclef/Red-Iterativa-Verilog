// Implementacion estructural de la celda inicial  de derecha a izquierda
// Entradas A y B con una salida W
module celda_inicial_e (
    input wire A,
    input wire B,
    output wire W
);

// Cables para conectar a las compuertas
wire B_neg;

// INVERSOR PARA GENERAR !B
inversor inversorB (
    .entrada(B),
    .salida(B_neg)
);

// COMPUERTA AND con entrada A y !B y una salida W
Comp_AND comp_AND_ci (
    .A_and(A),
    .B_and(B_neg),
    .AND(W)
);
endmodule