FROM python:latest
EXPOSE 5000
RUN useradd -m myapp
ADD . /home/myapp
WORKDIR /home/myapp
RUN chown -R myapp.myapp /home/myapp
USER myapp
RUN pip install --user --no-warn-script-location -r requirements.txt
ENV FLASK_APP=app.py HELLO="Hello World"
USER myapp
ENTRYPOINT ["/home/myapp/entrypoint.sh"]
CMD ["flask", "run", "--host=0.0.0.0"]
