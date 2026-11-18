FROM python:3.11.10

WORKDIR /app

RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple

ADD . /app

RUN pip install -r requirements.txt

#   移除opencv-python安装opencv-python-headless解决缺少libGL.so
RUN pip uninstall opencv-python -y

RUN pip install opencv-python-headless

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]