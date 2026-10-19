FROM python:3.12-slim

WORKDIR /app

COPY app/app.py .

RUN python -m py_compile app.py

EXPOSE 8080

CMD ["python", "app.py"]
