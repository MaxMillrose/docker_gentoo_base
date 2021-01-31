# Dockerfile for gentoo_base


FROM gentoo/stage3-amd64

LABEL maintainer "Max Millrose <max.millrose@gmail.com>"
RUN emerge --sync --quiet 
RUN emerge dev-vcs/git 
RUN MAKEOPTS="-j17 -l14" emerge -uND --jobs=7 @world 

COPY etc.d/timezone /etc/timezone
COPY etc.d/locale.gen /etc/locale.gen
RUN locale-gen 

RUN echo "sjdfjkdfsjdfsfskdfsjdfskfdjfdgkdfgjgdfjfdgjlfdgkgfkgh"
COPY etc.d/portage /etc/portage

RUN emerge --sync 
RUN eselect profile set default/linux/amd64/17.1/hardened

RUN emerge -uND @system && emerge --oneshot sys-apps/portage && emerge -uND @world 

RUN emerge vim  
RUN rm -fr /var/cache/distfiles /var/tmp/ /tmp/ 
ENTRYPOINT [ "bash" ]
#CMD [ "calibre","--detach", "--with-library=/home/user/something" ]
#CMD [ "/usr/bin/calibre","--detach" ]


