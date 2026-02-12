# FreeDoc — Doctor & Appointments scheduler

A small Rails application to manage doctors, patients and appointments (doctor ↔ patient via appointments). Designed for learning and demo purposes.

---

## Key features ✅
- Create/read/update/delete doctors, patients and appointments
- Simple associations: Doctor has_many :patients through appointments
- Seed data available (Faker)

## Tech stack 🔧
- Ruby: `ruby-3.4.2`
- Rails: `~> 8.0`
- Database: `sqlite3` (development)
- Testing: Rails built-in test suite + Capybara for system tests

## Prerequisites ⚠️
- Ruby 3.4.2 (rbenv/rvm/asdf recommended)
- Bundler
- Node / esbuild not required (uses importmap)
- Docker (optional)

## Quickstart — Docker (recommended) 🐳
Build and run using the app's Dockerfile:

```bash
# from repository root
cd free_doc_app
docker build -t freedoc:dev .
docker run --rm -p 3000:3000 -e RAILS_ENV=development freedoc:dev
```

## Quickstart — Local
```bash
cd free_doc_app
bundle install
bin/rails db:create db:migrate db:seed
bin/rails server
# app available at http://localhost:3000
```

## Database
- Run migrations: `bin/rails db:migrate`
- Seed data: `bin/rails db:seed`

## Tests
Run the test suite (Minitest):
```bash
bin/rails test
```
System tests (uses Capybara):
```bash
bin/rails test:system
```

## Security & linting
- Run Brakeman: `bundle exec brakeman`
- Run RuboCop (omakase): `bundle exec rubocop`

## Deployment
This project includes `kamal` for Docker-based deployments — see `Dockerfile` and `config/*` for environment settings.

## Contributing
- Fork, create a feature branch and open a PR.
- Run tests locally before submitting.

## License
Specify your license here (e.g. MIT). Replace this section with project-specific license.

---

> Notes: Edit this README to add screenshots, environment variables, or CI badges as needed.