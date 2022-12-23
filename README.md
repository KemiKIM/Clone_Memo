# Clone MegaCoffee App Project (주차별 기록내용)
&nbsp;


</br>

## 🤝_ 프로젝트 목표
#### 1. Git을 활용한 협업을 통해, 오류 및 충돌에 대한 부분을 사전경험 및 대처하는 내용을 경험해본다.
#### 2. CloneCoding을 통하여, UIKit Framework와 AutoLayout 숙련도 향상을 경험한다.

&nbsp;

</br>

## 🎯 _ 개발 기간 및 주차
### `2022.10.05` ~ `2022.12.05`
&nbsp;

</br>

#### 0️⃣  _ Week [ `10.01` ~ `10.05` ]

<p align="center">
  <img src = "https://user-images.githubusercontent.com/114051946/209294695-e9d9468c-cdb6-4e3e-8794-1f4aad8a3868.png" width="20%" height="20%">
</p>


##### 👌 구현부분:
첫 모임을 가지기 전, 제가 맡은 부분에 대해 전체적인 구상을 해보았습니다. </br>
구상을 하며, 상단부분만 구분 짓는 백그라운드 색상을 변경하여 단순하게 구현을 하였습니다.</br>
(계정설정, 고객센터 버튼, 닉네임 레이블)
##### 🤔 생각할 부분:
닉네임 레이블의 경우 사용자의 정보를 받아와야하기 때문에 임의로 설정하였습니다.
##### ⏭ Next Week Deadline:
깃포크와 소스트리를 활용하여 깃에 대해 공부하고, 협업을 하는 것에 대해 중심을 두면서 작업을 진행하기.</br>
하단의 광고 창 구현하기.

&nbsp;


</br>

#### 1️⃣  _ Week [ `10.06` ~ `10.12` ]


<p align="center">
  <img src = "https://user-images.githubusercontent.com/114051946/209296366-63e4369a-b825-4d31-90c1-88d01eb999c2.gif" width="20%" height="20%">
</p>



##### 👌 구현부분:
하단의 광고창을 collectionView를 활용해 내부에 이미지를 넣고 Timer함수를 구현하여 설정한 시간에 맞게끔 넘어가게 하였습니다. 

##### 🤔 생각할 부분:

페이지 우측 하단의 (현재 페이지 숫자/총 페이지 숫자)를 나타내야 하며, 마지막 이미지에서 우측으로 스크롤 했을 때 첫번째 페이지로 넘어오는 것을 구현하지 못했습니다.</br>
또한 소스트리로 프로젝트를 합칠 때 fetch head가 뜨며, 프로젝트가 열리지 않아, 파일을 날리는 현상이 지속되었습니다.

##### ⏭ Next Week Deadline:

소스트리로 합칠 때 왜 자꾸 오류가 뜨는지 살펴보기.</br>
생각할부분에서 구현하지 못했던 부분들을 구현하고, 하단의 목록은 테이블뷰를 사용하여 구현해오기.









&nbsp;

</br>

#### 2️⃣  _ Week [ `10.13` ~ `10.19` ]

<p align="center">
  <img src = "https://user-images.githubusercontent.com/114051946/209297893-0b59be29-f14d-44fa-8176-718d4520588f.gif" width="20%" height="20%">
</p>



##### 👌 구현부분:
우측 하단의 (현재 페이지 숫자/ 총 페이지 숫자)를 구현하고, 마지막 이미지에서 우측으로 스크롤할 수 있도록 구현했습니다.

##### 🤔 생각할 부분:

원하는 부분의 구현은 성공했지만, 구현의 많은 오류가 있습니다.</br></br>
첫번째. 현재 페이지를 인식하고 다음으로 넘어가야하는데, 고정된 페이지로만 넘어갑니다.</br>
(ex. 1번 이미지에서 강제로 3번 이미지로 스크롤하면, 다시 1번으로 넘어가야하지만, 2번으로 넘어감)</br>

두번째. currentIndex의 숫자로 현재 페이지 숫자를 표시했지만 타이머 함수를 처음부터 구현을 잘못한 까닭에 숫자표시에 오류가 있습니다.</br>

세번째. 매 주 Sourcetree를 통해 프로젝트를 합칠 때마다, fetch head error가 뜨며, 많은 시간이 소요되었습니다.</br>


##### ⏭ Next Week Deadline:

fetch head error를 해결하기 위해, 지금 당장의 구현보단, git에 대해 공부 및 에러 해결에 초점을 맞추기.</br>
전체적인 협업 guide line에 대해 다시 생각해보고 적용해보기.






&nbsp;

</br>

#### 3️⃣  _ Week [ `10.20` ~ `10.26` ]



<p align="center">
  <img src = "https://user-images.githubusercontent.com/114051946/209298522-167f0e03-457d-4a1b-bae4-b150795d73f4.JPG" width="20%" height="20%">
</p>



##### 👌 구현부분:
Source에 대한 fetch head error를 끝내 해결하지 못했습니다.</br>
일부 error는 팀원들이 pull과 push에 대해 제대로 이해하지 못해 프로젝트가 터져 다시 복구하는데까지 시간이 소요된 것도 있습니다.

##### 🤔 생각할 부분:

터미널로 접근해야할지 다른 플랫폼이 있는지 찾아봐야할 것 같습니다.</br>
일단 제 프로젝트는 모든 내용이 코드로 구현되어 있기 때문에, 맨 마지막에 머지함으로써 최대한 프로젝트를 보존하고자 노력하였습니다.


##### ⏭ Next Week Deadline:

fetch head error를 해결하기 위해, 지금 당장의 구현보단, git에 대해 공부 및 에러 해결에 초점을 맞추기.</br>
전체적인 협업 guide line에 대해 다시 생각해보고 적용해보기.


&nbsp;

</br>

#### 4️⃣  _ Week [ `10.27` ~ `11.02` ]



<p align="center">
  <img src = "https://user-images.githubusercontent.com/114051946/209301566-b290c620-8356-496a-9ebe-b474317d6e71.gif" width="20%" height="20%">
   <img src = "https://user-images.githubusercontent.com/114051946/209302656-e27e2593-78b7-481f-857a-5d90cff8bbb5.gif" width="20%" height="20%">
  &nbsp;
  &nbsp;
   <img src = "https://user-images.githubusercontent.com/114051946/209302660-8d270ab2-ac92-4c21-baa5-3848cb43b63f.gif" width="20%" height="20%">
  <img src = "https://user-images.githubusercontent.com/114051946/209300749-3c41a5d2-9f33-4e7f-879a-7e4e3adfb5a2.gif" width="20%" height="20%">
</p>






##### 👌 구현부분:
광고창 아래, 목록을 구현하였습니다.</br>
메가 오더, 선물하기을 tap할 경우 해당 view로 이동하도록 구현하였습니다.</br>
상품권 대량 구매 신청을 누르면 해당 url로 이동하도록 구현하였습니다.</br>
이용약관 tab을 구현하였습니다. 임의로 데이터를 만들어 해당 내용을 넣어주었습니다.</br>
소스트리의 고질적인 문제를 해결하지 못하고, 깃크라켄을 사용함으로써 프로젝트를 병합하는데 모든 문제를 해결하였습니다.


##### 🤔 생각할 부분:

ios15부터 발생하는 TableView padding문제가 있었습니다.</br>
해결 코드 및 해결 사진. 필요 -> issue 연결필요함.


##### ⏭ Next Week Deadline:

계정설정 버튼과 고객센터 버튼 내부를 최대한 구현하기.











&nbsp;

</br>

#### 5️⃣  _ Week [ `11.03` ~ `11.09` ]

&nbsp;

</br>


#### 6️⃣  _ Week [ `11.10` ~ `11.16` ]

&nbsp;

</br>

#### 7️⃣  _ Week [ `11.17` ~ `11.23` ]

&nbsp;

</br>

#### 8️⃣  _ Week [ `11.24` ~ `11.30` ]

&nbsp;

</br>

#### 9️⃣  _ Week [ `12.01` ~ `12.06` ] (Final)

&nbsp;

</br>


</br>

## 🧐 _ 소감
#### 1. 이러쿵저러쿵
#### 2. 저러쿵 이러쿵

&nbsp;

</br>
