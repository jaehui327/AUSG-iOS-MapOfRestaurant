# AUSG-iOS-MapOfRestaurant 🍎

## iOS 서비스에 연결하기

###핸즈온 시간을 고려하여 대부분의 기능이 구현되어 있는 Base 프로젝트를 만들어 두었습니다.
###핸즈온은 이 Base 프로젝트를 수정해 나가는 형식으로 진행됩니다.



### [주요 기능]

#### 별점에 따라 마커의 색상의 변화를 주어 맛집을 구분할 수 있는 맛집 지도입니다. 😆🍴🍔

![](../images/iOS_guide/2.png)



#### 오른쪽 하단의 `+` 버튼을 누르면 장소를 추가할 수 있습니다.


![](../images/iOS_guide/3.png)



#### 장소를 추가하면 지도에 위치가 뜹니다. 

#### 마커를 탭하면 나오는 window를 다시 탭하면 상세 정보를 볼 수 있습니다.

![](../images/iOS_guide/4.png)



#### 아직은 별점 정보가 없는 상태입니다! 넣어볼까요?

![](../images/iOS_guide/5.png)

#### 별을 탭하여 별점을 선택할 수 있습니다! 4점을 선택해볼게요!

![](../images/iOS_guide/6.png)



#### 짠! 노란색 마커로 바뀌었습니다. 😎

![](../images/iOS_guide/7.png)



#### 상세 화면에 별점도 알맞게 변화된 것을 확인할 수 있습니다.

![](../images/iOS_guide/8.png)


## iOS 프로젝트 파일 받기

https://github.com/jaehui327/AUSG-iOS-MapOfRestaurant

위 링크에 접속하여 `Download ZIP`을 클릭해주세요.

![](../images/iOS_guide/9.png)

압축을 풀고 프로젝트 폴더를 확인합니다.

![](../images/iOS_guide/10.png)

`터미널`로 이동하여 `프로젝트 폴더`에서 `pod install` 해줍니다.

```
$ pod install
```

![](../images/iOS_guide/11.png)

그리고 나서 `workspace` 파일로 열어주세요.

![](../images/iOS_guide/12.png)



일단 그냥 실행 시켜볼까요?

![](../images/iOS_guide/13.png)

현재 위치만 찍히는 지도의 모습입니다.

![](../images/iOS_guide/14.png)



위에서 봤던 모습처럼 수정해봅시다!!

## 프로젝트 파일 수정




## TEST
맛집 지도를 만들기 위해 장소 등록이 필요합니다. 

따라서 편하게 입력하실 수 있도록 몇 개의 장소를 제공하려고 합니다.



아래 지도는 AUSG에서 공유하는 맛집 지도입니다. 😊 (몇 군데 없지만.. 본의 아니게 맥주집 위주.. ㅎㅎㅎ)


![](../images/iOS_guide/1.png)


이 지도에 있는 장소에 대한 정보는 다음과 같습니다.



- 텀블러비어 역삼직영점
  - longtitude : 127.03474
  - latitude : 37.4987
  - name : tumbler beer
  - description : beer
  - address : Gangnam-gu, Seoul



- 바스버거 역삼점
  - longtitude : 127.03582
  - latitude : 37.49962
  - name : basburger
  - description : burger
  - address : Gangnam-gu, Seoul



- 생활맥주 역삼점
  - longtitude : 127.03929
  - latitude : 37.50318
  - name : dailybeer
  - description : beer
  - address : Gangnam-gu, Seoul



- 신촌황소곱창 강남역
  - longtitude : 127.02715
  - latitude : 37.50181
  - name : kshgop
  - description : gopchang
  - address : Gangnam-gu, Seoul



이 정보 외에도 
  - longtitude : 127.02 ~ 06
  - latitude : 37.47 ~ 51

사이 값으로 장소를 넣어 주시면 현재 위치 근방으로 설정 가능합니다. ☺️