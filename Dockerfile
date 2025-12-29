# 使用轻量级的 Node.js 镜像
FROM node:alpine3.20

# 设置工作目录为 /app（推荐）
WORKDIR /app

# 复制 package.json 和 package-lock.json 文件并安装依赖
COPY package*.json ./
RUN npm install

# 将整个项目文件复制到 /app 目录
COPY . .

# 安装额外依赖和工具
RUN apk update && apk upgrade && \
    apk add --no-cache openssl curl gcompat iproute2 coreutils bash

# 确保 index.js 有执行权限
RUN chmod +x index.js

# 开放应用监听的端口（假设监听 3000 端口）
EXPOSE 3000/tcp

# 启动 Node.js 应用
CMD ["node", "index.js"]
