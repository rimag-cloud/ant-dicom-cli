FROM rimag/dicom-cli:1.0-dcmtk-python

WORKDIR /opt

RUN git clone https://github.com/rimag-cloud/ant-dicom-cli.git

RUN pip install -U setuptools \
    && pip install flask flask-restful APScheduler flasgger pynsq retry PyYAML zc.lockfile SQLAlchemy PyMySQL requests oss2 gunicorn \
    && python obs_v3_0_4_sdk_src/setup.py install \
    && mkdir ipc \
    && mkdir db_cs \
    && mkdir db_ls \
    && chmod +x start.sh

CMD ["./start.sh"]
