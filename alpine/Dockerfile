FROM rimag/dicom-cli:1.0-dcmtk-python-apline

WORKDIR /opt

RUN wget https://github.com/rimag-cloud/ant-dicom-cli/archive/master.zip \
    && unzip master.zip \
    && rm -f master.zip \
    && mv ant-dicom-cli-master ant-dicom-cli \
    && cp ant-dicom-cli/start.sh ./ \
    && pip install -U setuptools \
    && pip install flask flask-restful APScheduler flasgger pynsq retry PyYAML zc.lockfile SQLAlchemy PyMySQL requests oss2 gunicorn \
    && python ant-dicom-cli/obs_v3_0_4_sdk_src/setup.py install \
    && mkdir -p /opt/ipc \
    && mkdir -p /opt/db_cs \
    && mkdir -p /opt/db_ls \
    && chmod +x start.sh \
    && rm -rf ant-dicom-cli

CMD ["./start.sh"]
