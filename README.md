# WorkConGW

## 프로젝트 소개 : 

기존 4인 팀프로젝트 WorkConGW를 배포 (1인)

## 배포 환경 :
<img src="https://img.shields.io/badge/AWS-232F3E?style=for-the-badge&logo=amazonwebservices&logoColor=white">
<br>
<img src="https://img.shields.io/badge/NGINX-009639?style=for-the-badge&logo=nginx&logoColor=white">
<br>
<img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=DOCKER&logoColor=white">
<br>
<img src="https://img.shields.io/badge/Amazon Route 53-8C4FFF?style=for-the-badge&logo=amazonroute53&logoColor=white">


## 배포 구조 :

![img_2.png](img_2.png)


## 프로젝트 설명 :
- Docker를 이용하여 AWS EC2 환경에 배포
- Docker-compose 를 활용하여 여러개의 컨테이너를 관리
- 기존에 고려하지 않던 Web Server를 백엔드 서버 앞단에 위치하여 Reverse proxy 사용
- SSL 인증서를 발급하여 HTTPS 프로토콜 사용
- 도메인을 구입하여 DNS 사용