all:
	docker build -t johnweldon/dnsutils:latest .


push: all
	docker push johnweldon/dnsutils:latest
