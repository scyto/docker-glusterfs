FROM debian:11.7-slim

RUN apt-get update && apt-get install --no-install-recommends --yes glusterfs-server

ARG GLUSTERD_LOG_LEVEL
ARG GLUSTERD_LOG_FILE
ARG GLUSTERD_OPTIONS
ENV GLUSTERD_LOG_LEVEL="${GLUSTERD_LOG_LEVEL:-INFO}" GLUSTERD_LOG_FILE="${GLUSTERD_LOG_FILE:--}" GLUSTERD_OPTIONS="${GLUSTERD_OPTIONS:-}"

CMD /usr/sbin/glusterd --log-level $GLUSTERD_LOG_LEVEL --log-file $GLUSTERD_LOG_FILE --no-daemon $GLUSTERD_OPTIONS
