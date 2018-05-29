###Features
1. For each original URL sent create unique short URL (POST app.ly/links)
2. Visiting a short url should redirect to the original URL
###Remarks
Do not over complicate the implementation. Just make sure you follow all the standards that you’d follow in a real project.
- Must have tests
- Must pass rubocop
- Should run in docker

###How to build and run
```bash
docker-compose build
```
run to make a db
```bash
  docker-compose run url_shortener  bundle exec rake db:migrate
```

```bash
docker-compose up -d 
```