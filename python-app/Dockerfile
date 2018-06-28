FROM python:3.6

RUN mkdir python-app
WORKDIR python-app
COPY . .

RUN pip install -r requirements.txt

EXPOSE 5000

CMD python app/hello_world.py
