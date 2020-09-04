FROM alpine:latest
LABEL org.opencontainers.image.url="https://github.com/president-business-corp/"
ARG BRANCH=main-enterprise
LABEL org.opencontainers.image.source="https://github.com/president-business-corp/multi-arch-test"
LABEL org.opencontainers.image.description="Test image for multi-architecture images"
CMD ["ash"]
