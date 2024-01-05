FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /JobPortal

COPY requirements.txt /JobPortal/
RUN pip install --upgarde pip
RUN pip install -r requirements.txt

COPY . /JobPortal/

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]