FROM ruby

RUN mkdir WhatWeb

COPY . WhatWeb

RUN cd WhatWeb && bundle install

ENTRYPOINT ["WhatWeb/whatweb"]
