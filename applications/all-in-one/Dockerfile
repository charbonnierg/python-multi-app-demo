FROM registry.access.redhat.com/ubi8/python-39

USER 0

COPY dist/ /tmp/wheels

RUN python3 -m venv /opt/supervisord --upgrade \
    && /opt/supervisord/bin/pip install --no-cache-dir app1 app2 all-in-one --find-links=/tmp/wheels \
    && rm -Rf /tmp/wheels

RUN mkdir -p /etc/supervisord \
    && chown -R 1001:0 /etc/supervisord \
    && mkdir -p /var/supervisord/app1 \
    && mkdir -p /var/supervisord/app2 \
    && mkdir -p /var/supervisord/all-in-one \
    && chown -R 1001:0 /var/supervisord

ENV PATH=/opt/supervisord/bin:$PATH

COPY supervisord/configs/*.conf /etc/supervisord/.
COPY supervisord/entrypoint.sh /usr/local/bin/entrypoint.sh

USER 1001

ENV SUPERVISORD_HOME=/etc/supervisord

ENTRYPOINT /usr/local/bin/entrypoint.sh
