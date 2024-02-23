%{
	#include <stdio.h>
    #include <stdlib.h>
    #include "hash.h"
    #include "analisador.tab.h"
    char err[10000];
    int linha = 1;
    int caractere = 0;

    extern Hash *h, *simbolo;
%}

%option noyywrap

DIGITO      [0-9]+
LETRA       [a-zA-z]
ID          [a-zA-Z][a-zA-Z0-9]*
WHITESPACE  [ \t]
ENTER       [\n]
ERRO        [@$¨~çÇ§¹²³£¢¬₢°`]
ASPAS       ["]

IF_TOK      if
ELSE_TOK    else
FOR_TOK     for
WHILE_TOK   while

CHAR_TOK    char
INT_TOK     int
FLOAT_TOK   float
DOUBLE_TOK  double
VOID_TOK    void

MAIN_TOK    main
PRINT_TOK   print
SCAN_TOK    scan
RETURN_TOK  return
IMPORT_TOK  import
DEFINE_TOK  define

MAIS_TOK    "+"
MENOS_TOK   "-"
DIV_TOK     "/"
MULT_TOK    "*"
MOD_TOK     "%"
NEG_TOK     "!"
OR_TOK      "|"
XOR_TOK     "^"
AND_TOK     "&"

L_AND_TOK   "&&"
L_OR_TOK    "||"
L_SHL_TOK   "<<"
L_SHR_TOK   ">>"

INC_TOK     "++"
DEC_TOK     "--"

ATR_TOK     "="
ATR_SM_TOK  "+="
ATR_DC_TOK  "-="
ATR_MT_TOK  "*="
ATR_DV_TOK  "/="
ATR_MD_TOK  "%="

IG_TOK      "=="
DIF_TOK     "!="
MEN_TOK     "<"
MAI_TOK     ">"
MAI_IG_TOK  ">="
MEN_IG_TOK  "<="

VIRG_TOK    ","
PVIRG_TOK   ";"
DPONT_TOK   ":"

A_PAR_TOK   "("
F_PAR_TOK   ")"
A_COL_TOK   "["
F_COL_TOK   "]"
A_CHA_TOK   "{"
F_CHA_TOK   "}"

%%

{IF_TOK}         {strcat(err, yytext); inserirHash(h, yytext, "CONDICIONAL"); return IF_TOK;}
{ELSE_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "CONDICIONAL"); return ELSE_TOK;}

{FOR_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "REPETICAO"); return FOR_TOK;}
{WHILE_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "REPETICAO"); return WHILE_TOK;}

{CHAR_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "TIPO DE DADO"); return CHAR_TOK;}
{INT_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "TIPO DE DADO"); return INT_TOK;}
{FLOAT_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "TIPO DE DADO"); return FLOAT_TOK;}
{DOUBLE_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "TIPO DE DADO"); return DOUBLE_TOK;}
{VOID_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "TIPO DE DADO"); return VOID_TOK;}

{MAIN_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "FUNCAO PRINCIPAL"); return MAIN_TOK;}
{PRINT_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "FUNCAO DE SAIDA"); return PRINT_TOK;}
{SCAN_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "FUNCAO DE LEITURA"); return SCAN_TOK;}
{RETURN_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "COMANDO DE RETORNO"); return RETURN_TOK;}
{IMPORT_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "COMANDO DE CABEÇALHO"); return IMPORT_TOK;}
{DEFINE_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "COMANDO DE DEFINICAO"); return DEFINE_TOK;}

{MAIS_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR SOMA"); return MAIS_TOK;}
{MENOS_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR SUBTRACAO"); return MENOS_TOK;}
{DIV_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR DIVISAO"); return DIV_TOK;}
{MULT_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR MULTIPLICACAO"); return MULT_TOK;}
{MOD_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR RESTO"); return MOD_TOK;}
{NEG_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR DE NEGACAO"); return NEG_TOK;}
{OR_TOK}         {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR DE OR"); return OR_TOK;}
{XOR_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR DE XOR"); return XOR_TOK;}
{AND_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR DE AND"); return AND_TOK;}

{L_AND_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "AND LOGICO"); return L_AND_TOK;}
{L_OR_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "OR LOGICO"); return L_OR_TOK;}
{L_SHL_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "SHIFT LEFT"); return L_SHL_TOK;}
{L_SHR_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "SHIFT RIGTH"); return L_SHR_TOK;}

{INC_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR INCREMENTO"); return INC_TOK;}
{DEC_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR DECREMENTO"); return DEC_TOK;}

{ATR_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR ATRIBUICAO"); return ATR_TOK;}
{ATR_SM_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR ATRIBUICAO COM SOMA"); return ATR_SM_TOK;}
{ATR_DC_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR ATRIBUICAO COM DECREMENTO"); return ATR_DC_TOK;}
{ATR_MT_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR ATRIBUICAO COM MULTIPLICACAO"); return ATR_MT_TOK;}
{ATR_DV_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR ATRIBUICAO COM DIVISAO"); return ATR_DV_TOK;}
{ATR_MD_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR ATRIBUICAO COM RESTO"); return ATR_MD_TOK;}

{IG_TOK}         {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR IGUALDADE"); return IG_TOK;}
{DIF_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR DIFERENTE"); return DIF_TOK;}
{MEN_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR MENOR"); return MEN_TOK;}
{MAI_TOK}        {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR MAIOR"); return MAI_TOK;}
{MAI_IG_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR MAIOR IGUAL"); return MAI_IG_TOK;}
{MEN_IG_TOK}     {strcat(err, yytext); inserirHash(h, yytext, "OPERADOR MENOR IGUAL"); return MEN_IG_TOK;}

{VIRG_TOK}       {strcat(err, yytext); inserirHash(h, yytext, "VIRGULA"); return VIRG_TOK;}
{PVIRG_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "PONTO E VIRGULA"); return PVIRG_TOK;}
{DPONT_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "DOIS PONTO"); return DPONT_TOK;}

{A_PAR_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "ABERTURA PARENTESES"); return A_PAR_TOK;}
{F_PAR_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "FECHAMENTO PARENTESE"); return F_PAR_TOK;}
{A_CHA_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "ABERTURA CHAVES"); return A_CHA_TOK;}
{F_CHA_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "FECHAMENTO CHAVES"); return F_CHA_TOK;}
{A_COL_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "ABERTURA COLCHETE"); return A_COL_TOK;}
{F_COL_TOK}      {strcat(err, yytext); inserirHash(h, yytext, "FECHAMENTO COLCHETE"); return F_COL_TOK;}

"//"[^\n]*\n     {strcat(err, yytext); inserirHash(h, yytext, "COMENTARIO");}
"/*"[^'*/']*"*/" {strcat(err, yytext); inserirHash(h, yytext, "COMENTARIO");}

{ID}             {strcat(err, yytext); inserirHash(simbolo, yytext, "IDENTIFICADOR"); return ID;}

{DIGITO}         {strcat(err, yytext); inserirHash(simbolo, yytext, "DIGITO"); return DIGITO;}
\"[^\"]*\"       {strcat(err, yytext); inserirHash(simbolo, yytext, "STRING");}

{WHITESPACE}     {strcat(err, yytext);}
{ENTER}          {caractere = verificaErro(err, linha); linha++; strcpy(err, "");}
{ERRO}           {strcat(err, yytext);}

[[:^space:]]+;

%%


