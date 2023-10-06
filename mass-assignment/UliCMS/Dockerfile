# Download the file
WORKDIR /tmp
RUN wget https://www.ulicms.de/content/files/Releases/2023.1/ulicms-2023.1-sniffing-vicuna-full.zip

# Unzip the file
RUN unzip ulicms-2023.1-sniffing-vicuna-full.zip

# Workaround to move dist directory contents to /app directory
RUN echo "#!/bin/bash" > /newrun.sh
RUN echo "mv dist/* /app" >> /newrun.sh
RUN echo ". /run.sh" >> /newrun.sh
RUN chmod 755 /newrun.sh

# Cleanup
RUN rm -rf /tmp/ulicms-2023.1-sniffing-vicuna-full.zip

CMD ["/newrun.sh"]
