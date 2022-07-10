docker: Dockerfile
	cd ../simpleton && \
	docker build -t simpleton \
    --build-arg TIME_ZONE=US/Arizona \
    .
	docker build -t badun .

