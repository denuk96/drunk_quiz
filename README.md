# DRUNK QUIZ
- ruby 2.7.2
- rails 6.1
- postgre 13.2
- redis 6.2

##### How to run this?
to build containers: 
<br>
`docker-compose build`

to fetch gems:
<br>
`docker-compose exec app bundle install`

to setup db:
<br>
`docker-compose exec app rake db:setup`
<br>
`docker-compose exec app rake db:migrate`

to run app:
<br>
`docker-compose up`

to run webpack dev server:
<br>
`docker-compose exec app ./bin/webpack-dev-server`

to run console:
<br>
`docker-compose exec app rails c`

just get into command line:
<br>
`docker-compose exec app sh`
