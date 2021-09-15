/* object : record와 비슷 */
// 타입 선언이 필요없음
// 구조적이며 더 다형성이다
// 패턴일치 지원 x
// 업데이트 지원 x

type person = {"age": int, "name": string}

let me = {
  "age": 5,
  "name": "Big Rescript",
}

let age = me["age"]

/* 타입 결합 */
type point2d = {"x": float, "y": float}

type point3d = {...point2d, "z": float}

let myPoint: point3d = {
  "x": 1.0,
  "y": 2.0,
  "z": 3.0,
}

// 타입 선언을 요구하지 않기 때문에 js로의 바인딩이 훨씬 빠르고 쉽다
// (하지만 더 위험하다)
