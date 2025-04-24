FROM python:3.13.3

WORKDIR /app

COPY requirements/ requirements/

RUN pip install --no-cache-dir pip-tools \
 && pip-compile requirements/backend.in -o requirements/backend.txt \
 && pip install --no-cache-dir -r requirements/backend.txt

COPY spaceship/ spaceship/
COPY build/ build/

EXPOSE 8080

CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]