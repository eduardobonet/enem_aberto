# Enem Aberto

Um projeto para facilitar a exploração dos micro dados do Exame Nacional de Ensino Médio.

Algums de nossos objetivos com essa platforma:

1) Criar um ambiente onde questões sobre o Enem podem ser feitas e respondidas com base nos dados

Existem muitas análises espalhadas sobre esse conjunto de dados. Centralizando
as questões como Issues no github fica mais fácil acompanhar o progresso. As issues 
também pode ser criadas por pessoas que não tem familiaridade com programação ou
processamento de dados, de forma a recrutar outras pessoas com essas habilidades
para ajudar.

2) Facilitar o reuso de préprocessamento de dados

Os dados do ENEM são um dataset grande, que leva tempo para ser baixado e processado. Concentrando
aqui os scripts de processamento, alguém não familiar com o banco de dados pode começar a contribuir 
mais rapidamente.

3) Ser um ambiente de acolhimento para iniciantes

Iniciantes na área de dados podem usar esse repositório para criar explorar mais 
as técnicas e desenvolver habilidades. 


## Contribuindo

O ponto central de comunicação desse repositório é a [lista de issues](https://github.com/eduardobonet/enem_aberto/issues). Qualquer dúvida, 
ideia de pesquisa, preocupação deve ser colocada na lista para que mais pessoas
possam discutir. Da mesma forma, todas as contribuições devem ser atreladas a uma issue.

Encontrou uma issue interessante que você gostaria de trabalhar? Comente que você
quer iniciar o trabalho e crie um [fork](https://docs.github.com/en/get-started/quickstart/fork-a-repo). 

## Mapa do Repositório

- exploracao

Explorações simples, tutorias de como visualizar os dados, etc. Um bom começo 
para iniciantes de familiarizarem com o dataset.

- parsed_data e raw_data

Diretórios auxiliares para o processamento de CSV. Todo o conteúdo é ignorado 
pelo git

- preprocessamento

Scripts SQL que processam os dados originais e criam tabelas auxiliares. Quanto 
mais o processamento acontecer nesse ponto, mais fácil o reuso por outras pessoas.

- analises

Analises a serem feitas, sempre atreladas a uma issue. Cada analise possui seu 
próprio diretório

- util

Pasta com funções auxiliares que podem ajudar na análise

## Linguagens Recomendadas

Para pré processamento de dados e criação de tabelas auxiliares, SQL é a 
linguagem recomendada por ser amplamente conhecida.

Para análise e criação de modelos, fica a cargo do contribuinte escolher entre
usar R ou Python, o que se sentir mais confortável ou tiver as melhores 
bibliotecas.

## Gerando os dados localmente

1) Faça o download dos microdados através [desse link](http://inep.gov.br/microdados)
2) Extraia o .zip e mova os `MICRODADOS_ENEM_(ano).csv` para a pasta `raw_data`. Eles estão localizados na pasta `DADOS`.
4) Na pasta raiz, rode o comando `./create_data.sh` passando como parâmetro os anos os quais gostaria de usar. Por exemplo, caso tenha baixado dados de 2015, 2016 e 2017, o comando seria `./create_data.sh 2015 2016 2017`
5) Os arquivos gerados podem ser encontrados na pasta `parsed_data`


### Criando o banco de dados em PostgreSQL

1) Crie um bando de dados chamado enem

2) A partir da pasta raiz, rode o comando `psql -U seu_usuario -d enem -a -f sql/create_table.sql`

3) Rode o psql (`psql -U seu_usuario -d enem`) e para cada arquivo criado em `parsed_data`, execute o comando `\copy microdados FROM '/caminho/para/seu/projeto/parsed_data/only_answers_2015.csv' DELIMITER ',' CSV HEADER;`




