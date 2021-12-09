FROM gitpod/workspace-base
RUN gpg --keyserver keys.openpgp.org --recv-keys BC6B641A9D1AA1277130025ED9497100C5AC1B0F


# Manually install NodeJS from nvm
ENV NODE_VERSION=14.18.2
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | PROFILE=/dev/null bash \
    && bash -c ". .nvm/nvm.sh \
        && nvm install $NODE_VERSION \
        && nvm alias default $NODE_VERSION"

# Install Typescript
ENV TS_VERSION=4.4.4
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | PROFILE=/dev/null bash \
    && bash -c ". .nvm/nvm.sh \ 
    && nvm use $NODE_VERSION \
    && npm i -g typescript@$TS_VERSION"

# Install AWS CDK for Typescript
ENV CDK_VERSION=2.1.0
RUN curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | PROFILE=/dev/null bash \
    && bash -c ". .nvm/nvm.sh \ 
    && nvm use $NODE_VERSION \
    && npm i -g aws-cdk@$CDK_VERSION"

# Make node accessible from path

ENV PATH=$PATH:/home/gitpod/.nvm/versions/node/v${NODE_VERSION}/bin