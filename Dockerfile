FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

RUN mkdir -p instance static/avatars

ENV SECRET_KEY=change-me-in-production
ENV DATABASE_URL=sqlite:///budget.db

EXPOSE 5000

CMD ["python", "run.py"]
