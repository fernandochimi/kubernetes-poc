FROM python:3.7.7

RUN echo "America/Sao_Paulo" > /etc/timezone

RUN mkdir -p /kubernetes-poc

WORKDIR /kubernetes-poc

COPY ./requirements.txt /kubernetes-poc/

RUN pip install -r requirements.txt

ADD . /kubernetes-poc/

EXPOSE 8000
ENV PYTHONPATH "${PYTHONPATH}:/kubernetes-poc"
CMD ["uvicorn", "src.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]