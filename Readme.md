# Explorando Microdados do Enem

Questões a serem respondidas:

1) É possível predizer a nota de um aluno com base em suas respostas e a de outros alunos?

2) É possível predizer a nota de um aluno considerando que apenas os melhores 10% alunos estão presentes no estudo?

3) Fatores socioenocômicos podem ajudar a predizer a nota de um aluno?

## Gerando os dados

1) Faça o download dos microdados através [desse link](http://inep.gov.br/microdados)
2) Extraia o .zip e mova os `MICRODADOS_ENEM_(ano).csv` para a pasta `raw_data`. Eles estão localizados na pasta `DADOS`.
4) Na pasta raiz, rode o comando `./create_data.sh` passando como parâmetro os anos os quais gostaria de usar. Por exemplo, caso tenha baixado dados de 2015, 2016 e 2017, o comando seria `./create_data.sh 2015 2016 2017`
5) Os arquivos gerados podem ser encontrados na pasta `parsed_data`

### Importando dados para PostgreSQL

1) Crie um bando de dados chamado enem

2) A partir da pasta raiz, rode o comando `psql -U seu_usuario -d enem -a -f sql/create_table.sql`

3) Rode o psql (`psql -U seu_usuario -d enem`) e para cada arquivo criado em `parsed_data`, execute o comando `\copy microdados FROM '/caminho/para/seu/projeto/parsed_data/only_answers_2015.csv' DELIMITER ',' CSV HEADER;`


## Analizando os dados



