FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd 
# && \
# 	curl -o /etc/vsftpd.conf https://gist.githubusercontent.com/codekaze/1dcff44d18743b437f8560b1ee2ac4f3/raw/25608e4ba086b32e0c3f47ac012d5f26ab7826f6/vsftpd.conf


EXPOSE 21

# COPY requirements/bonus/vsftpd/tools/script.sh /
# CMD ["bash", "script.sh"]