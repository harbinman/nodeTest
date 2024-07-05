FROM  node:22.4-alpine3.19
WORKDIR /c/Users/wudi/Desktop/nodejsTestPorject
COPY pack* ./
RUN npm i
COPY app.js ./
CMD [ "node","app.js" ]