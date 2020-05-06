FROM python:3.7-alpine
RUN mkdir /opt/app
COPY src/main.py /opt/app/
COPY requirements.txt /opt/app/
RUN pip install -r /opt/app/requirements.txt
COPY docker-entrypoint.sh /

EXPOSE 5001
ENTRYPOINT "/docker-entrypoint.sh"