# Project19

## FIXME

- [ ] Auto reload changes are not working in development

## Usage

Start Server
```
bundle exec puma -p 7002
```

Start Sidekiq
```
bundle exec sidekiq -r ./app/workers/worker_one.rb
```
