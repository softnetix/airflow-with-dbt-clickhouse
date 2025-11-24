FROM apache/airflow:3.0.2

COPY requirements-base.txt /requirements-base.txt

USER root
RUN apt-get update \
    && apt-get install -y --no-install-recommends gcc libpq-dev \
    && rm -rf /var/lib/apt/lists/*

USER airflow
RUN pip install --no-cache-dir --upgrade pip \
    && pip install --no-cache-dir -r /requirements-base.txt
