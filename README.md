## 📣 [프로젝트 WiKi](https://github.com/isaac56/todo-list/wiki)

## 팀원
|iOS|BackEnd|
|---|---|
|비모😽|노을😼|
|둠바😸|아이작😺|



## 한 일

|      |                          04/06(화)                           |                          04/07(수)                           |                          04/08(목)                           |                          04/09(금)                           |
| :--: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: | :----------------------------------------------------------: |
| 공통 |                        요구사항 분석                         |                                                              |                                                              |                                                              |
| iOS  | 🤝짝 프로그래밍(스토리보드 테이블뷰 뼈대 작성)<br />✍️UITableView, CustomCell, self-resizing 학습 | - 🧐MileStones, Issue를 이용한 요구사항 명세및 분류<br />- 🐶UITableView 구현 시작 | 기능별 역할 분담<br />🛠둠바 - 카드 관리 모델 구현<br />🛠비모 - TableView Header 구현 | 기능별 역할 분담<br />🛠둠바 - Drag & Drop 구현<br />🛠비모 - 카드 추가 컨트롤러 구현 |
|  BE  |                    Spring Data JDBC 학습                     | Spring 프로젝트 생성<br />Docker MySQL 설치 및 외부 접속 테스트 | 스프링 프로젝트 EC2 배포<br />ER-다이어그램 작성<br />ERD 객체 맵핑 in JAVA |                 URL 설계<br />ERD 객체 맵핑                  |



## 브랜치 전략

#### 메인 브랜치명

- team9: 전체 메인 브랜치
- dev/ios: ios의 메인 브랜치
- dev/BE: 백엔드의 메인 브랜치

#### 기능 개발 브랜치명

- feature/"기능명": 개발하려는 기능명으로 완성 후 각 dev 브랜치에 PR 보내기



# Server Api

## POST /api/cards/{열 이름}

**{열 이름(todo, doing, done)}에 해당하는 카드 목록을 가져옵니다**

- request body: empty
- response success code: 200
- response body:

```
[
    {
        "id": 카드pk,
        "user": 유저pk,
        "title": 카드제목,
        "content": 카드내용,
        "priority": 정렬순위(ex: 1.23),
        "columnType": 열 이름,
        "deleted": false
    },
    {
        "id": 카드pk,
        "user": 유저pk,
        "title": 카드제목,
        "content": 카드내용,
        "priority": 정렬순위(ex: 1.23),
        "columnType": 열 이름,
        "deleted": false
    },
    ...
]
```

## POST /api/cards/

**새로운 Card 생성을 요청합니다.**

- request body

```
{
    "title": 카드제목,
    "content": 카드내용,
    "priority": 정렬순위(ex: 1.21),
    "columnType": 열 이름(todo, doing, done)
}
```

- response success code: 201
- response body: 등록된 카드 정보 반환

```
{
    "id": 카드pk,
    "user": 유저pk,
    "title": 카드제목,
    "content": 카드내용,
    "priority": 1.21,
    "columnType": 열 이름,
    "deleted": false
}
```

## PUT /api/cards/{cardId}

**cardId에 해당하는 카드 수정**

- request body

```
{
    "title": 카드제목,
    "content": 카드내용,
    "priority": 정렬순위(ex: 1.21),
    "columnType": 열 이름(todo, doing, done)
}
```

- response success code: 200
- response body: 변경된 카드 정보 반환

```
{
    "id": 카드pk,
    "user": 유저pk,
    "title": 카드제목,
    "content": 카드내용,
    "priority": 1.21,
    "columnType": 열 이름,
    "deleted": false
}
```

## DELETE /api/cards/{cardId}

**{cardId}에 해당하는 카드 삭제**

- request body: emtpy
- response success code: 204
- response body: empty
