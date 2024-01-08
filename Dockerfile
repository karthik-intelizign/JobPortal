FROM python:3.9

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /JobPortal

# update and install Django
RUN pip install --upgrade pip
RUN python -m pip install Django

COPY . /JobPortal/

RUN rm -rf Dockerfile

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
