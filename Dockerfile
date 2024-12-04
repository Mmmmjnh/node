# 使用官方的 Node.js 18 LTS 镜像作为基础镜像
FROM node:18.20.5-alpine

# 设置维护者信息（可选）
LABEL maintainer="yourname@example.com"

# 安装必要的软件包（如 git）
RUN apt-get update && apt-get install -y \
    git \
    curl \
    && rm -rf /var/lib/apt/lists/*

# 添加 Jenkins 用户，避免权限问题
RUN groupadd -g 1000 jenkins && \
    useradd -d /home/jenkins -s /bin/bash -m -u 1000 -g 1000 jenkins

# 切换到 Jenkins 用户
USER jenkins

# 设置工作目录
WORKDIR /home/jenkins

# 确保 Node.js 和 npm 可用（版本验证，非必须）
RUN node --version && npm --version

# 暴露需要的端口（如果有服务运行，通常 Jenkins 不需要）
# EXPOSE 3000

# 设定默认命令（非必须）
CMD ["node"]

# 提供对扩展的支持（如果需要，可以在这里加入更多工具）
