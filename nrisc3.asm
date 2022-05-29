i_loop: load $r2, $r0 #carregando o numero do array na posicao de memoria em r1 ($t0)
	reset $r5 
	slt $r5, $r2, $b0 #continuar apenas se o numero atual for maior que zero ($b1 = 0 ($r6) < $r4)
	setbool $b1, 1
	addi $r5, 3
	addi $r5, 3
	addi $r5, 3
	addi $r5, 3
	addi $r5, 3
	addi $r5, 3
	addi $r5, 3
	addi $r5, 3
	addi $r5, 3
	add $r5, $r1
	beq $r5, $b1, $b0 #caso contrario, finaliza a execucao da funcao
	slt $r3, $r2, $b1 #maior numero menor que numero atual?
	slt $r2, $r3, $b0 #maior numero maior que numero atual?
	or $b0, $b0, $b1 #operacao "ou" com registradores t3 e t4
	setbool $b1, 1
	reset $r7
	addi $r7, 3
	add $r7, $r1
	beq $r7, $b0, $b1 #ir para conditional
	addi $r4, 1 #caso t0 nao seja maior nem menor que s1, significa que eh igual. #nesse caso, incrementar o contador
conditional: slt $r3, $r2, $b0 #maior numero menor que numero atual?
	reset $r7
	addi $r7, 3
	addi $r7, 2
	add $r7, $r1
	beq $r7, $b0, $b1 #pular para conditional2
	reset $r3 #caso r3 seja menor, redefinir o maior numero e o contador
	reset $r4
	addi $r4, 1
conditional2: #incrementando o endereco de memoria da proxima posicao do array
	addi $r0, 3
	addi $r0, 1
	beq $r6, $b0, $b0 #retomar o loop (condicao sempre sera verdadeira)   
 return:reset $r0
 	store $r3, $r0 #salvar o maior numero na primeira posicao do array
	addi $r0, 3 #deslocando uma posicao no array
	addi $r0, 1
	store $r1, $r0 #salvar as ocorrencias do numero na segunda posicao do array
 	halt #paralizando a execucao

#Programa em NRISC - Maior Numero
#Nome: Mateus Lemos de Freitas Barbosa
#Aula 6 Lab AOC1

	#$r0: posicao de memoria inicial do array (00000000)
	#$r1: stack pointer
	#$r2: numero atual
	#$r3: maior numero ($s1)
	#$r4: contador do numero que aparece na iteracao ($t1)
	#$r5: reg temporario
	#$r6: endereco i_loop (11001000)
	#$r7: endereco conditional/conditional2 ()
