# WalkMyDog — Dog walking booking app

A simple Rails application for booking dog walks: manages dogs, dog-sitters and strolls. Good practice for associations and basic CRUD flows.

---

## Features ✅
- Dogs, Dogsitters and Strolls management
- City-based relations
- Simple booking flow and seeds for demo data

## Tech stack 🔧
- Ruby: `ruby-3.4.2`
- Rails: `~> 8.0`
- DB: `sqlite3`
- Testing: Rails test framework + Capybara for system specs

## Quickstart — Docker
```bash
cd walk_my_dog_app
docker build -t walkmydog:dev .
docker run --rm -p 3002:3000 walkmydog:dev
# open http://localhost:3002
```

## Quickstart — Local
```bash
cd walk_my_dog_app
bundle install
bin/rails db:create db:migrate db:seed
bin/rails server -p 3000
```

## Tests
```bash
bin/rails test
bin/rails test:system
```

## Contributing
- Please open issues for bugs and feature requests.
- Send PRs with tests and documentation updates.

## License
Add your project's license here.

---

> Customize this README with screenshots or environment-variable examples as needed.