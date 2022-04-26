## 가전 렌탈 서비스 '홈인'
### 설명
현재 서비스 중인 'LG 홈인'을 모티브로 진행한 프로젝트<br>
보유한 기술들을 활용하여 참조사이트와 유사하게 구현해보고 나아가 새로운 기능에 대해 주도적으로 학습 및 구현해보며 현업에 진출할 주니어 개발자로서 발판을 다지기 위한 프로젝트<br>
[프로젝트 '홈인' 바로가기](http://15.165.148.176:8080/homin/)

### 서비스 구조
![mindmap_homin](https://user-images.githubusercontent.com/93304669/164241359-7fb3c06c-2473-41cd-aa30-a6e6621697fd.png)

### 데이터베이스
![homin_db](https://user-images.githubusercontent.com/93304669/164241807-3aecbb6f-087f-4848-b109-3e4b58d346d1.png)

### 환경 & 기술
|기술분류|항 목|상 세|
|:----:|----|----|
|AWS|VPC|개념 이해 및 가상인프라 구축
||EC2|Ubuntu, 인스턴스 생성 및 연동|
||RDS|Oracle, 데이터 베이스 생성 및 연동|
|Web server|Apache tomcat 9.0||
|Language & Library|JAVA (version: 1.8)|객체지향 & 다형성 개념 이해를 기반한 프로그래밍|
||JSP (JSTL)|java 코드 활용 동적 웹페이지 구현|
||JavaScript (jQuery)|기초 개념, 문법 및 함수 사용하여 동적 웹페이지 구현|
||HTML & CSS|정적 웹페이지의 기초 골격 & 스타일링 개념 이해 및 구현|
|Framework|Spring (version: 5.2.1)|1.의존성 주입(DI) & 제어의 역전(IoC) 개념 이해를 바탕으로 프로그래밍 / 2.MVC패턴 이해 및 활용하여 애플리케이션 구현|
||Mybatis|1. 연결할 DB의 정보 담은 객체(bean) 생성 / 2. 추상 method & SQL Mapping을 통한 프로그래밍|
|DBMS|Oracle|DB 설치 및 테이블 관리 / SQL 작성 통한 데이터 CRUD|
|도구|Git & GitHub|소스 코드를 쉽게 관리할 수 있는 형상관리/버전관리 & 협업 환경 활용|
||sql developer|Local & Cloud DB 연동 및 table 생성 등 관리|
||Putty|Linux ‘Ubuntu’ Server / Telnet, SSH 원격 환경 구축|
||FileZilla|Windows(local) 와 Linux(cloud) 간 File Transfer (FTP)|
|오픈 API||java mail API / '다음' 주소 검색 API / '카카오' 계정 로그인 API / 'iamport' 결제 API|

### 담당 업무
##### 회원가입 & 로그인
1. 회원가입
- 중복 체크: AJAX & JSON 활용, 서버와 통신하여 전체 페이지 reload 없이 사용자에게 결과 안내
- 암호화: 비밀번호를 암호화하여 DB에 저장
- 인증: java mail API 활용, 임의의 6자리 인증번호 생성하여 메일로 발송 및 인증 확인
- 주소: '다음' 주소 검색 API
2. 로그인
- 사용자 계정 & 관리자 계정(ID: ADMIN@CARE.COM / PW: ADMIN) 분기
- 카카오 계정 로그인 API
##### 마이페이지 & 장바구니
1. 마이페이지
- User page: 개인정보 / 문의 내역 / 주문 내역 / 장바구니 관련 UI & 기능 구현
- Admin page: 각종 관리(회원/문의/주문/상품) 관련 UI & 기능 구현
2. 장바구니
- 상품 리스트/상세 페이지 내 '장바구니 추가' 기능 구현
- 장바구니 내 상품 선택 및 ‘iamport’ API 활용 복수 상품 결제 구현
##### AWS
1. EC2 & RDS
- VPC 개념 이해를 바탕으로 EC2, RDS 인스턴스 생성
- putty 활용하여 EC2 연동 및 환경 구축
- sql developer 이용하여 RDS 연동 및 DB 생성 
2. 배포
- FileZilla의 FTP 통해 Window / Ubuntu 간 파일 전송
