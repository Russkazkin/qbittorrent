deploy:
	ssh deploy@${HOST} -p ${PORT} 'rm -rf qbittorrent && mkdir qbittorrent'
	scp -P ${PORT} compose.yml deploy@${HOST}:qbittorrent/compose.yml
	ssh deploy@${HOST} -p ${PORT} 'cd qbittorrent && docker compose down --remove-orphans'
	ssh deploy@${HOST} -p ${PORT} 'cd qbittorrent && docker compose pull'
	ssh deploy@${HOST} -p ${PORT} 'cd qbittorrent && docker compose up -d'