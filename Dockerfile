FROM python:latest
EXPOSE 5000
RUN useradd -m myapp
USER myapp
ADD . /home/myapp
WORKDIR /home/myapp
RUN pip install --user --no-warn-script-location -r requirements.txt
ENV FLASK_APP=app.py HELLO="Hello World"
ENTRYPOINT ["/home/myapp/entrypoint.sh"]
CMD ["flask", "run", "--host=0.0.0.0"]
