FROM elixir:1.9

RUN mkdir -p /deliverycenter.service.b2w/
WORKDIR /deliverycenter.service.b2w/

ARG env
ARG hash
ENV env $env
ENV MIX_ENV $env
ENV APP_VERSION $hash

RUN mix local.hex --force
RUN mix local.rebar --force

COPY . .

RUN mix deps.get
RUN mix deps.compile
RUN mix release

CMD _build/$env/rel/ifood/bin/ifood start