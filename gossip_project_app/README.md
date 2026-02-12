# Gossip — Social gossips & tagging app

A Rails demo app for posting "gossips" (short posts), tagging, comments, likes and private messages. Intended as a full-stack exercise with associations and polymorphic relations.

---

## Overview ✨
- Users can create gossips, comment and like (polymorphic associations)
- Tagging system with join table
- Private messaging between users

## Schema highlights
- Users, Gossips, Tags, Comments, Likes (polymorphic), PrivateMessages
- Cities table for user location

## Tech stack 🔧
- Ruby: `ruby-3.4.2`
- Rails: `~> 8.0`
- DB: `sqlite3` (development)
- Testing: Minitest + Capybara

## Prerequisites ⚠️
- Ruby 3.4.2
- Bundler
- Docker (optional)

## Quickstart — Docker
```bash
cd gossip_project_app
docker build -t gossip:dev .
docker run --rm -p 3001:3000 gossip:dev
# open http://localhost:3001
```

## Quickstart — Local
```bash
cd gossip_project_app
bundle install
bin/rails db:create db:migrate db:seed
bin/rails server -p 3000
```

## Tests
```bash
bin/rails test
bin/rails test:system
```

## Useful commands
- Run console: `bin/rails console`
- Reset DB: `bin/rails db:drop db:create db:migrate db:seed`

## Contributing
- Add examples to `test/` when you add features
- Follow RuboCop suggestions

## License
Add your license info here.

---

> Tip: update this README with screenshots and API examples if you expose endpoints.