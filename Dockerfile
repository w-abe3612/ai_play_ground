FROM python:3.11-slim

WORKDIR /app

# 必要なOSパッケージ
RUN apt-get update && apt-get install -y \
    git \
    libgl1 \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# pipアップデート
RUN pip install --upgrade pip

# requirements
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 作業ディレクトリ
COPY . .

# Jupyter起動
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root"]