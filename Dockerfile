FROM python:3.13.3

WORKDIR /app

COPY . .

RUN pip install --no-cache-dir pip-tools \
 && pip-compile requirements/backend.in -o requirements/backend.txt \
 && pip install --no-cache-dir -r requirements/backend.txt

# Expose the app port
EXPOSE 8080

# Run your app
CMD ["uvicorn", "spaceship.main:app", "--host=0.0.0.0", "--port=8080"]
