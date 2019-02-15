#!/bin/bash

#Author: Dennys Augustus
#E-mail: dennysaug@gmail.com

#gera o token api no transferwise e coloca no lugar de <token>.
#tem quer dupla autenticação para gerar o token
#tive problema depois gerar e clicar em "reveal" para mostrar, sempre dava um erro.
#nao consegui excluir o token gerado e criar um novo
#a opção que encontrei foi me cadastrar no ambiente de testes (sandbox), gerar o token e usar
#a cotação é a mesma para ambiente de testes e produção.

#para executar pela primeira vez: chmod +x monitora_libra.sh
#depois de dar permissão, executa: ./monitora_libra.sh
#código feito e testando em ambiente Linux.


while [ 1 ]
do

curl -sS -X GET "https://api.sandbox.transferwise.tech/v1/rates?source=GBP&target=BRL" -H "Authorization: Bearer b08cd38b-9114-4f83-9ab3-c654bc1531aa" | cut -d ',' -f1 | cut -d ':' -f 2 

sleep 2 
done


