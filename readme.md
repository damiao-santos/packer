- inline sempre vai ser um array [] e vai receber os comandos do provisioner
- é sempre com iniciar com um comando de sleep de 30 segundos para que o sistema esteja totalmente bootado.
- Provisioners aceitam o script no lugar do inline, masta apenas apontar para a pasta que seu arquivo .sh esta para que o packer o execute.
"provisioners": [
        {
            "type": "shell",
            "script": "setup.sh"
        }
    ]

- Um outro provisioner é o File, que faz com que um arquivo que especifiquemos seja alocado no caminho informado.

- o file provisioner pode ter um problema em relação a diretorios que são controlados pelo root, mas para contornar esse erro podemos copiar com o File para
a pasta /tmp/ e depois usar um novo provisioner do tipo shell para mover o arquivo com o parametro inline.

-Post-processor são processor que executam após a imagem ser criada, ha diversos modelos, no exemplo atual um gera um manifest com informações criadas da imagem
e o outro gera vagrant box para ser utilizada localmente para testes.