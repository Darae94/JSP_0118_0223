# 개념 정리
# JSP_0118_0223

지시어(Directive) - <%@ %> : page(페이지 정보 지정 - language, contentType, import, session, buffer, autoFlush, errorPage 등), taglib(사용할 태그 라이브러리 지정), include(특정 영역에 다른 문서 포함)
주석문(Comments) - <%-- --%> / HTML - <!-- --> / JAVA //, /* ~ */
선언문(Declarations) - <%! %> : 자바 메서드, 전역변수 생성
연산문(Expressions) - <%= %> : 값 출력
수행문(Scriptlets) - <% %> : 자바 코드 / Action Tag, Custom Tag, EL(Expression Language - ${}), implicit Object(내장객체)

# HTTP 수행방식
1. GET 방식 : URL 뒤에 ? 와 함께 쌍으로 전송, 길이제한이 있어 많은 양 처리 불가, 가져오는 것(SELECT)에 사용
2. POST 방식 : 숨겨진 값으로 전송, 많은 양의 데이터 처리 적합, 수행하는 것(INSERT, UPDATE, DELETE)에 사용

쿠키(cookie) : 클라이언트(브라우저)에 데이터 저장 - setCookie, 보안이 취약하나 속도가 빠름
세션(Session) : sessionID(SID)를 식별자로 서버에 데이터 저장, 쿠키나 도메인 파라미터를 사용, 주로 사용자(로그인) 인증시에 사용, 속도는 느리지만 보안 기능 강력

# Servlet : JAVA 코드에 HTML 코드가 삽입
-- 컴파일 과정과 등록 과정이 필요
-- 디자인과 로직 구분 불명확
# JSP : HTML 코드에 JAVA 코드가 삽입
-- 컴파일 과정과 틀록 과정 불필요
-- 간단한 로직 구현에 간편
-- 디자인과 로직에 대한 구분이 명확해 유지보수가 용이
** JSP 기술(결과 출력)과 Servlet 기술(프로그램의 기능 구현-복잡한 로직)을 혼용한 MVC 프로그래밍 방법 권장!

# MVC(모델-뷰-컨트롤러/Model-View-Controller) : 소프트웨어 공학에서 사용되는 아키텍처 패턴 - 사용자 인터페이스와 로직을 분리하여 서로 영향 없이 쉽게 유지보수 가능
모델 : 애플리케이션의 정보(데이터)
뷰 : 텍스트, 체크박스 등과 같은 사용자 인터페이스 요소 출력
컨트롤러 : 데이터와 비즈니스 로직 사이의 상호동작 관리

프로세스 : 실행 중인 프로그램으로 자원(resource)와 쓰레드로 구성
쓰레드 : 프로세스 내에서 실제 작업을 수행하는 단위. 모든 프로세스는 하나 이상의 쓰레드를 가짐

오버로딩 : 메서드의 이름은 같지만 매개변수의 개수나 데이터 형식을 다르게 정의
오버라이딩(Overriding) : 기존 메서드를 재정의하는 것으로 매개변수의 갯수나 데이터형식이 같음

# 인터페이스란?
-- 일종의 추상클래스로 추상클래스처럼 추상 메서드와 상수만을 갖지만 일반 메서드와 멤버변수를 가질 수 없음 -> 기본설계도라고 할수 있으며, 다중상속 가능

# 인터페이스를 사용하는 이유
-- 다형성을 구현하기 위해 사용함 : 즉, 같은 인터페이스를 구현하는 클래스간의 결합도를 낮추고 응집도를 높힐 수 있음 -> 예) 스프링에서 DI(의존성 주입) 등에서 다형성 구현 및 결합도 낮춤
-- 양식 역할 : 규칙에 맞게 구현할 표준을 제시, 메서드를 빠짐없이 재정의 가능

# JDBC(Java Database Connectivity)란?
-- 자바에서 DB프로그래밍을 하기 위해 사용되는 API -> 데이터베이스 종류 상관없음

# JDBC 프로그래밍 코딩 흐름 - Oracle 연결 정보이기 때문에 MySQL, MSSQL 은 다른 드라이버나 코드가 필요함
1. JDBC 드라이버 로드 - DBMS와 통신을 담당하는 자바 클래스로 jar 파일 필요!
-- Class.forName("oracle.jdbc.driver.OracleDriver");
2. DB 연결
-- jdbc:oracle:thin:@HOST(localhost):PORT(1521):SID(orcl)
3. DB 데이터 읽거나 쓰기(SQL문)
4. DB 연결 종료
