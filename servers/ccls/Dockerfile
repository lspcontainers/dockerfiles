FROM alpine as builder

RUN apk add --no-cache clang17-dev clang17-static llvm17-dev llvm17-static llvm17-gtest cmake make git
RUN git clone --depth=1 --recursive https://github.com/MaskRay/ccls /ccls

WORKDIR /ccls

RUN cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release \
                        -DCMAKE_CXX_COMPILER=/usr/bin/clang++-17 \
                        -DCMAKE_PREFIX_PATH=/usr/lib/llvm17
RUN cmake --build Release
RUN cmake --build Release --target install

FROM alpine

RUN apk add --no-cache clang17

COPY --from=builder /usr/local/bin/ccls /usr/local/bin/ccls

CMD ["/usr/local/bin/ccls"]
