deploy:
	ssh deploy@${HOST} -p ${PORT} 'rm -rf qbittorrent && mkdir qbittorrent'
	ssh deploy@${HOST} -p ${PORT} 'mkdir qbittorrent/secrets'
	scp -P ${PORT} compose.yml deploy@${HOST}:qbittorrent/compose.yml
	scp -P ${PORT} ./docker/secrets/db_password deploy@${HOST}:qbittorrent/secrets
	ssh deploy@${HOST} -p ${PORT} 'cd qbittorrent && docker compose down --remove-orphans'
	ssh deploy@${HOST} -p ${PORT} 'cd qbittorrent && docker compose pull'
	ssh deploy@${HOST} -p ${PORT} 'cd qbittorrent && docker compose up -d'