# rails-app-DB-project-THP — Rails app collection

This repository contains three Rails learning/demo applications. Each app is self-contained and has its own `README.md` with setup and usage instructions.

## Projects
- `free_doc_app` — Doctor / Patient / Appointment demo (CRUD, associations)
- `walk_my_dog_app` — Dog sitter & stroll booking demo
- `gossip_project_app` — Social "gossips" app with tagging, comments and likes

## Quickstart
To run any app locally:
```bash
cd <app_folder>
bundle install
bin/rails db:create db:migrate db:seed
bin/rails server
```
Replace `<app_folder>` with `free_doc_app`, `walk_my_dog_app` or `gossip_project_app`.

## Docker
Each app includes a `Dockerfile` — build and run from the respective folder:
```bash
cd free_doc_app
docker build -t freedoc:dev .
docker run --rm -p 3000:3000 freedoc:dev
```

## Contributing
- Open issues and pull requests per-app.
- Keep changes isolated to the app you are working on.

## Contact
Provide maintainer/contact info here.

---

See each app folder for a full, app-specific README.