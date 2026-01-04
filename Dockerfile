# 核心：改用 Node 镜像（兼容 Next.js 运行，与你的镜像仓库一致）
FROM registry.cn-shenzhen.aliyuncs.com/gsmini/node:20-buster-slim

# 1. 创建工作目录（规范路径，避免权限混乱）
WORKDIR /home/app

# 2. 复制本地 .next 目录（关键：确保构建上下文有 .next，路径写法正确）
# 格式：COPY 本地相对路径（构建上下文内） 容器内路径
COPY .next ./.next

# 3. 复制运行必需的其他文件（缺一不可，否则 .next 无法独立运行）
COPY package.json package-lock.json* ./
COPY public ./public

# 4. 安装生产依赖（Next.js 运行 .next 产物需要的核心依赖）
# 可选：添加 --registry 加速国内下载
RUN npm install --production --verbose --registry=https://registry.npmmirror.com

# 5. 配置权限（避免运行时访问 .next 权限不足）
RUN chmod -R 755 /home/app/.next

# 6. 配置生产环境变量
ENV NODE_ENV=production
# 7. 暴露 Next.js 默认端口
EXPOSE 3000

# 8. 启动 Next.js 服务（直接运行 .next 产物）
CMD ["npm", "start"]