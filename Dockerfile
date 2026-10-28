FROM alpine:3.19
RUN echo "App container built successfully" > /app.txt
CMD ["cat", "/app.txt"]
