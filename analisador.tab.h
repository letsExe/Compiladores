/* A Bison parser, made by GNU Bison 2.7.  */

/* Bison interface for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2012 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_ANALISADOR_TAB_H_INCLUDED
# define YY_YY_ANALISADOR_TAB_H_INCLUDED
/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     DIGITO = 258,
     LETRA = 259,
     ID = 260,
     WHITESPACE = 261,
     ENTER = 262,
     ERRO = 263,
     ASPAS = 264,
     IF_TOK = 265,
     ELSE_TOK = 266,
     FOR_TOK = 267,
     WHILE_TOK = 268,
     CHAR_TOK = 269,
     INT_TOK = 270,
     FLOAT_TOK = 271,
     DOUBLE_TOK = 272,
     VOID_TOK = 273,
     MAIN_TOK = 274,
     PRINT_TOK = 275,
     SCAN_TOK = 276,
     RETURN_TOK = 277,
     IMPORT_TOK = 278,
     DEFINE_TOK = 279,
     MAIS_TOK = 280,
     MENOS_TOK = 281,
     DIV_TOK = 282,
     MULT_TOK = 283,
     MOD_TOK = 284,
     NEG_TOK = 285,
     OR_TOK = 286,
     XOR_TOK = 287,
     AND_TOK = 288,
     L_AND_TOK = 289,
     L_OR_TOK = 290,
     L_SHL_TOK = 291,
     L_SHR_TOK = 292,
     INC_TOK = 293,
     DEC_TOK = 294,
     ATR_TOK = 295,
     ATR_SM_TOK = 296,
     ATR_DC_TOK = 297,
     ATR_MT_TOK = 298,
     ATR_DV_TOK = 299,
     ATR_MD_TOK = 300,
     IG_TOK = 301,
     DIF_TOK = 302,
     MEN_TOK = 303,
     MAI_TOK = 304,
     MAI_IG_TOK = 305,
     MEN_IG_TOK = 306,
     VIRG_TOK = 307,
     PVIRG_TOK = 308,
     DPONT_TOK = 309,
     A_PAR_TOK = 310,
     F_PAR_TOK = 311,
     A_COL_TOK = 312,
     F_COL_TOK = 313,
     A_CHA_TOK = 314,
     F_CHA_TOK = 315
   };
#endif


#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */

#endif /* !YY_YY_ANALISADOR_TAB_H_INCLUDED  */
