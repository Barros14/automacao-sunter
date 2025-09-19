### Comandos usados no teste SAGI

##### Comandos usados para roda um cenário especifico de cada vez 
	 robot -d resultados -i LGN01 tests/login/TC01-login.robot
	 robot -d resultados -i LGN02 tests/login/TC01-login.robot
	 robot -d resultados -i LGN03 tests/login/TC01-login.robot
	 robot -d resultados -i LGN04 tests/login/TC01-login.robot
	 robot -d resultados -i LGN05 tests/login/TC01-login.robot

##### Comando usado para rodar todos os cenários da suite login
	    robot -d resultados tests/login/TC01-login.robot

##### Comando usado para rodar todos os cenário da suite cadastro
	robot -d resultados tests/cadastro/TC02-cadastro_lojista.robot
    robot -d resultados tests/cadastro/TC03-cadastro_construtor.robot

##### Comando para recuperação de senha
	robot -d resultados tests/recuperar_senha/TC04-recuperar_senha.robot


##### Comando usado para rodar todos o teste regressivo
	robot -d resultados tests

##### Comando usado para rodar todo cenário da tela de cadastro
	robot -d resultados tests/cadastro


##### Comando usado para rodar a suite de teste completa
	robot -d resultados tests/cadastro/login/recuperar_senha

