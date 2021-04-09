# Install: Reading

> Before execution, you can refer to this file for installation. This is the preparation and installation of the **online** version.

> Not sure if the machine in use has a network, or you want to see the network situation of the machine in use Can try **"./net.sh"**.

>---
- You need to prepare **[index.html](https://github.com/xuan103/Offline_Images/blob/main/Install/index.html)** and **[Dockerfile](https://github.com/xuan103/Offline_Images/blob/main/Install/Dockerfile)**
- If want to start docker, Can try **“./build_docker.sh”** .
>---
- If want to check images: **"sudo docker images"**
- If want to run docker: **"sudo docker run --name t1 -d centos_tools"**
- If want docker to working to do: **"sudo docker exec -it t1 /bin/bash"**
- If want to save docker to ".tar": **"sudo docker save centos_tool > centos_tool.tar"**

> If you want to change the above version or others, please do it yourself.

---

# Offline: Reading

> Before execution, you can refer to this file for installation. 
This is the preparation and installation of the **offline** version. 

>Not sure if the machine in use has a network, or you want to see the network situation of the machine in use
Can try **"./net.sh"**.

- If want to install docker, Can try **"./offline_docker.sh"** .
- If want to install nginx, Can try **"./offline_nginx.sh"** .
- If want to install dotnet, Can try **"./offline_dotnet.sh"** .
- If want to pull CentOS 7 image，Can try **"./offline_centos7.sh"** .

#### *If all the above functions are needed, Can try* "./alloffline.sh" .

> If you want to change the version of the above, please prepare the offline version of the kit for replacement.

---

## If there is a missing program, you can try:
[Go To Link-1](https://drive.google.com/drive/folders/1G43ovQ_UyRwBpAYpuD15qm7Z9uJdujuW?usp=sharing)

## If the installation package is missing, you can try:
[Go To Link-2](https://drive.google.com/drive/folders/11fsp6aCbs7DTuV28107xd8e2ZKJvCS_O?usp=sharing)