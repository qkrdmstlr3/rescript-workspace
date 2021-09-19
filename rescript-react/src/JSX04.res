let numbers = [1, 2, 3, 4, 5]

let items01 = Js.Array.map(number => {
  <li key={Js.Int.toString(number)}> {React.int(number)} </li>
}, numbers)

type todo = {id: string, text: string}
let todos = [{id: "todo1", text: "Todo 1"}, {id: "todo2", text: "Todo 2"}]

let items02 = Js.Array.map(todo => {
  <li key={todo.id}> {React.string(todo.text)} </li>
}, todos)

// index값을 키로 사용 가능
let items03 = Js.Array.map((todo, i) => {
  /* 안정적인 ID 값이 없을 때만 Index를 사용하세요 */
  <li key={i}> {React.string(todo.text)} </li>
}, todos)

// example
type post = {id: string, title: string, content: string}

module Blog = {
  @react.component
  let make = (~posts: array<post>) => {
    let sidebar = <ul> {Js.Array.map(post => {
          <li key={post.id}> {React.string(post.title)} </li>
        }, posts)->React.array} </ul>

    let content = Js.Array.map(post => {
      <div key={post.id}>
        <h3> {React.string(post.title)} </h3> <p> {React.string(post.content)} </p>
      </div>
    }, posts)

    <div> {sidebar} <hr /> {React.array(content)} </div>
  }
}

let posts = [
  {id: "1", title: "Hello World", content: "Welcome to learning ReScript & React!"},
  {id: "2", title: "Installation", content: "You can install reason-react from npm."},
]

let blog = <Blog posts />
