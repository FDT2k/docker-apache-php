FROM tutum/apache-php

ADD run.sh /run.sh

EXPOSE 80

WORKDIR /app

CMD ["/run.sh"]
