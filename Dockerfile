FROM python:3.13-slim

WORKDIR /app

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY data_collector/ ./data_collector/
COPY data_analyzer/ ./data_analyzer/
COPY tests/ ./tests/
COPY pytest.ini .
COPY scheduler.py .

CMD ["uvicorn", "data_collector.main:app", "--host", "0.0.0.0", "--port", "8000"]
