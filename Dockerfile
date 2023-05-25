FROM ubuntu:22.04
# ubuntu because need to run LaTeX
ENV DEBIAN_FRONTEND noninteractive

# Install latex dependencies
RUN apt-get update -q && apt-get install -qy \
    texlive-latex-extra \
    gnuplot \
    make \
    git \
    vim
# Install python dependencies (for API)
RUN apt-get update -q && apt-get install -qy software-properties-common
RUN add-apt-repository universe
RUN apt-get update -q && apt-get install -qy python3-pip
RUN rm -rf /var/lib/apt/lists/*

# Add LaTeX source code
WORKDIR /latex
COPY ./src /latex
COPY ./build/nema.sty /latex/nema.sty

# Add nema-latex-cli executable
WORKDIR /bin
COPY ./build/nema-latex-cli /bin/nema-latex-cli
ENV PATH="$PATH:/bin"

# Add flask API to allow for recompiling of LaTeX
WORKDIR /api

COPY ./api /api/
RUN pip install --no-cache-dir -r requirements.txt

ENV PYTHONPATH "${PYTHONPATH}:/api"

ENV FLASK_APP=/api/api/
#TODO change!!!!
ENV FLASK_RUN_PORT=7000
EXPOSE 7000

CMD ["./start-backend.sh"]
