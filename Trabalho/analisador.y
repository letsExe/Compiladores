%{
    #include <stdio.h>
    #include <stdlib.h>
    #include "hash.h"
    #include "analisador.tab.h"

    extern FILE* yyin;

    int yylex(void);
    void yyerror(char *);

    Item *tokens = NULL;
    Item *usuario = NULL;
    Hash *h = NULL;
    Hash *simbolo = NULL;

    

%}

%token DIGITO
%token LETRA
%token ID
%token WHITESPACE
%token ENTER
%token ERRO
%token ASPAS

%token IF_TOK
%token ELSE_TOK
%token FOR_TOK
%token WHILE_TOK

%token CHAR_TOK
%token INT_TOK
%token FLOAT_TOK
%token DOUBLE_TOK
%token VOID_TOK

%token MAIN_TOK
%token PRINT_TOK
%token SCAN_TOK
%token RETURN_TOK
%token IMPORT_TOK
%token DEFINE_TOK

%token MAIS_TOK
%token MENOS_TOK
%token DIV_TOK
%token MULT_TOK
%token MOD_TOK
%token NEG_TOK
%token OR_TOK
%token XOR_TOK
%token AND_TOK

%token L_AND_TOK
%token L_OR_TOK
%token L_SHL_TOK
%token L_SHR_TOK

%token INC_TOK
%token DEC_TOK

%token ATR_TOK
%token ATR_SM_TOK
%token ATR_DC_TOK
%token ATR_MT_TOK
%token ATR_DV_TOK
%token ATR_MD_TOK

%token IG_TOK
%token DIF_TOK
%token MEN_TOK
%token MAI_TOK
%token MAI_IG_TOK
%token MEN_IG_TOK

%token VIRG_TOK
%token PVIRG_TOK
%token DPONT_TOK

%token A_PAR_TOK
%token F_PAR_TOK
%token A_COL_TOK
%token F_COL_TOK
%token A_CHA_TOK
%token F_CHA_TOK


%%

program:
    seq                                             {printf("FINALIZADO\n");}
    |                                               {printf("NADA\n");}
    ;
seq:
    dec PVIRG_TOK
    | dec PVIRG_TOK seq                             {printf("SEQUENCIA\n");}
    ;   
dec:
    cond                                            {printf("DECLARACAO\n");}
    | rep_for                                       {printf("DECLARACAO\n");}
    | rep_while                                     {printf("DECLARACAO\n");}
    | atr                                           {printf("DECLARACAO\n");}
    | lei                                           {printf("DECLARACAO\n");}
    | esc                                           {printf("DECLARACAO\n");}
    | exp                                           {;}
    ;
cond:
    IF_TOK exp A_CHA_TOK seq F_CHA_TOK                                      {printf("CONDICIONAL\n");}
    | IF_TOK exp A_CHA_TOK seq F_CHA_TOK ELSE_TOK A_CHA_TOK seq F_CHA_TOK   {printf("CONDICIONAL\n");}
    ;
rep_for: // n ta reconehcendo
    FOR_TOK A_PAR_TOK atr exp PVIRG_TOK exp PVIRG_TOK exp F_PAR_TOK A_CHA_TOK seq F_CHA_TOK {printf("REPETICAO - FOR\n");}                                                                                          
    ;
rep_while: // n ta reconehcendo
    WHILE_TOK exp A_CHA_TOK seq F_CHA_TOK               {printf("REPETICAO - WHILE\n");}
    ;
atr:
    ID ATR_TOK exp                                      {printf("ATRIBUICAO\n");}
    ;           
lei:    
    SCAN_TOK ID                                         {printf("LEITURA\n");}
    ;
esc:
    PRINT_TOK exp                                       {printf("ESCRITA\n");}
    ;
exp:
    exp_simples comp_op exp_simples                     {printf("COMPARACAO\n");}
    | exp_simples                                       {printf("EXP\n");}
    ;
comp_op:
    MAI_TOK                                             {printf("MAIOR\n");}
    | MEN_TOK                                           {printf("MENOE\n");}
    ;
exp_simples: 
    exp_simples soma termo                              {printf("SOMA DE TERMOS\n"); }
    | termo                                             {printf("TERMO\n"); }
    ;

soma: 
    MAIS_TOK                                            {printf("SOMA\n"); }
    | MENOS_TOK                                         {printf("SUBTRACAO\n"); }
    ;

termo: 
    termo mult fator                                    {printf("MULTIPLICACAO DE FATORES\n"); }
    | fator                                             {printf("FATOR\n"); }
    ;

mult: 
    MULT_TOK                                            {printf("MULT\n"); }
    | DIV_TOK                                           {printf("DIV\n"); }
    ;

fator: 
    A_PAR_TOK exp F_PAR_TOK                             {printf("EXPRESSAO ENTRE PARENTESES\n"); }
    | DIGITO                                            {printf("DIGITO\n"); }
    | ID                                                {printf("ID\n"); }
    ;
%%

void yyerror(char *s){
    printf("%s\n", s);
}

int main(){	
    char str[50];
    int saida = 1;
    int opcao;
    FILE* arq;

    menu();
        
    do{
        printf("\n1 - Inserir arquivo de leitura\n");
        printf("2 - Imprimir tabela de tokens\n");
        printf("3 - Imprimir tabela de simbolos\n");
        printf("0 - Sair\n");

        scanf("%d", &opcao);
    
        switch(opcao) {
            case 1 : 
                h = limpaHash(h);
                simbolo = limpaHash(simbolo);
                h = criarHash(200);
                simbolo = criarHash(200);
                printf("\nDigite o caminho do arquivo: ");
                scanf("%s", str);
                arq = fopen(str, "r");
                while(arq == NULL){
                    
                    printf("Digite o caminho correto do arquivo: ");
                    scanf("%s", str);
                    arq = fopen(str, "r");
                }

                yyin = arq;
                yyparse(); 
                break;

            case 2 :
                printf("TABELA DE TOKENS\n"); 
                printf(" ______________________ _____________________ \n");
                imprimirHash(h);
                printf(" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾ ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾ \n");
                break;
            case 3 : 
                printf("TABELA DE SIMBOLOS\n"); 
                printf(" ______________________ _____________________ \n");
                imprimirHash(simbolo);
                printf(" ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾ ‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾‾ \n");
                break;
    
        }

    }while(opcao != 0);

    fclose(arq);
    
    yyparse();     
	return 0;
}
