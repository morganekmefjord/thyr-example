
SHELL := /bin/bash
hello :
	echo "hello world"

convert :
	docker run -v $(pwd)/images:/images --rm -it v4tech/imagemagick \
        convert -negate -lat 300x300+0.3% -negate /images/$(img) /images/output.jpg
