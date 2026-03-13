# 🚀 Harshit Tiwari — Django Portfolio

A modern, fully dynamic personal portfolio website built with **Django**, featuring a stunning dark-themed UI with glassmorphism effects, smooth animations, and an admin-driven content management system.

---

## ✨ Features

- **🎯 Fully Dynamic** — All content managed via Django Admin (no hardcoding needed)
- **🌑 Dark Mode UI** — Premium dark theme with purple/pink gradient accents
- **📱 Fully Responsive** — Mobile-first design using Bootstrap 5.3
- **⚡ Smooth Animations** — AOS scroll animations, typewriter effect, skill bar animations, counter animations
- **📄 Resume Banner** — Auto-shows a sticky top banner when a resume is uploaded
- **📬 Contact Form** — Stores messages directly in the database, viewable from admin
- **🖼️ Project Modal** — Featured projects open in a modal with full details
- **🏆 Fresher Mode** — Automatically shows a "Fresh Talent" card if no experience entries exist

---

## 📄 Pages

| Page | URL | Description |
|------|-----|-------------|
| Home | `/` | Hero, Stats, Skills preview, Featured Projects, Services, Testimonials |
| About | `/about/` | Bio, Education, Certificates, Experience summary |
| Skills | `/skills/` | All skills grouped by category with progress bars |
| Projects | `/projects/` | All projects with status filter (Completed / Ongoing / Concept) |
| Project Detail | `/projects/<id>/` | Single project deep-dive with related projects |
| Experience | `/experience/` | Full career timeline & education |
| Contact | `/contact/` | Contact form with real-time validation |

---

## 🗂️ Project Structure

```
django_portfolio/
├── main/                   # Core Django app
│   ├── models.py           # All data models
│   ├── views.py            # View logic for all pages
│   ├── urls.py             # URL routing
│   └── admin.py            # Admin panel configuration
├── portfolio/              # Django project settings
│   ├── settings.py
│   └── urls.py
├── templates/
│   ├── base.html           # Base layout (navbar, footer, banner)
│   └── main/
│       ├── home.html
│       ├── about.html
│       ├── skills.html
│       ├── projects.html
│       ├── project_detail.html
│       ├── experience.html
│       └── contact.html
├── media/                  # Uploaded files (avatar, resume, project images)
├── manage.py
└── requirements.txt
```

---

## 🗃️ Data Models

| Model | Purpose |
|-------|---------|
| `Profile` | Personal info, social links, avatar, resume upload |
| `Skill` | Skills with category, proficiency %, Bootstrap icon |
| `Project` | Portfolio projects with tech stack, demo/GitHub links |
| `Experience` | Work history with company, role, date range |
| `Education` | Degrees, institutions, GPA |
| `Service` | Services offered (shown on home page) |
| `Testimonial` | Client/peer reviews with star ratings |
| `Certificate` | Certifications with issuer and credential URL |
| `Contact` | Stores messages submitted via the contact form |

---

## 🛠️ Tech Stack

- **Backend** — Python 3, Django 4.2+
- **Frontend** — HTML5, CSS3, Bootstrap 5.3, Bootstrap Icons
- **Fonts** — Google Fonts (Space Grotesk, Syne)
- **Animations** — AOS (Animate On Scroll), GSAP, CountUp.js
- **Database** — SQLite (default, easy to switch to PostgreSQL)
- **Media** — Pillow for image handling

---

## ⚙️ Setup & Installation

### 1. Clone the repository

```bash
git clone https://github.com/harshit519/django_portfolio.git
cd django_portfolio
```

### 2. Create a virtual environment

```bash
python -m venv venv
source venv/bin/activate        # Linux / macOS
venv\Scripts\activate           # Windows
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Apply migrations

```bash
python manage.py migrate
```

### 5. Create a superuser (for admin access)

```bash
python manage.py createsuperuser
```

### 6. Run the development server

```bash
python manage.py runserver
```

Visit **http://127.0.0.1:8000/** to see the portfolio.  
Visit **http://127.0.0.1:8000/admin/** to manage all content.

---

## 🎛️ Admin Panel Guide

Log in at `/admin/` and populate the following models in order:

1. **Profile** — Add your name, title, bio, social links, avatar image, and resume PDF
2. **Skills** — Add skills with category (Frontend / Backend / DevOps etc.) and proficiency %
3. **Projects** — Add projects, mark favourites as **Featured** to show them on the home page
4. **Experience** — Add work history (leave empty to auto-enable "Fresher" mode on home)
5. **Education** — Add your degrees
6. **Services** — Add services you offer (shown in the Services section on home)
7. **Testimonials** — Add client reviews, check **Featured** to show on home page
8. **Certificates** — Add certifications with links

> 💡 **Tip:** Upload a resume PDF in the Profile model to automatically activate the sticky resume banner and resume button throughout the site.

---

## 🎨 UI / Design Highlights

- **Color palette** — Deep dark `#0A0A0F` background, `#6C63FF` primary purple, `#FF6584` accent pink
- **Typography** — [Syne](https://fonts.google.com/specimen/Syne) for headings, [Space Grotesk](https://fonts.google.com/specimen/Space+Grotesk) for body
- **Cards** — Glassmorphism-style dark cards with hover lift animations
- **Skill bars** — Animated on scroll with smooth width transitions
- **Counters** — CountUp.js animations triggered on viewport entry
- **Typewriter** — Rotating title animation in the hero section
- **Avatar** — Morphing blob border-radius animation

---

## 📦 Dependencies

```
Django>=4.2
Pillow>=10.0
```

CDN libraries (no installation needed):
- Bootstrap 5.3.3
- Bootstrap Icons 1.11.3
- AOS 2.3.4
- GSAP 3.12.5
- CountUp.js 2.8.0

---

## 📸 Home Page Scroll Order

1. **Hero** — Name, title typewriter, CTA buttons, social links
2. **Stats** — Animated counters (Years Exp / Projects / Clients / Coffee)
3. **Skills** — Top skills with progress bars
4. **Featured Projects** — Cards with modal preview
5. **Services** — What you offer
6. **Testimonials** — Carousel of reviews
7. **CTA** — "Let's Work Together" call-to-action

---

## 🤝 Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you'd like to change.

---

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

> Built with ❤️ and Django by **Harshit Tiwari**
