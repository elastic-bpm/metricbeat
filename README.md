# metricbeat
Metricbeat docker container

Start with:
```
docker run --rm -it --pid=host --volume=/proc:/hostfs/proc:ro --volume=/sys/fs/cgroup:/hostfs/sys/fs/cgroup:ro --volume=/:/hostfs:ro --net=host elastic-bpm/metricbeat
```