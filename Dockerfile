FROM python:3.13.0b4-slim

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

ENV FLASK_APP=server.py

ENTRYPOINT [ "flask" ]

CMD ["run", "--host", "0.0.0.0"]
