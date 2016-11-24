default: run

build:
	docker build -t drydocker .

PORT ?= 8000

run: build
	docker rm -f drydocker || true
	docker run \
		--env "AUTHORIZED_KEYS=$$AUTHORIZED_KEYS" \
		--env "PRIVATE_KEY=$$PRIVATE_KEY" \
		--port $(PORT):22 \
		--name drydocker
		--detach \
		drydocker

exec:
	docker exec -it drydocker sh

logs:
	docker logs -f drydocker
