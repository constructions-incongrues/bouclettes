        xz-utils && \
    wget https://github.com/pdfcpu/pdfcpu/releases/download/v0.3.13/pdfcpu_0.3.13_Linux_x86_64.tar.xz -O - | tar xJf - -C /usr/local/bin --strip-components=1 pdfcpu_0.3.13_Linux_x86_64/pdfcpu && \
    chmod +x /usr/local/bin/pdfcpu && pdfcpu version
