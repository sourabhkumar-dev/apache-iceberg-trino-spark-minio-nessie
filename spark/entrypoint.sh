#!/bin/sh
set -e

# Install Python dependencies


# Write Spark default configuration using REST catalog
cat <<EOF >> /opt/spark/conf/spark-defaults.conf

# S3 / MinIO configuration
spark.hadoop.fs.s3a.endpoint=${CATALOG_S3_ENDPOINT}
spark.hadoop.fs.s3a.access.key=${AWS_ACCESS_KEY_ID}
spark.hadoop.fs.s3a.secret.key=${AWS_SECRET_ACCESS_KEY}
spark.hadoop.fs.s3a.path.style.access=true
spark.hadoop.fs.s3a.connection.ssl.enabled=false
EOF

# DO NOT use spark-submit
CMD ["tail", "-f", "/dev/null"]


exec jupyter notebook \
    --ip=0.0.0.0 \
    --port=8888 \
    --no-browser \
    --allow-root \
    --NotebookApp.token='' \
    --NotebookApp.password=''
