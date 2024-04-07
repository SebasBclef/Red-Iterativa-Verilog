//Proyecto Final de Digitales,C01263,B82600,B86941.Implementacion Estructural, caso DERECHA a IZQUIERDA.
`include "celda_inicial_e.v"
`include "celda_tipica_e.v"
`include "celda_final_e.v"
`include "Comp_AND.v"
`include "Comp_OR.v"
`include "inversor.v"
//Como es implementacion estructural, se llaman los archivos de las compuertas logicas, junto las celdas tipicas.
module Comparador #(parameter N = 1)(
    input wire [N-1:0] A, //definiendo los tamanos de A, B y W
    input wire [N-1:0] B,
    output wire  W_out);
    wire [N:0] W_temp;

    celda_inicial_e uut_inicial(
        .A(A[0]),               //Conectamos todos los puertos a los bits iniciales
        .B(B[0]),
        .W(W_temp[0])
    );
    genvar i;
    generate
        for (i = 0; i < N; i=i +1 ) begin: gen_celdas //Bucle For para generar las celdas tipicas en base al parametro N.
                                                        //i=0 inicia el bucle en 0, i<N es la condicion que debe cumplir, i=i+1 
                                                        //significa que despues de cada iteracion a i se le suma 1.
                                                        //begin: gen_celdas significa que se comienza un bloque de nombre gen_celdas.
        //codigo para instanciar la celda tipica
        celda_tipica_e uut_tipica(
            .A(A[i]), //el bit i de A se conecta al puerto A, en este caso, se hace asi para que a cada celda tipica le quede un bit,
            .B(B[i]),
            .w(W_temp[i]), //el bit i-1 se conecta a w
            .W(W_temp[i+1])//el bit i+1 de Y se conecta al puerto Y.
        );          
        end
    endgenerate 
    celda_final_e uut_final_e( //Ya que la celda final es diferente para este diseno, conectamos los puertos A,B y W al bit numero 'N' 
    .W(W_temp[N]),
    .Z(Z));
    assign W_out =  Z;//Misma logica para Z.
endmodule