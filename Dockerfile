FROM ruby:3.1.3

ADD . /Sinatra-Docker
WORKDIR /Sinatra-Docker
COPY Gemfile Gemfile.lock ./
RUN bundle install

EXPOSE 80

#CMD ["bundle", "exec", "puma", "config.ru", "-C", "puma.rb"]
CMD ["/bin/bash"]
