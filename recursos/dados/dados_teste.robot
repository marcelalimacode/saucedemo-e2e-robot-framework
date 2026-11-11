*** Settings ***
Documentation    Dados de teste em um só lugar: usuários, senha, dados do cliente e mensagens esperadas.
...              Os usuários são públicos e aparecem na própria tela de login do Sauce Demo.

*** Variables ***
${URL}                          https://www.saucedemo.com
${USUARIO_PADRAO}               standard_user
${USUARIO_BLOQUEADO}            locked_out_user
${SENHA}                        secret_sauce
${SENHA_ERRADA}                 senha_errada

${NOME}                         Marcela
${SOBRENOME}                    Lima
${CEP}                          01000-000

${MSG_CREDENCIAIS_INVALIDAS}    Epic sadface: Username and password do not match any user in this service
${MSG_USUARIO_BLOQUEADO}        Epic sadface: Sorry, this user has been locked out.
${MSG_USUARIO_OBRIGATORIO}      Epic sadface: Username is required
${MSG_NOME_OBRIGATORIO}         Error: First Name is required
${MSG_PEDIDO_CONCLUIDO}         Thank you for your order!

${PRODUTO}                      sauce-labs-backpack
