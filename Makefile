image:
	docker build -t tuxtimo.me .

container:
	docker run -d -p 8080:80 tuxtimo.me
