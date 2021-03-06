FROM python:3.7-alpine
RUN mkdir /opt/app
COPY src/main.py /opt/app/
COPY requirements.txt /opt/app/
RUN pip install -r /opt/app/requirements.txt

EXPOSE 5001
ENTRYPOINT ["python", "/opt/app/main.py"]
