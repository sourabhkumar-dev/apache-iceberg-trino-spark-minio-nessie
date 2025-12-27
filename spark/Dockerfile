FROM apache/spark:3.5.2

ENV SPARK_HOME=/opt/spark
ENV PATH=$SPARK_HOME/bin:$PATH

RUN mkdir -p $SPARK_HOME/jars

# Iceberg
ADD https://repo1.maven.org/maven2/org/apache/iceberg/iceberg-spark-runtime-3.5_2.12/1.9.0/iceberg-spark-runtime-3.5_2.12-1.9.0.jar $SPARK_HOME/jars/

# Hadoop AWS
ADD https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/3.3.6/hadoop-aws-3.3.6.jar $SPARK_HOME/jars/
ADD https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-bundle/1.12.665/aws-java-sdk-bundle-1.12.665.jar $SPARK_HOME/jars/

EXPOSE 7077 8080

# ✅ Run Spark Master (LONG RUNNING)
CMD ["/opt/spark/bin/spark-class", "org.apache.spark.deploy.master.Master"]
