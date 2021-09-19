// @react.component
let make = () => {
  <div> {React.string("Hello World")} </div>
}

let element01 = <h1> {React.string("Hello World")} </h1>

// React.element는 많이 쓰임으로 이것을 이해하는 것은 매우 중요하다.
// string을 자동으로 element 요소로 바꿔주지 않음으로 React.string을 이용해야한다
let wrapChildren = (children: React.element) => {
  <div> <h1> {React.string("Overview")} </h1> children </div>
}

let component = wrapChildren(<div> {React.string("Let's use React with ReScript")} </div>)

// jsx + element
let greeting = React.string("Hello ")
let name = React.string("Stranger")
let element02 = <div className="myElement"> greeting name </div>

// 다른 element들
let a = React.string("Hello") // "Hello"
let b = React.int(1) // "1"
let c = React.float(1.0) // "1.0"

// React.array : 데이트 목록을 렌더링 / 자식전달 시 유용
// React.list는 런타임 오버헤드를 포함하기 때문에 제공X
let element = React.array([
  React.string("element 1"),
  React.string("element 2"),
  React.string("element 3"),
])

// React.null
// rescript는 강한 타입에서 생기는 제약조건으로 인해 element || null을 허락하지 않는다.
// 따라서 React.null 상수가 필요하다
let name = Some("Andrea")
let element03 = switch name {
| Some(name) => <div> {React.string("Hello " ++ name)} </div>
| None => React.null
}

// createElement를 통한 엘리먼트 생성
// props전달 시 종종 사용
type props = {"name": string}

let render01 = (myComp: props => React.element) => {
  <div> {React.createElement(myComp, {"name": "Franz"})} </div>
}

let render02 = (renderMyComp: (~name: string) => React.element) => {
  <div> {renderMyComp(~name="Franz")} </div>
}

// createElementVariadic함수는 세 번째 매개변수로 자식 배열을 받는다(주로 JSX변환에 이용된다)
// 타입 검사를 만족시키기 위해 chidren: React.null을 props로 전달(리액트는 children array를 더 선호)
type props02 = {"title": string, "children": React.element}
let render = (article: props02 => React.element) => {
  let children = [React.string("Introduction"), React.string("Body")]

  let props = {"title": "Article #1", "children": React.null}
  {React.createElementVariadic(article, props, children)}
}

// DOM엘리먼트 만들기
// ReactDOMRe는 다음 버전에서 제거될 것이다
let _ = ReactDOMRe.createDOMElementVariadic(
  "div",
  ~props=ReactDOM.domProps(~className="card", ()),
  [],
)

// element 복사하기
let original = <div className="hello" />

/* className이 "world"로 설정 된 새 React.element 가 반환됩니다. */
let copied = React.cloneElement(original, {"className": "world", "data-name": "some name"})

// props전달을 위해 jsx punning도입
// https://rescript-lang.org/docs/manual/latest/jsx#punning
