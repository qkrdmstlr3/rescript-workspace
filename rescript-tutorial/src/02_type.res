let score: int = 10
let add = (a, b) => a + b
let sub = (a: int, b: int): int => a - b
// let drawCircle = (~radius as r: int): circleType

type scoreType = int
let x: scoreType = 10

type intCoordinates = (int, int, int)
type flatCoordinates = (float, float, float)
let a1: intCoordinates = (10, 20, 30)
let b1: flatCoordinates = (10.5, 20.5, 30.5)

/* 제네릭 사용 */
type coordinates<'a> = ('a, 'a, 'a)
let a2: coordinates<int> = (10, 20, 30)
let b2: coordinates<float> = (10.5, 20.5, 30.5)

let numbers = [1, 2, 3] // array<int>
let greetings = ["hello", "world"] // array<string>

/* 여러 타입 */
type result<'a, 'b> =
  | OK('a)
  | Error('b)
type myPayload = {data: string}
type myPayloadResults<'errorType> = array<result<myPayload, 'errorType>>

let payloadResults: myPayloadResults<string> = [
  OK({data: "hi"}),
  OK({data: "bye"}),
  Error("Something wrong happened!"),
]

/* 재귀 타입 */
type rec person = {
  name: string,
  friends: array<person>,
}

/* 서로를 참조하는 타입 */
type rec student = {taughtBy: teacher}
and teacher = {students: array<student>}

/* 유형 탈출 해치 : rescript의 타입은 강력하나 실용성에 있어서 시스템에 "거짓말"할 수 있는 단일 탈출 해치를 제공 */
// external myShadyConversion: myType1 => myType2 = "%identity"
external convertToFloat: int => float = "%identity"
let age = 10
let gpa = 2.1 +. convertToFloat(age)
