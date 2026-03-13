#!/bin/bash
echo "======================================"
echo "  Harshit Tiwari — Portfolio Setup"
echo "======================================"

pip install -r requirements.txt

echo ""
echo "→ Running migrations..."
python manage.py makemigrations
python manage.py migrate

echo ""
echo "→ Loading your portfolio data..."
python manage.py loaddata fixtures/initial_data.json

echo ""
echo "→ Creating admin user..."
python manage.py shell -c "
from django.contrib.auth.models import User
if not User.objects.filter(username='admin').exists():
    User.objects.create_superuser('admin', 'tiwariharshit139@gmail.com', 'admin123')
    print('Admin created: admin / admin123')
else:
    print('Admin already exists')
"

echo ""
echo "======================================"
echo "  ✅ Setup Complete!"
echo "======================================"
echo "  Run:   python manage.py runserver"
echo "  Site:  http://127.0.0.1:8000/"
echo "  Admin: http://127.0.0.1:8000/admin/"
echo "  Login: admin / admin123"
echo "======================================"
echo ""
echo "  📌 NOTE: Upload your resume PDF at:"
echo "  Admin → Profile → Resume field"
echo "======================================"
