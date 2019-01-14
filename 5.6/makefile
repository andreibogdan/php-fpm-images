name = optaros-php
registry = optaros/php
version = 5.6-apache
 
lib = ./dockerfiles

build: dockerfile
	docker build --rm -t $(name):$(version) .
	docker tag -f $(name):$(version) $(name):latest
 	
dockerfile: $(lib)/*.m4
	m4 --prefix-builtins -I $(lib) $(lib)/Dockerfile.m4 > Dockerfile

run:
	docker run -i -t -e VIRTUAL_HOST=$(name)-$(version).docker $(name):$(version)

push: build
	docker tag $(name):$(version) $(registry):$(version)
	docker push $(registry):$(version)	
clean:
	rm -f Dockerfile
	docker rmi $(name):$(version) 
	docker rmi $(registry):$(version)
