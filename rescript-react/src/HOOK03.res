// useReducer

// useState로 관리하기 복잡한 경우
// https://velog.io/@danbii/useReducer-useContext
// let (state, dispatch) = React.useReducer(reducer, initialState)

// 여러 하위 값을 포함하는 복잡한 상태관련로직일 경우 선호됨

type action = Inc | Dec
type state = {count: int}

let reducer = (state, action) => {
  switch action {
  | Inc => {count: state.count + 1}
  | Dec => {count: state.count - 1}
  }
}

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(reducer, {count: 0})

  <>
    {React.string("Count:" ++ Js.Int.toString(state.count))}
    <button onClick={_ => dispatch(Dec)}> {React.string("-")} </button>
    <button onClick={_ => dispatch(Inc)}> {React.string("+")} </button>
  </>
}

// 지연 초기화
// https://rescript-lang.org/docs/react/latest/hooks-reducer#lazy-initialization
// let (state, dispatch) = React.useReducerWithMapState(reducer, initialState, initial)
// 액션에 대한 응답을 가지고 나중에 상태를 재설정할 수 있다
