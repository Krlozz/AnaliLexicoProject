%{
#include <math.h>
#include <stdio.h>
#include <string.h>
int num_linea = 1;
%}

delim		" "|\t
digito		[0-9]
letra		[a-zA-Z]  

%%

{delim}+

"bool"		{printf("PALABRA CLAVE\n");}
"char"		{printf("PALABRA CLAVE\n");}
"do"		{printf("PALABRA CLAVE\n");}
"else"		{printf("PALABRA CLAVE\n");}
"float"		{printf("PALABRA CLAVE\n");}
"if"		{printf("PALABRA CLAVE\n");}
"input"		{printf("PALABRA CLAVE\n");}
"int"		{printf("PALABRA CLAVE\n");}
"output"	{printf("PALABRA CLAVE\n");}
"return"	{printf("PALABRA CLAVE\n");}
"string"	{printf("PALABRA CLAVE\n");}
"then"		{printf("PALABRA CLAVE\n");}
"while"		{printf("PALABRA CLAVE\n");}

"true"|"false"                                  {printf("BOOLEAN\n");}
{digito}*"."{digito}*([eE][+-]?{digito}+)? 	{printf("DECIMAL\n");}
[-]?{digito}+					{printf("ENTERO\n");}
{letra}*({letra}*{digito}*)*?			{printf("IDENTIFICADOR\n");}
"\""([a-z|A-Z|0-9|" "][a-z|A-Z|0-9|" "]*)"\""	{printf("STRING\n");}
'([a-z|A-Z|0-9|" "][a-z|A-Z|0-9|" "]*)' 	{printf("CHAR\n");}

","|";"|":"|"("|")"|"["|"]"|"{"|"}"		{printf("SIGNO DE PUNTUACION\n");}
"+"|"-"|"*"|"/"|"<"|">"|"="|"!"|"&"|"$" 	{printf("OPERADOR\n");}
"<="|">="|"=="|"!="|"&&"|"||"	                {printf("OPERADOR COMPUESTO\n");}

"/*"[^}\n]*"*/"|"//"[^}\n]*		        {printf("\n");}
[\n]						{++num_linea; printf("%d ",num_linea);}

.			{printf("ERROR LEXICO EN LA LINEA: %d DE %s\n",num_linea, yytext);}


%%

int main(void) {
	printf("%d ", num_linea);
	yylex();
}