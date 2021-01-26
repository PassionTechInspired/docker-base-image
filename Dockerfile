FROM docker

ARG BUILDX_VERSION=0.5.1
ARG EARTHLY_VERSION=0.4.3

RUN apk --no-cache add wget ruby-dev

# Install Dpl
RUN gem install dpl

# Install buildx
RUN wget -O docker-buildx https://github.com/docker/buildx/releases/download/v${BUILDX_VERSION}/buildx-v${BUILDX_VERSION}.linux-amd64 && \
    mkdir -p ~/.docker/cli-plugins/ && \
    mv docker-buildx ~/.docker/cli-plugins/docker-buildx && \
    chmod a+x ~/.docker/cli-plugins/docker-buildx

# Install Earthly
RUN wget https://github.com/earthly/earthly/releases/download/v${EARTHLY_VERSION}/earthly-linux-amd64 -O /usr/local/bin/earthly && \
    chmod +x /usr/local/bin/earthly
