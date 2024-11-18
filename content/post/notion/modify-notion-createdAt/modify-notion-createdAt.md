+++
title = "[Notion] 노션 생성 일시 수정하기"
date = 2024-07-14T00:54:16+09:00
description = "modify-notion-createdAt"
tags = [
    "notion"
]
categories = [
    "notion"
]
image = "4.png"
+++

노션의 생성 일시는 자동으로 값이 할당되며, 수정이 불가능하다.

하지만 데이터베이스를 사용하다가 중간에 생성 일시를 도입하거나, 생성 일시를 수정하고 싶은 경우가 생긴다.

**1. 생성 일시, 날짜, 수식 속성을 하나씩 만든다.**

각각 생성 일시, 날짜, 생성일로 이름을 지정하였다. 생성 일시는 자동으로 값이 채워져 있을 것이다.

**2. 수식에 if(날짜, 날짜, 생성 일시)를 입력한다.**

![](./2-1.png)

날짜가 존재하면 수식값을 날짜로 설정하고, 날짜가 존재하지 않으면 수식값을 생성 일시로 설정하는 수식이다.

날짜와 생성 일시를 입력할 때에는 수식 입력란 아래의 속성에서 선택하면 된다.

![](./2-2.png)

**3. 변경하려는 행에 변경하고자 하는 날짜를 입력하여 수식값이 제대로 들어가는지 확인한다.**

![](3.png)

날짜의 값이 있는 행에는 생성일에 날짜가, 날짜의 값이 없는 행에는 생성일에 생성 일시가 들어간 것을 확인할 수 있다.

**4. 캘린더 보기에 표시할 날짜 변경하기**

3번까지만 진행하면, 캘린더 표시 기준 보기가 생성 일시 또는 날짜로 설정되어 있기 때문에 캘린더 표시 기준 보기를 생성일로 변경해주어야 한다.

캘린더 보기를 생성하고, 우측의 ... -> 레이아웃을 클릭하고, 캘린더 표시 기준 보기를 생성일로 선택해준다.

![](./4.png)

이렇게까지 설정하면 생성 일시를 자동으로 입력하면서, 수정하고 싶은 생성일은 따로 지정하여 사용할 수 있다!

날짜와 생성 일시 속성을 사용할 일이 많지 않은 경우, 보기에서 숨기기를 해두는 것이 깔끔하다.