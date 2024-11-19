---
title: async와 await를 사용한 비동기 프로그래밍
date: 2024-03-11
description:
tags: ["C#", "async", "await"]
categories: ["C#"]
image:
math: true
---

I/O 바인딩되어 오래 걸리는 작업을 수행해야 하는 경우나 큰 계산을 수행하는 것과 같이 CPU 바인딩된 작업이 존재하는 경우에는 비동기 프로그래밍을 사용한다. C#에서는 따로 콜백 함수를 지정하지 않고도 비동기 프로그래밍이 가능하다.

---

## 비동기 프로그래밍

`Task`나 `Task<T>` 개체로 비동기 프로그래밍이 가능하다. 이 개체들은 `async` 한정자 또는 `await` 연산자를 통해 사용할 수 있다.

### async 한정자
`async`는 메서드를 `await`를 사용할 수 있는 비동기 메서드로 변환해준다.  
I/O 바인딩된 코드에서는 `async` 메서드의 내부에서 `Task` 또는 `Task<T>` 개체의 반환을 기다린다. 작업이 완료될 때까지 기다리지 않는 메서드라면 void로 선언한다.

> `Task` 또는 `Task<T>` 형식의 메소드  
> - `await` 연산자의 위치에 도달하면 호출자에게 제어를 돌려준다.  
> => `await` 연산자를 찾지 못하면 동기로 실행된다.
>
> `void` 형식의 메소드  
> - 메서드 호출 즉시 호출자에게 제어를 돌려준다.  
> - `await` 연산자를 찾지 못해도 비동기적으로 실행된다.  
> => `async` 하나만으로 비동기 처리가 가능하다.

CPU 바인딩된 코드에서는 `Task.Run` 메서드로 작업이 백그라운드 스레드에서 시작되기를 기다린다.

### await 연산자

`await`는 비동기 메서드 내부에서만 사용할 수 있다. `await`를 수행한 메서드의 호출자에게 제어를 넘김으로서 UI를 부드럽게 만들어준다. 컴파일러가 await에 도달할 때 실행을 양도하고, 백그라운드 작업이 완료될 때 다시 실행하는 시스템으로 변환되는데, 이론적으로 `promise`와 같은 원리이다.

### **사용 예제**

``` csharp
async void AsyncMethod() {
    await Task.Run(async() = > {
		// 작업 내용
        await Task.Delay(100); // Thread.Sleep()의 비동기 버전
    });
}
```

이 코드에서 정의된 메서드를 호출하면 호출자의 제어가 `AsyncMethod()`로 이동하고, `await`에 도달하면 다시 호출자로 제어가 이동한다.

---

## I/O binding vs CPU binding

> 코드가 DB의 데이터와 같은 무엇인가를 기다린다 → I/O 바인딩 작업  
> 코드가 비용이 높은 계산을 수행한다 → CPU 바인딩 작업

**I/O 바인딩된 작업을 비동기 처리하는 경우**
- `Task.Run` 없이 `async` 및 `await`를 사용한다.

**CPU에 바인딩되어 있는 작업을 비동기 처리하는 경우**
- 다른 `async` 스레드에서 `Task.Run` 메서드를 사용하여 해당 작업을 백그라운드 스레드에서 시작한다.

---

## [ 참고 ]
[[Microsoft 비동기 프로그래밍 시나리오](https://learn.microsoft.com/ko-kr/dotnet/csharp/asynchronous-programming/async-scenarios)]
