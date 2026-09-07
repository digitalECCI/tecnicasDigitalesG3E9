# tecnicasDigitalesG3E9

Técnicas Digitales - Grupo 3 Equipo 9

## Descripción
Este es el repositorio número 9 del la asignatura técnicas digitssales 3.

## Integrantes
JEFFERSON STIVEN QUIÑONES  CODIGO:141228

OSCAR DAVID VARGAS CODIGO:150863

 ## DISEÑO DE SIRCUITO COMBINADO-NUMEROS PRIMOS 
El codigo utiliazado para implementar cuando un numero es primo, utilizando primitivas logicas (and,or,not). se procesan tres entradas binarias (A,B,C) y una salida S Este codigo permite comprender cómo se construyen sistemas digitales a partir de compuertas básicas.<img width="1830" height="938" alt="numeros primos " src="https://github.com/user-attachments/assets/f78258c2-48ce-4da8-8761-1c16604152c5" />

en el codigo encontramos los que son entradas (INPUT) salidas (OUTPUT) las señales internas (WIRE= CABLES) que son las que conectan las compuertas.
cada linea del código de las compuertas lógicas nos muestra que en el interior del paréntesis se realiza las conexiones del cable (WIRE) con las compuertas.

<img width="1850" height="952" alt="numeros primos 01" src="https://github.com/user-attachments/assets/d7e7d26f-8ea2-498a-b285-cbbae6136df6" />

en el banco de prueba (TESTBENCH) lo mas importante es incluir el modulo principal (binario.v) para que pueda ser probado dentro del banco de prueba, también se define el tiempo de escala de la simulación.
el módulo binario_TB, que no tiene entradas ni salidas externas porque su propósito es probar internamente el diseño.

<img width="1627" height="231" alt="numeros primos 02" src="https://github.com/user-attachments/assets/35a916b9-4e36-44e2-bd0c-a82d7d81b510" />
los códigos (REG) son señales controladas o procesos secuenciales.

<img width="1292" height="140" alt="numeros primos 03" src="https://github.com/user-attachments/assets/450d1e80-23b5-4504-92c1-65d8a5326358" />
son las conexiones entre las señales del testbench (A_TB, B_TB, C_TB, etc.) y los puertos del módulo binario

<img width="981" height="891" alt="numeros primos 04" src="https://github.com/user-attachments/assets/e9455934-d7b2-4f0c-8ed7-61254d78a148" />
se definen los valores de entrada que se aplicarán al módulo para probarlo cada caso representa una combinación de entradas binarias para los tres bits, el codigo prueba todas las combinaciones posibles de (000 a 111)  8 CASOS. 

<img width="1590" height="293" alt="numeros primos 05" src="https://github.com/user-attachments/assets/c4b405ab-1da9-49b6-a55c-d2ccf26eae9e" />
Este bloque es el encargado de controlar la simulación y generar los resultados visuales

## SIMULADOR NUMEROS PRIMOS 
<img width="992" height="637" alt="NUMEROS PRIMOS SIMULADOR" src="https://github.com/user-attachments/assets/ce51be9d-5ae8-4a5d-960a-debc53a4cf07" />

Cuando ingresamos a la terminal de visual studio code y ejecutamos el simulador de verilog el cual en el nos muestra las entradas y salidas ya ejecutadas, del mismo modo nos muestra los 8 casos, en donde (A,B,C) son entradas y S la SALIDA 

CASO 00 (000)=(0)
<img width="1201" height="622" alt="NP CASO 01" src="https://github.com/user-attachments/assets/3ad4762e-9e56-47e1-abd9-02e0e3477112" />

CASO 01 (001)=(1)
<img width="1211" height="622" alt="NP CASO 02" src="https://github.com/user-attachments/assets/6ce030cb-d5d1-4230-b5b9-03f04075b1f8" />

CASO 02 (010)=(1)
<img width="1207" height="628" alt="NP CASO 02 2" src="https://github.com/user-attachments/assets/5f6010b4-1362-4c4a-b2ec-cfe081deadec" />


CASO 03 (011)=(1)
<img width="1197" height="617" alt="NP CASO 03" src="https://github.com/user-attachments/assets/542b2315-65c6-4def-84b8-3ae2517e4e8a" />


CASO 04 (100)=(0)
<img width="1207" height="612" alt="NP CASO 04" src="https://github.com/user-attachments/assets/9058a58d-e25e-461e-85c8-d3f44b54b941" />


CASO 05 (101)=(1)
<img width="1207" height="627" alt="NP CASO 05" src="https://github.com/user-attachments/assets/82fc3ebb-6081-40f3-bebf-cfcb39b4f494" />


CASO 06 (110)=(0)
<img width="1202" height="622" alt="NP CASO 06" src="https://github.com/user-attachments/assets/977e62ad-1526-463d-93eb-9d095c39dfdb" />


CASO 07 (111)=(1)
<img width="1207" height="622" alt="NP CASO 07" src="https://github.com/user-attachments/assets/761cfae3-322e-4c9e-a641-dc41d7eadf9c" />

EL SIMULADOR NOS DETERMINA QUE LOS NUMEROS 02, 03, 05, 07 SON NUEROS PRIMOS.


## COMPUERTAS LOGICAS

<img width="1728" height="950" alt="compuertas" src="https://github.com/user-attachments/assets/7b594f4c-c48e-4d2e-95a4-261f2433522c" />
en el codigo se define entradas (imput wire) A,B y salidas (output wire) Sand,Sor,Snot,Sxor,Sxnor cada salida representa resultado de una operacion logica.
se crea un circuito en el cual se crea dos señales de entrada y 3 de salida las cuales cada una corresponde a una compuerta lógica.

<img width="1676" height="933" alt="compuertas C" src="https://github.com/user-attachments/assets/ee7045dc-1dd5-414b-a052-4453e9e7faca" />

n el banco de prueba (TESTBENCH) lo mas importante es incluir el modulo principal (compuertas.v) para que pueda ser probado dentro del banco de prueba, también se define el tiempo de escala de la simulación.
el módulo compuertas_TB, que no tiene entradas ni salidas externas porque su propósito es probar internamente el diseño.
los códigos (REG) son señales controladas o procesos secuenciales.
en el codido (compuertas uut()) es donde se conecta el testbench con las salidas y entrada del modulo.

<img width="1608" height="953" alt="compuertas C1" src="https://github.com/user-attachments/assets/17e3854e-0db8-411a-8a39-b8d0dbbaf59f" />

En el codigo (initial begin) en los cuales se encuentras los 4 posibles casos o valores de A y B


<img width="1590" height="293" alt="numeros primos 05" src="https://github.com/user-attachments/assets/57477ece-dd95-4416-8416-d4c079fce343" />
Este bloque es el encargado de controlar la simulación y generar los resultados visuales

## SIMULACION VERILOG

COMPUERTA AND
<img width="1343" height="733" alt="and" src="https://github.com/user-attachments/assets/400f3c26-7585-4a1a-9690-94329a3af2a0" />

COMPUERTA NOT
<img width="1355" height="737" alt="NOT" src="https://github.com/user-attachments/assets/0ae08733-ea89-422e-a690-1b133676fe7c" />

COMPUERTA OR  
<img width="1353" height="737" alt="OR" src="https://github.com/user-attachments/assets/cfdea518-4a75-4ead-891f-ad3e435765ff" />

COMPUERTA XNOR
<img width="1352" height="738" alt="XNOR" src="https://github.com/user-attachments/assets/54f718b5-9746-45ed-9bdb-826a3709d45e" />

COMPUERTA XOR
<img width="1347" height="738" alt="XOR" src="https://github.com/user-attachments/assets/6ba33781-1872-48b9-b6fb-ebc4bd03e079" />

## SUMADOR DE 1 BIT

CODIGO
<img width="1878" height="967" alt="SUMADOR" src="https://github.com/user-attachments/assets/26e218d4-3c77-4239-b380-baf888989064" />

En el código primordialmente nombramos el el circuito el cual cuenta con tres entradas y dos salidas en donde A Y B son los bits que se van a sumar y So es el resultado de la suma y Co el acarreo de salida. El cual cuenta con conexiones internas (tipo wire) c1,c2,c3 que son las que trasporta señales intermedias dentro del circuito.

Tambien contamos con compuertas lógicas en donde:

XOR (c1,A,B) CALCULA SUMA PARCIAL ENTRE A Y B.

AND(c2,A,B) DECTETA SI AMBOS SON 1 (ACARREO PARCIAL).

XOR(So,c1,Ci) SUMA DE ACARREO DE ENTRADA.

AND (c3,c1,Ci) DETECTTA ACARREO ADICIONAL.

OR(Co,c2,c3) COMBINA LOS ACARREOS.

TESTBENCH
<img width="1827" height="667" alt="SUMADOR C" src="https://github.com/user-attachments/assets/3be7bf62-9355-4dd2-9381-3b2f1b91b344" />

Se importa el modulo (sumador.v) para poder ejecutarlo dentro del testbench, igual se de fine la precicion deltiempo de la simulacion.
Se declara las señales que controla el la entrada del modulo ( reg ) y los que reciben los resultados del modulo (wire).

En el comando sumador uut se conecta el modulo sumador con la señal del testbench cada entrada y salida del modulo se en laza con su correspondiente variable de prueba.

<img width="1857" height="897" alt="SUMADOR C1" src="https://github.com/user-attachments/assets/0ba3d0ef-b774-428f-bd9c-290ec72bd823" />

En el bloque (initial begin) se encuentra los casos de prueba para verificar todas las combinaciones posible de entrada del sumador (A_TB) primer bit de entrada, (B_TN)segundo bit de entrada, (Ci_TB) bit de acarreo de entrada. 

<img width="1590" height="293" alt="numeros primos 05" src="https://github.com/user-attachments/assets/eb3566b5-10bf-458a-8454-5d0f10d86272" />
Este bloque es el encargado de controlar la simulación y generar los resultados visuales.

## SIMULACION VERILOG.

