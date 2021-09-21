// useEffect

// useEffect => 렌더링 완료될 때마다 실행
// useEffect0 => 마운트 된 후 단 한번만 실행
// useEffect1 => 의존성을 배열로 받음
// useEffect2 => 의존성을 튜플로 두 개를 받음
// useEffect3 => 의존성을 튜플로 세 개를 받음
// 의존성의 타입이 같으면 배열을 아니라면 튜플을 사용한다

// 매 렌더링마다 업데이트, 클린업이 없는 이펙트
module Document01 = {
  type t
  @val external document: t = "document"
  @set external setTitle: (t, string) => unit = "title"
}

@react.component
let make = () => {
  let (count, setCount) = React.useState(_ => 0)

  React.useEffect(() => {
    open Document01
    document->setTitle(`You clicked ${Js.Int.toString(count)} times!`)
    None
  }) // [count]와 useEffect1를 주면 이전 렌더링과 값이 다를 때만 이펙트가 실행된다

  let onClick = _evt => {
    setCount(prev => prev + 1)
  }

  let msg = "You clicked" ++ Js.Int.toString(count) ++ "times"

  <div> <p> {React.string(msg)} </p> <button onClick> {React.string("Click me")} </button> </div>
}

// 메모리 누수 방지를 위한 클린업 이펙트
module ChatAPI = {
  type status = {isOnline: bool}
  @val
  external subscribeToFriendStatus: (string, status => unit) => unit = "subscribeToFriendStatus"
  @val
  external unsubscribeFromFiendStatus: (string, status => unit) => unit =
    "unsubscribeFromFriendStatus"
}

type state = Offline | Loading | Online

@react.component
let make02 = (~friendId: string) => {
  let (state, setState) = React.useState(_ => Offline)

  React.useEffect(() => {
    let handleStatusChange = status => {
      setState(_ => {
        status.ChatAPI.isOnline ? Online : Offline
      })
    }

    ChatAPI.subscribeToFriendStatus(friendId, handleStatusChange)
    setState(_ => Loading)

    let cleanup = () => {
      ChatAPI.unsubscribeFromFiendStatus(friendId, handleStatusChange)
    }

    Some(cleanup)
  })

  let text = switch state {
  | Offline => friendId ++ " is offline"
  | Online => friendId ++ " is online"
  | Loading => "loading..."
  }

  <div> {React.string(text)} </div>
}
