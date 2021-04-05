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

Para el desarrollo del divisor se realiza el diagrama de flujo para tener en cuenta el fucionamiento general del código.

![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/FLUJOD.png)

Por otro lado describimos el diagrama de estados para tener claro las variables de control.

![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/ESTADOSD.png)


## Restador

## Pruebas con la FPGA
![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/suma.jpeg)
![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/multip.jpeg)
![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/resta.jpeg)
![diagramaEstados](https://github.com/unal-edigital2/lab01-alu-grupo14/blob/master/fig/divis.jpeg)
