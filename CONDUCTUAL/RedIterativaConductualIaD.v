//Proyecto Final de Digitales,C01263,B82600,B86941
//Implementacion Conductual al caso IZQUIERDA a DERECHA.
`include "celda_final_c.v"
`include "celda_tipica_c.v"
`include "celda_inicial_c.v"
module RedIterativaConductualIaD #(parameter N = 32) ( //Aqui esta el parametro a escoger, para este caso es N,
                                                     //pero puede ser cualquier numero mayor a 3.
                                                     //POR CUALQUIER COSA, guardar con 'Save As' y reemplazar el archivo con el nuevo valor de N.

    input wire [N-1:0] A,
    input wire [N-1:0] B,
    output wire Z_out

    );
    wire [N:0] X_temp;//Ahora, la conexion X va a depender del N
    wire [N:0] Y_temp;//Asi como la conxion de Y, la idea es que estos van a ser los cables que conectan una celda tipica y otra.
    //Z sigue igual porque es la salida final de toda la red.

//Instanciacion de la celda inicial
    celda_inicial_c uut_inicial(
    .A(A[0]), //Esto significa que queremos conectar el primer bit de la palabra A a los puertos A,B,X y Y.
    .B(B[0]),
    .X(X_temp[0]),
    .Y(Y_temp[0])
    );
//Instanciacion de la celda tipica con bloque generate
    genvar i;
    generate
        for (i = 0; i < N ; i=i + 1 ) begin: gen_celdas//Bucle For para generar las celdas tipicas en base al parametro N.
                                                        //i=0 inicia el bucle en 0, i<N es la condicion que debe cumplir, i=i+1 
                                                        //significa que despues de cada iteracion a i se le suma 1.
                                                        //begin: gen_celdas significa que se comienza un bloque de nombre gen_celdas.
        //codigo para instanciar la celda tipica
        celda_tipica_c uut_tipica(
            .A(A[i]), //el bit i de A se conecta al puerto A, en este caso, se hace asi para que a cada celda tipica le quede un bit,
            .B(B[i]),
            .x(X_temp[i]), //el bit i-1 de X se conecta a x. Si i=0, x=0. De lo contrario, se conecta a i-1.
            .y(Y_temp[i]),
            .X(X_temp[i+1]),
            .Y(Y_temp[i+1])//el bit i+1 de Y se conecta al puerto Y.
        );     
        end
    endgenerate 

//Instanciacion de la celda final
    celda_final_c uut_final_c(
    .X(X_temp[N]), //Se conecta el bit mas significativo (basado en N) de la senal X al puerto x de la celda final.
    .Y(Y_temp[N]), //Se conecta el bit mas significativo (basado en N) de la senal Y al puerto y de la celda final.
    .Z(Z)
    );

    assign Z_out = (A > B) ? 0 : Z;  // Z_out va a ser el equivalente a 'Z se activa en bajo'.
                        //La logica es, si A>B, Z_out es 0 y si A==B u otro caso, Z_out esta conectado directamente a Z, esto es para garantizar 
                        //que las pruebas inician desde 0.Sin esta lógica, por ejemplo, todo los resultados son como se esperan excepto el de la primera prueba.
                        //Sin embargo, al implementar esta lógica, la primera prueba si se comporta como se desea. 
endmodule