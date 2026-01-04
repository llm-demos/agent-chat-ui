# docker build 
```shell
npm run build 
```
> 手动build 需求修改.envNEXT_PUBLIC_API_URL配置为对应的生产配置地址
```shell

docker build . -t agent-chat-ui:v4
docker tag cb61b216803c registry.cn-shenzhen.aliyuncs.com/gsmini/agent-chat-ui:v4
docker push registry.cn-shenzhen.aliyuncs.com/gsmini/agent-chat-ui:v4
```
> 后端api直接写在dockerfile中了

# docker run 
```shell
 docker run -p 3000:3000 agent-chat-ui:v1 

```
>   http://localhost:3000
