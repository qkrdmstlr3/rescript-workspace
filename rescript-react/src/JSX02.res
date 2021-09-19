// 이전에는 리액트 엘리먼트를 어떻게 만들고 관리하는지 배움
// 이번에는 엘리먼트를 DOM에 렌더링하는 법을 배운다

let element = <h1> {React.string("Hello World")} </h1>

// 렌더링하기
// <div id="root" /> 라는 태그가 있다고 가정

switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<div> {React.string("Hello Eunsik")} </div>, root)
| None => ()
}
