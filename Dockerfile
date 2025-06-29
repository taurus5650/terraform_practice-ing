FROM python:3.13-slim
LABEL authors="shyin.lim"

RUN apt update && apt install -y \
    wget unzip make \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY . /app
WORKDIR /app

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["python", "run.py"]