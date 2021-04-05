# lab05 : Unidad de suma, resta, multiplicación, división y visualización BCD
## Introducción

Para este paquete de trabajo, deben estar inscrito en un grupo y clonar la información del siguiente link [WP05](https://classroom.github.com/g/dHrBou9a). Una vez aceptado el repositorio debe descargarlo en su computador, para ello debe clonar el mismo. Si no sabe cómo hacerlo revise la metodología de trabajo, donde se explica el proceso

Las documentación deben estar diligencia en el archivo README.md del repositorio clonado.

Una vez clone el repositorio, realice lo siguiente:


## DESCRIPCION
La unidad aritmética, es tal que cuenta con componentes para realizar operaciones aritméticas. cada operación aritmética es ejecutada acuerdo al código de la operación.

Como ejercicio académico, se propone construye una unidad con 4 operaciones aritméticas: suma, resta, multiplicación y división.  de igual manera, el resultados se visualiza en los display de siete segmentos. El flujo de datos y la selección de la operación se realiza acorde a la señal opcode, y segun la siguiente tabla:


opcode | operación  enteros positivos
00| suma
01| resta
10|  multiplicación
11| división

Por lo tanto, la unidad debe contar con:

1. Los dos puertos de entrada A y B. cada uno de  3 bits.
2. La señal `opcode` de dos bits, para configurar la operación que se realiza con los datos de `portA` y `portB`.
3. La a visualización de unidad debe tener las salidas de los 4 ánodos, `An`  y las 7 señales de los cátodos, `sseg`.
4. Para las FSM  y las visualización dinámica, se debe incluir la señal de `clk` de entrada.
5. la señal de reset del sistema

## Diagrama de caja negra

Según las especificaciones anteriormente descrita, la caja funcional de la unidad aritmética propuesta es:

![caja negra](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab06_Unidad_aritmetica/doc/cajanegra.png)


## Diagrama estructural

![estructural](https://github.com/Fabeltranm/SPARTAN6-ATMEGA-MAX5864/blob/master/lab/lab06_Unidad_aritmetica/doc/diagraEstructural.png)

El diagrama estructural, se soporta en los componentes desarrollados en los anteriores laboratorios. De esta manera,  tanto el sumador, el multiplicador  y el Display, son tomados de los lab2, lab5 y lab4  respectivamente. Adicional a la estructura de cada operación se encuentra el decodificador  y el multiplexador.


# DESARROLLO

## Divisor

### Diagrama de Flujo y Estados

Para el desarrollo del divisor se realiza el diagrama de flujo para tener en cuenta el fucionamiento general del código.

![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/FLUJOD.png)

Por otro lado describimos el diagrama de estados para tener claro las variables de control del sistema.

![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/ESTADOSD.png)

### Código

El módulo tiene las entradas DV y DR de 3 bits que corresponden al dividendo y al divisor respectivamente. Además de las variables init y clk, para controlar la logica secuencial del programa. Y la salida DP de 3 bits que corresponde a el resultado de la división.


``` verilog
module divi( input [2:0] DV,
							input [2:0] DR,
						   	input init,
							 input clk,
							 output  reg [2:0] DP
    );
```



## Restador

En el modulo de la resta se hace por complemento a 2, por lo tanto se toma una de las entradas al modulo, en este caso sera "y" el cual se niega al ser asignado a una constante, luego al hacer la suma con la primera entrada se le suma 1 ya que se debe cumplir el funcionamiento por complemento en a 2 y de esta manera se llegara al resultado, este sera una variable de 4 bits "st" y sera asignado a la salida del modulo "sal".
``` verilog
module resta(init, x, y,sal);

  input init;
  input [3 :0] x;
  input [3 :0] y;
  output [3 :0] sal;


  wire [3:0] st;
  wire [3:0] const;

  assign const = ~y;
  assign sal= st[3:0];

  assign st  = 	x+const+1;
```

## Pruebas con TestBench

Se realiza la prueba de la ALU con el TestBench en el software EDA-playground, usando como entradas de los puertos A y B los valores de 6 y 3 respectivamente, y variando la señal de entrada opcode para cambiar la operación aritmética que realiza la ALU. Las señales de salida de los modulos de suma, resta, multiplicación y división según las señales de entrada son los siguientes:

![testbench](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/testbench.png)

## Pruebas con la FPGA
Ya con la ALU completa, pasaremos a demostrar el funcionamiento del código dentro de la FPGA, primero cabe aclarar que los 3 primeros switch de derecha a izquierda hacen referencia a los 3 bits de la primera entrada, los otros siguientes a la segunda entrada y el séptimo con el octavo switch al "opcode". Dentro de todas las pruebas se esta mostrando como primera entrada "110" que en decimal es 6 y como segunda entrada "011" que seria 3.
Dentro de la primera imagen se hace el módulo de la suma siendo opcode como "00", por lo tanto el resultado sera 9 dentro del display.
![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/suma.jpeg)
ahora cuando opcode es "01" estamos en el módulo de la resta, por lo tanto el resultado seria 3 dentro del display.
![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/resta.jpeg)
Cuando opcode es "10" estamos en el módulo de la multiplicación, por lo tanto el resultado seria 12 dentro del display. Al multiplicar 6 por 3 dará 18, sin embargo como el display esta en el sistema hexadecimal por eso muestra 12.
![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/multip.jpeg)
Por ultimo, opcode en "11" estamos en el modulo de la división, y el resultado en el display seria 2.
![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/divis.jpeg)
