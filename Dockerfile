FROM python:3.6.9-stretch as base
#Stage para instalar y compilar dependencias de nuestro proyecto
FROM base as builder

RUN mkdir /install

WORKDIR /install

COPY requirements.txt .

RUN pip install --install-option="--prefix=/install" -r requirements.txt


FROM base

COPY --from=builder /install /usr/local

RUN groupadd -g 1000 appuser \
    && useradd --no-log-init --shell /bin/bash -u 1000 -g 1000 -o -c "" -m appuser \
    && cp -r /etc/skel/. /home/appuser \
    && chown -R 1000:1000 /home/appuser

USER appuser

RUN mkdir /home/appuser/bottleapp

WORKDIR /home/appuser/bottleapp

COPY . .

ENTRYPOINT [ "python3" ]

CMD [ "main.py" ]