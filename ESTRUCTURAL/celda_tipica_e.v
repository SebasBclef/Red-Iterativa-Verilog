// Implementacion estructural de la celda tipica  de derecha a izquierda
// Entradas A, B y w con una salida W
module celda_tipica_e (
    input wire A, B, w,
    output wire W
);

// Cables para conectar a las compuertas
wire B_neg;
wire wB_neg_OR;
wire wA_OR;
wire AB_neg_OR;
wire OR1;

// INVERSOR PARA GENERAR !B
inversor inversorB (
    .entrada(B),
    .salida(B_neg)
);

// COMPUERTAS AND 
//Con entrada w y !B y una salida w!B que va hacia la compuerta OR 1
Comp_AND comp_AND_ct1 (
    .A_and(w),
    .B_and(B_neg),
    .AND(wB_neg_OR)
);
//Con entrada w y A y una salida wA que va hacia la compuerta OR 1
Comp_AND comp_AND_ct2 (
    .A_and(w),
    .B_and(A),
    .AND(wA_OR)
);
//Con entrada A y !B y una salida A!B que va hacia la compuerta OR 2
Comp_AND comp_AND_ct3 (
    .A_and(A),
    .B_and(B_neg),
    .AND(AB_neg_OR)
);
 // COMPUERTAS OR
 //Con entrada w!B y wA y una salida OR1 que va hacia la compuerta OR 2
 Comp_OR comp_OR_ct1 (
   .A_or (wB_neg_OR),
   .B_or (wA_OR),
   .OR (OR1)
 );
 //Con entrada OR1 y A!B y una salida W
 Comp_OR comp_OR_ct2 (
   .A_or (OR1),
   .B_or (AB_neg_OR),
   .OR (W)
 );
endmodule