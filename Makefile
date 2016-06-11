sonarr:
	docker run \
		-d \
		--name sonarr \
		--add-hosts=plex:`ip route | awk '/docker0/ { print $$NF }'` \
		-p 8989:8989 \
		-v /mnt/plex/Downloads:/data/completed \
		-v /mnt/plex/TV:/data/media \
		-v /mnt/plex/config:/config \
		mevatron/sonarr
