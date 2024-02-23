#ifndef HASH_H
#define HASH_H

#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct no {
    char nome[100];
    char token [100];
    int linha;
    struct no *prox;
}Item;

typedef struct hash{
    int tam;
    Item **vet;
}Hash;

// Menu
// Entrada: Nenhuma
// Retorno: Nenhuma
// Pré-condição: Nenhuma
// Pós-condição: Nenhuma
void menu();

// Função para verificar se a lista é vazia
// Entrada: Lista
// Retorno: 1 se a lista é vaiza, 0 caso contrário
// Pré-condição: nenhuma
// Pós-condição: nenhuma
int vazia(Item *item);

int hashing(Hash *h, char *nome);

Hash *criarHash(int tam);

void inserirHash(Hash *h, char *nome, char *token);

// Insere na cabeça da lista
// Entrada: uma lista, o token e o tipo do token
// Retorno: uma lista
// Pré-condição: nenhuma
// Pós-condição: elemento inserido na lista
Item *inserir(Item *item, char *nome, char *token);

// Imprimi os elementos da lista
// Entrada: a lista
// Retorno: nenhum
// Pré-condição: nenhuma
// Pós-condição: os elementos impressos 
void imprimir(Item *item);

void imprimirHash(Hash *h);

// Busca um caracter na lista e verifica se ele já existe
// Entrada: a lista e o caracter
// Retorno: retorna o caracter se achou ele, caso contrário retorna a lista
// Pré-condição: nenhuma
// Pós-condição: o caracter encontrado
Item *busca (Item *item, char* str);

// Verifica se tem um erro na string da lista
// Entrada: a lista, a string a ser verificada e a primeira linha
// Retorno: se encontrou o erro retorna a posição dele, caso contrário retorna 0
// Pré-condição: nenhuma 
// Pós-condição: nenhuma
int verificaErro(char* str, int linha);

// Libera a memória
// Entrada: a lista
// Retorno: NULL
// Pré-condição: nenhuma 
// Pós-condição: nenhuma
Item *limpa(Item *item);

Hash *limpaHash(Hash *h);

#endif