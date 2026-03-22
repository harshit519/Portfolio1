# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
# Setup
python -m venv venv && source venv/bin/activate
pip install -r requirements.txt
python manage.py migrate
python manage.py createsuperuser
python manage.py runserver

# Database
python manage.py makemigrations
python manage.py migrate

# Production (uses settings_production.py)
DJANGO_SETTINGS_MODULE=portfolio.settings_production python manage.py collectstatic
gunicorn -c gunicorn_config.py portfolio.wsgi:application
```

There is no test suite yet — `main/tests.py` exists but is empty.

## Architecture

Single Django app (`main`) with an admin-driven CMS. All portfolio content is managed through `/admin/` — nothing is hardcoded in templates.

**Settings:** `portfolio/settings.py` (dev, SQLite, DEBUG=True) and `portfolio/settings_production.py` (production, PostgreSQL, WhiteNoise, HTTPS enforcement). The production settings use `python-decouple` to read from `.env`. See `.env.example` for required variables.

**URL routing:**

| Route | View |
|-------|------|
| `/` | `home` — featured projects (max 3), services, top skills, featured testimonials |
| `/about/` | `about` — bio, experience, education, certificates |
| `/skills/` | `skills` — all skills grouped by category |
| `/projects/` | `projects` — all projects; supports `?filter=completed/ongoing/concept` |
| `/projects/<pk>/` | `project_detail` — single project + related projects |
| `/experience/` | `experience` — work & education timeline |
| `/contact/` | `contact` — GET renders form, POST saves to `Contact` model |

**Models** (all in `main/models.py`):
- `Profile` — singleton-style; views call `get_profile()` helper that returns the first entry
- `Skill` — category choices: Frontend, Backend, Database, DevOps, Tools, Design; `proficiency` field is 0–100
- `Project` — `featured=True` shows on homepage; `status` choices: Completed, Ongoing, Concept
- `Experience` / `Education` — if no `Experience` rows exist, views automatically render "Fresher mode" with a preset strengths list
- `Testimonial` — `featured=True` shows on homepage
- `Contact` — stores contact form submissions; readable in admin via `ContactAdmin`
- `Certificate`, `Service`

**Fresher mode:** Triggered automatically in `home`, `about`, and `experience` views when `Experience.objects.all()` is empty.

**Resume banner:** A sticky top banner auto-appears when a PDF is uploaded to `Profile.resume`.

**Frontend:** Bootstrap 5.3 + Bootstrap Icons loaded from CDN. Animation libraries (AOS, GSAP, CountUp.js) also via CDN. No build step required. Templates are in `templates/base.html` (shared layout) and `templates/main/`.

**Media files:** Uploaded files (avatars, project images, certificates, resumes) go to `media/` subdirectories. In development, served by Django via `static()` in `portfolio/urls.py`.

**Docker:** `Dockerfile` and `docker-compose.yml` available for containerized deployment targeting DigitalOcean (see `PRODUCTION_DEPLOYMENT.md`).
