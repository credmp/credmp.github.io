all: site

site:
	./build.sh

site-container:
	docker run -ti --network host -v $(pwd):/workspace iquiw/alpine-emacs sh -c "cd /workspace; ./build.sh"

clean:
	rm -rf public/*
