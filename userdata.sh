#! /bin/bash
sudo yum update -y
sudo amazon-linux-extras install epel -y
sudo yum install git -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
sudo yum install -y  python3-pip
python3 -m pip install --user --upgrade pip 
python3 -m pip install ansible


# docker run -it --rm --user "$(id -u):$(id -g)" -v "$PWD":/usr/src/app -w /usr/src/app django django-admin.py startproject mysite
# echo 'ALLOWED_HOSTS = ['*']' >> /home/ec2-user/mysite/mysite/settings.py

# cat <<EOF > /home/ec2-user/mysite/Dockerfile
# FROM python:3.9.5-slim
# ENV PYTHONUNBUFFERED 1
# RUN mkdir /code
# WORKDIR /code
# COPY requirements.txt /code/
# RUN pip install --user -r requirements.txt
# COPY . /code/
# CMD python manage.py runserver 0.0.0.0:8000
# EOF

# echo "Django==3.2" > /home/ec2-user/mysite/requirements.txt

# docker build -t my-django-image /home/ec2-user/mysite/.

# docker run --name django-app -p 80:8000 -d my-django-image







