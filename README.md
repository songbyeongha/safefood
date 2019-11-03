## Safe Food Release

 자신이 섭취할 음식에 대한 알레르기 성분을 표시해 줍니다. 그리고 자신이 섭취한 음식을 체크하면 일일권장섭취량에 기반하여 그래프를 통해서 보여줍니다. 이를 통해 안전하고 건강한 음식을 섭취할 수 있도록 도와주는 사이트를 제작하였습니다.

저는 주로 2, 3, 4, 5 번을 담당하였습니다.

1. 회원 CURD
2. **음식 정보 CURD**
3. **하루 권장 섭취량 그래프**
4. **음식 세부 정보**
5. **REST API를 통한 게시판**  https://github.com/songbyeongha/safefoodrest 

### 사용된 기술

- 백엔드: **Spring** Boot 와 Legacy
- 프론트엔드 프레임워크 :  **JSP**, **Vue** js
- DB: **MyBatis**를 사용한 **CRUD**
- REST API: **Axios**를 사용한 **비동기** 처리

### 프로젝트 상세 기술

- Spring 백엔드
  - 음식, 알레르기, 회원, 장바구니, 섭취 DTO 
  - **LoggerFactory**를 사용하여 log 제공
  - **Session**를 통한 회원에게만 기능 제공
- 반응형
  - **@media**를 사용하여 반응형
- Drag and Drop
  - **Drag and Drop**으로 섭취 음식 등록 기능
