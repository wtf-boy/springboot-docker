#!/bin/bash
java ${JAVA_OPTS} -jar -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/dump/heapdump.hprof /app.jar --spring.profiles.active=${PROFILE} ${APP_OPTS}
exec "$@"