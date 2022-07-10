FROM simpleton

# RUN apk add \
#   abuild \
#   alpine-sdk \
#   $nothing
# 
# RUN apk add \
#   autoconf \
#   autoconf-doc \
#   automake \
#   automake-doc \
#   binutils \
#   binutils-doc \
#   $nothing
# 
# RUN apk add \
#   bison \
#   build-base \
#   ccache \
#   ccache-doc \
#   cmake \
#   cmake-doc \
#   $nothing
# 
# RUN apk add \
#   flex \
#   g++ \
#   gcc \
#   gcc-doc \
#   gdb \
#   go \
#   libpthread-stubs \
#   linux-headers \
#   make \
#   musl-dbg \
#   nasm \
#   $nothing
# 
# RUN apk add \
#   gradle \
#   openjdk11-jdk \
#   openjdk17-jdk \
#   $nothing
# 
# RUN apk add \
#   pciutils \
#   perl \
#   $nothing
# 
# RUN apk add \
#   python3 \
#   $nothing
# 
# RUN apk add \
#   udisks2 \
#   udisks2-doc \
#   usbutils \
#   $nothing

RUN ln -sf /repo/badun/shell-start2.sh /etc/profile.d/
