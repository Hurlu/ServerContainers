FROM docker.io/jaedb/iris:3.70

# needed to install packages & launch supervisord: will neeed to switch-back to non-root after installs
USER root

RUN apt update \
 && apt install -yq --no-install-recommends \
    inotify-tools nano supervisor


#switching back from root to run entry scripts
USER mopidy:audio

RUN python3 -m pip install --no-cache --upgrade Mopidy-Party

COPY --chown=user:mopidy --chmod=077 ./copy_docker/scripts /var/lib/mopidy/scripts/
COPY ./copy_docker/supervisord/supervisord.conf /etc/supervisor/conf.d/.

RUN /var/lib/mopidy/scripts/pulse_cookie.sh
RUN mkdir /var/lib/mopidy/media /var/lib/mopidy/logs

# override parent image entrypoint script, which needs to be run as user
ENTRYPOINT ["/usr/bin/dumb-init"]
#ENTRYPOINT ["/bin/bash"]

# back to root for supervisorD
USER root
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
