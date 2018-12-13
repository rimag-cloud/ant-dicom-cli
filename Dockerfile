FROM rimag/dicom-cli:1.0-dcmtk-python

WORKDIR /opt

RUN git clone https://github.com/rimag-cloud/ant-dicom-cli.git \
    && cp ant-dicom-cli/start.sh ./ \
    && pip install -U setuptools \
    && pip install flask flask-restful APScheduler flasgger pynsq retry PyYAML zc.lockfile SQLAlchemy PyMySQL requests oss2 gunicorn \
    && cd ant-dicom-cli/obs_v3_0_4_sdk_src \
    && python setup.py install \
    && cd ../.. \
    && mkdir /opt/ipc \
    && mkdir /opt/db_cs \
    && mkdir /opt/db_ls \
    && chmod +x start.sh \
    && rm -rf ant-dicom-cli

CMD ["./start.sh"]
