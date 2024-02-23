#include "hash.h"

void menu(){
   printf("\n===== Jovial C++ =====\n");
}

int vazia(Item *item){
   return (item == NULL);
}

int hashing(Hash *h, char *nome){
   int t = 0;
   for(int i = 0; nome[i]; i++){
      t += (int) nome[i];
   }
   return t%h->tam;
}

Hash *criarHash(int tam){
   Hash *h = (Hash*) malloc (sizeof(Hash));
   h->tam = tam;
   h->vet = (Item**) malloc (sizeof(Item*)*tam);
   for(int i = 0; i < tam; i++){
      h->vet[i] = NULL;
   }
   return h;
}

void inserirHash(Hash *h, char *nome, char *token){
   int key = hashing(h, nome);
   h->vet[key] = inserir(h->vet[key], nome, token);
}

Item *inserir(Item *item, char *nome, char *token){
   if(busca(item, nome)==NULL){
      Item *aux = (Item *)malloc(sizeof(Item));
      strcpy(aux->nome, nome);
      strcpy(aux->token, token);
      aux->prox = item;      
      return aux;
   }
   return item;
}

Item *busca (Item *item, char* str){
   Item *aux = item;
   for(; aux != NULL; aux = aux->prox){
      if(strcmp(aux->nome, str) == 0) return aux;
   }
   return aux;
}

void imprimir(Item *item){
   if(vazia(item)){
      return;
   }else{
      imprimir(item->prox);
      printf("| %-20s |", item->token);
      printf("%20s |\n", item->nome);
   }
}

void imprimirHash(Hash *h){
   for(int i = 0; i<h->tam; i++){
      imprimir(h->vet[i]);
   }
}

int verificaErro(char* str, int linha){
   char erro[] = "@$¨~çÇ§¹²³£¢¬₢°`";
   int pos = strcspn(str, erro);
   if(pos == strlen(str)){
      return 0;
   }else{
      printf("\n\tERRO NA LINHA %d CARACTER %d: %s\n\n", linha, pos+1, str);
      return pos;
   }
}

Item *limpa(Item *item){
   if(!vazia(item)){
      item->prox = limpa(item->prox);
      free(item);
   }
   return NULL;
}

Hash *limpaHash(Hash *h){
   if(h != NULL){
      for(int i = 0; i < h->tam; i++){
         h->vet[i] = limpa(h->vet[i]);
      }
      free(h);
   }
   return NULL;
}


