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

printf "\n####### MONITORA COTAÇÃO DA LIBRA NO TRANSFERWISE #######\n"
if [ "$1" == "" ] 
then	
	printf "# Deve informar a cotação em real que deseja\n"
	printf "# Ex.: $0 4.75\n\n"
else
			
	while [ 1 ]
	do

	curl -o cotacao -sS -X GET "https://api.sandbox.transferwise.tech/v1/rates?source=GBP&target=BRL" -H "Authorization: Bearer b08cd38b-9114-4f83-9ab3-c654bc1531aa" 

	cat cotacao | cut -d ',' -f1 | cut -d ':' -f 2 | sed 's/...$//' > libra
	if [ $((echo "scale=4; $(<libra) <= $1") | bc -l) == 1 ] 
	then
	printf "£ 1 = R$ $(<libra) \t $(date) \n"
	fi

	sleep 30
	done
fi



