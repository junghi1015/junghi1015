## Git-CLI 버전관리 



**Working tree** :  파일을 수정하는 곳

**Staging Area**: 버전을 만들려고 하는 파일들

**Repository**: 만들어진 버전



## git 기본 명령어



**git init** 

현재 폴더 깃 초기화

---

**git status**

깃 상태를 확인

---

**git add 파일이름 .**

수정한 파일을 스테이징

---

**git commit -m "커밋 메시지"**

스테이지에 올라온 파일 커밋

**git commit -am "메시지"** : 스테이징과 커밋 한꺼번에 처리(메시지도 함께)

**git commit --amend** : 방금 커밋한 메시지 수정하기

---

**git log (--stat)**

커밋 내용 살펴보기 및 버전이 제대로 만들었는지 확인하기

---

**git checkout --파일이름**

워킹트리에서 수정한 파일 되돌리기

---

**git checkout 브랜치 이름**

브랜치 이동

---

**git diff** 

변경사항 확인하기

---

**git reset HEAD 파일이름**

스테이징한 파일 되돌리기

* **Unstaged** : 스테이징 된 파일이 내려갔음

**git reset HEAD^** : 최신 커밋 되돌리기

**git reset --hard 커밋해시** : 특정 커밋으로 되돌리기

---

**git push origin master**

원격 저장소로 올리기

---

**git clone <원격 저장소 주소> <내가 사용할 디렉터리 이름>**

원격 저장소 복제

이름을 짖어하면 그 디렉터리 이름으로 복사

---

**git pull**

원격 저장소에서 변경된 사항을 로컬 저장소로 가져와 병합

---

**git fetch**

원격 저장소에서 변경된 사항을 로컬 저장소로 불러오기만 함

