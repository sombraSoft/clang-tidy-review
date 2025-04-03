FROM openroad/ubuntu22.04-dev:latest

RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt-get install -y --no-install-recommends\
    build-essential cmake git \
    tzdata \
    clang-tidy-14 \
    clang-tidy-15 \
    python3 \
    python3-pip \
    libomp-15-dev \
    && rm -rf /var/lib/apt/lists/

COPY . /clang_tidy_review/

RUN python3 -m pip install --upgrade pip && \
    python3 -m pip install /clang_tidy_review/post/clang_tidy_review

ENTRYPOINT ["review"]
