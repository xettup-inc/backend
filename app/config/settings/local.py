from .base import *
from .base import env

DEBUG = True

SECRET_KEY = env('PROTOTYPE_DJANGO_SECRET_KEY', default='PB3aGvTmCkzaLGRAxDc3aMayKTPTDd5usT8gw4pCmKOk5AlJjh12pTrnNgQyOHCH')

ALLOWED_HOSTS = [
    "localhost",
    "0.0.0.0",
    "127.0.0.1",
]

INSTALLED_APPS += ['django_extensions', 'naomi']

EMAIL_BACKEND = "naomi.mail.backends.naomi.NaomiBackend"
EMAIL_FILE_PATH = "/home/test/tmp"

CORS_ORIGIN_WHITELIST = (
    'http://localhost:3000',
    'http://localhost:8000',
)