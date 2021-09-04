/* record : js의 객체랑 비슷 */
// 불변성 보장
// 필드 확장 불가능

type person = {
  age: int,
  name: string,
}

let me = {
  age: 5,
  name: "BigRescript",
}
let name = me.name

/* 불변성업데이트 */
let meNextYear = {...me, age: me.age + 1}

/* 필드 업데이트 */
type baby = {
  name: string,
  mutable age: int,
}
let baby: baby = {name: "Baby ReScript", age: 5}
baby.age = baby.age + 1
Js.log(baby.age)

type person = {age: int, name: string}
type monster = {age: int, hasTentacles: bool}

// 여기서 entity가 monster일 것이라고 추론한다(가장 가까운 것).
// 다른 타입이 들어오면 에러가 나버린다
let getAge = entity => entity.age
