#!/bin/bash
mopidy local scan
inotifywait -m /var/lib/mopidy/media -e create -e moved_to -e delete |
    while read dir action file; do
        mopidy local scan
    done
