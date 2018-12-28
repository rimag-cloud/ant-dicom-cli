FROM rimag/dicom-cli:1.0-dcmtk-python-slim-stretch

WORKDIR /opt

RUN apt-get update \
    && apt-get install curl -y \
    && wget https://github.com/rimag-cloud/ant-dicom-cli/archive/master.zip \
    && unzip master.zip \
    && rm -f master.zip \
    && mv ant-dicom-cli-master ant-dicom-cli \
    && cp ant-dicom-cli/start.sh ./ \
    && cp -r ant-dicom-cli/obs_v3_0_4_sdk_src ./ \
    && pip install -U setuptools \
    && pip install flask flask-restful APScheduler flasgger pynsq retry PyYAML zc.lockfile SQLAlchemy PyMySQL requests oss2 gunicorn \
    && cd obs_v3_0_4_sdk_src \
    && python setup.py install \
    && cd .. \
    && mkdir -p /opt/ipc \
    && mkdir -p /opt/db_cs \
    && mkdir -p /opt/db_ls \
    && chmod +x start.sh \
    && rm -rf ant-dicom-cli

CMD ["./start.sh"]
