#Programa em Assembly - Maior Numero
#Nome: Mateus Lemos de Freitas Barbosa
#Aula 6 Lab AOC1

#Observacao: A funcao print serve apenas para fins de teste.
	
	.data
a:      .word 0, 11, 7, 100, 100, 5, 4, 100, 100, 100, 3, 3, 7, 100, -1 #array com os numeros

	.text
	la $a0, a #endereco do array a
	
        jal nCount #pulando pra executar a funcao
	jal print
        
        #encerrando o programa
        li  $v0, 10
        syscall      
          
nCount: add $t0, $zero, $zero #corresponde ao numero atual
	addi $s0, $a0, 0 #copiando endereco de memoria do array para $s0
	add $s1, $zero, $zero #corresponde ao maior numero
	add $t1, $zero, $zero #corresponde ao contador do numero que aparece na iteracao

	addi $t2, $zero, 0 #inicializando e resetando iterador i

i_loop: lw $t0, 0($s0) #carregando o numero do array na posicao de memoria em s0
	#resetando registradores temporarios
	addi $t3, $zero, 0
	addi $t4, $zero, 0
	addi $t5, $zero, 0
	slt $t3, $t0, $zero #continuar apenas se o numero atual for maior que zero
	beq $t3, 1, return #caso contrario, finaliza a execucao da funcao
	
	slt $t3, $s1, $t0 #maior numero menor que numero atual?
	slt $t4, $t0, $s1 #maior numero maior que numero atual?
	or $t5, $t3, $t4 #operacao "ou" com registradores t3 e t4
	beq $t5, 1, conditional
	addi $t1, $t1, 1 
	#caso t0 nao seja maior nem menor que s1, significa que eh igual. 
	#nesse caso, incrementar o contador
conditional:
	beqz $t3, conditional2
	#caso s1 seja menor, redefinir o maior numero e o contador
	addi $s1, $t0, 0
	addi $t1, $zero, 1
conditional2:
	#incrementando o iterador do loop
	addi $t2, $t2, 1
	#incrementando o endereco de memoria da proxima posicao do array
	addi $s0, $s0, 4
	#retomar o loop
	j i_loop

return: #salvar o maior numero e suas ocorrencias nos registradores
	addi $s6, $s1, 0
	addi $s7, $t1, 0
	#finalizar funcao
	jr $ra
        
      .data
space:.asciiz  ", "          # space to insert between numbers
head: .asciiz  "Os numeros no vetor sao:\n"
      .text
print:  addi   $a0, $s6, 0      # load fibonacci number for syscall
     	li   $v0, 1           # specify Print Integer service
     	syscall
     	
     	la   $a0, space       # load address of spacer for syscall
      	li   $v0, 4           # specify Print String service
      	syscall
      	
      	addi   $a0, $s7, 0      # load fibonacci number for syscall
     	li   $v0, 1           # specify Print Integer service
     	syscall
      
     	jr   $ra              # return
