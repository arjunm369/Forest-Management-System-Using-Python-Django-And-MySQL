# Forest Management System

Simple Django-based academic project for managing forest information, flora, fauna, news, awareness programs, entry passes, product records, and basic user access.

## Description

This project is a small forest management portal built with Django and server-rendered templates. It includes role-based login for admin, department staff, and users, plus basic CRUD pages for forest records and related content. The project is intentionally kept simple so it is easy to understand, run, and present on GitHub.

## Features

- User registration and login
- Role-based navigation for admin, department, and user accounts
- Add, edit, delete, and list forest records
- Manage flora and fauna entries for each forest
- Publish news and awareness programs
- Manage product categories and product listings
- Create and track entry pass requests
- View user profiles and update passwords
- Basic product and payment pages
- Static pages such as About, Gallery, and Contact

## Tech Stack

- Python 3
- Django 3.2.13
- SQLite by default
- HTML, CSS, JavaScript
- Bootstrap-based static templates

## Project Structure

```text
Forest-Management-System-Using-Python-Django-And-MySQL/
|-- manage.py
|-- requirements.txt
|-- README.md
|-- forest/
|   |-- settings.py
|   |-- urls.py
|   |-- wsgi.py
|-- department/
|   |-- models.py
|   |-- views.py
|   |-- urls.py
|   |-- templates/
|   |-- static/
|-- forest.sql
```

Note: the repository also contains an older copied project folder inside `forest/`. For a cleaner repository, keep one active project root and remove the duplicate copy when you are ready.

## How to Run

1. Create and activate a virtual environment.

```bash
python -m venv venv
venv\Scripts\activate
```

2. Install dependencies.

```bash
pip install -r requirements.txt
```

3. Apply migrations.

```bash
python manage.py makemigrations
python manage.py migrate
```

4. Run the development server.

```bash
python manage.py runserver
```

5. Open the site in your browser.

```text
http://127.0.0.1:8000/
```

## Demo Logins

After running migrations, you can use these default accounts:

- Admin: `admin` / `admin`
- Department: `department` / `department`

## Optional: Using the Legacy MySQL Dump

The repository includes `forest.sql` as the original database dump. The project now runs with SQLite by default, so you do not need MySQL to start it. If you want to use the legacy dump for demo data, you can import it into MySQL and point `forest/settings.py` back to a MySQL database.

## Current Limitations

- Passwords are stored in plain text in the custom login table.
- There is very little form validation and error handling.
- Most pages are demo-style CRUD screens rather than a production workflow.
- The project does not include automated tests.
- Access control is basic and should be improved before real-world use.

## Future Improvements

- Replace the custom login flow with Django authentication
- Hash passwords properly
- Add form validation and user-friendly error messages
- Add tests for the main CRUD flows
- Remove duplicate project copies and keep only one clean root folder
- Improve the UI with a consistent header, better spacing, and clearer tables

## Resume Highlights

- Built a Django-based forest management portal with role-based login and CRUD workflows for forests, flora, fauna, news, programs, and products.
- Converted an academic MySQL-dependent project into a simpler SQLite-ready version to make setup easier for reviewers and recruiters.
- Organized the project documentation and setup steps so the app is easier to run, understand, and demo.