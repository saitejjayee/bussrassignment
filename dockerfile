FROM python:2.7.11-slim
RUN pip install --upgrade pip
RUN pip install requests flask
RUN mkdir mypyapp
COPY sourcecode.py mypyapp/
WORKDIR mypyapp
EXPOSE 3000
ENTRYPOINT ["python", "sourcecode.py"]