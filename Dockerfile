FROM ubuntu:latest
MAINTAINER Chris Hudson <chris@xetius.com>

RUN apt-get update -y && \
	apt-get install -y python-pip python-dev build-essential
COPY app /app
WORKDIR /app
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD ["app.py"]

