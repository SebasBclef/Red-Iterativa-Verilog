//Proyecto Final de Digitales,C01263,B82600,B86941.
//Implementacion Estructural al caso DERECHA a IZQUIERDA.
`timescale 1ns/1ns
`include "Comparador .v"

//*Importante:Para GtkWave, el valor que importa es W_out. Para efectos del proyecto, la salida Z que nos piden en este caso va a ser W, se trae asi porque asi se hizo 
//diseño.
module Comparador_tb #(parameter N = 1);//SI VAN A CAMBIAR EL PARAMETRO, TANTO ESTE COMO EL DEL OTRO MODULO DEBEN SER IGUALES!!!!
  reg [N-1:0] A, B;                                   
  wire W_out;
  reg reset;
  

  // Instanciación del módulo bajo prueba

   initial begin
        reset=1'b1;//se agrega un reinicio para garantizar que al inicio de cada prueba, las ondas empiecen en 0
        #10//ademas, se agrega un retardo despues de cada reset.
        reset=1'b0;
    end
  Comparador uut ( 
    .A(A),
    .B(B),
    .W_out(W_out)
  );

  // Lógica para aplicar pruebas a la red.
  initial begin
    #10 reset = 1;
    #10 reset = 0;
    // Asigno valores iniciales a las entradas
    $dumpfile ("Comparador_tb.vcd");//Para generar el .vcd para gtkwave
    $dumpvars (0,uut);
        
    //Se decidio aplicar pruebas con valores aleatorios. Estos valores aleatorios, se generan de un rango de 0 al parametro N. 
    //Esto significa que, por ejemplo, si N=7, A y B van a ser palabras de 7 bits, y dentro de esos 7 bits los 0s y 1s se generan
    //de manera aleatoria. Esto garantiza probar combinaciones diferentes de bits, en vez de tener que hacerlas manualmente.
    //El proceso es eficiente, y pone aun mas a prueba el funcionamiento de la red.
    //Prueba 1
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;//retardo despues del reset
    #10 reset = 0;//retardo despues del reset
    #1000; //retardo
    $display("Valor: A = %b, B = %b, W_out = %b", A, B, W_out);//esto es para que en la terminal, se impriman los valores del comparador
                                                              //para garantizar que funcione.
    //A partir de aca, se copia y pega las pruebas deseadas a correr. Mientras mas, mejor. Se decidio en ejecutar 10 pruebas de manera arbitraria.
    //Prueba 2
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b, W_out = %b", A, B, W_out);
  //Prueba 3
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b, W_out = %b", A, B, W_out);
  //Prueba 3
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b,W_out = %b", A, B,W_out);
  //Prueba 4
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b,W_out = %b", A, B, W_out);

  //Prueba 5
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b, W_out = %b", A, B, W_out);

    //Prueba 6
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b, W_out = %b", A, B,W_out);
    
    //Prueba 7
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b, W_out = %b", A, B, W_out);

    //Prueba 8
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b, W_out = %b", A, B, W_out);

    //Prueba 9
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b, W_out  = %b", A, B, W_out);

    //Prueba 10
    A = $urandom_range(0, (1<<N)-1);
    B = $urandom_range(0, (1<<N)-1);
    #1000 reset = 1;
    #10 reset = 0;
    #1000;  
    $display("Valor: A = %b, B = %b, W_out = %b", A, B, W_out);

    // Mostrar resultados
    $display("end of test.");

    // Si se desea generar otro 'set' de datos random, se debe borrar el .vcd y el .vvp, y cambiar el parametro N.
  end
endmodule