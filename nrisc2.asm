	.data
a:      .word 0, 11, 7, 100, 100, 5, 4, 100, 100, 100, 3, 3, 7, 100, -1 #array com os numeros
	.text
	load $r0, array #endereco do array a
nCount: reset $r2 #inicialiando o numero atual
	reset $r3 #inicializando o maior numero ($s1)
	reset $r4 #inicializando o contador do numero que aparece na iteracao ($t1)
	
	reset $r5 #inicializando e resetando iterador i ($t2)

i_loop: load $r4, $r0 #carregando o numero do array na posicao de memoria em r4 ($t0)

	#resetando registradores temporarios
	reset $r6 #$t3
	reset $r7 #$t4
	reset $r1 #$t5
	
	slt $r6, $r4, $b0 
	#continuar apenas se o numero atual for maior que zero ($b1 = 0 ($r6) < $r4)
	#so usei r6 por estar inicializado com 0, pode ser reaproveitado depois
	
	beq return, 1, $b0 #caso contrario, finaliza a execucao da funcao
	
	slt $r3, $r2, $b1 #maior numero menor que numero atual?
	slt $r7, $r2, $b0 #maior numero maior que numero atual?
	or $b0, $b0, $b1 #operacao "ou" com registradores t3 e t4
	beq conditional, 1, $b0
	
	addi $r4, 1 
	#caso t0 nao seja maior nem menor que s1, significa que eh igual. 
	#nesse caso, incrementar o contador
conditional:
	beq $r6, conditional2
	#caso s1 seja menor, redefinir o maior numero e o contador
	reset $r3
	reset $r4
	addi $r4, 1
conditional2:
	#incrementando o iterador do loop
	addi $r5, 1
	#incrementando o endereco de memoria da proxima posicao do array
	addi $r0, $r0, 4
	#retomar o loop
	jal i_loop
	        
        #paralizando a execucao
        halt