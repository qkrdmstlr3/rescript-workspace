// router

// RescriptReactRouter.push(string): 새로운 경로로 이동, url 업데이트
// RescriptReactRouter.replace(string): 현재 url 대체
// 그 외: https://rescript-lang.org/docs/react/latest/router

// watch url은 다음과 같은 형태로 돌려준다
type url = {
  path: list<string>,
  hash: string,
  search: string,
}
// www.hello.com/book/10/edit?name=Jane#author
// path: list{"book", "10", "edit"}
// hash: "author"
// search: "name=Jane"

/* Routing */
// App.res
// @react.component
// let make = () => {
//   let url = RescriptReactRouter.useUrl()

//   switch url.path {
//   | list{"user", id} => <User id />
//   | list{} => <Home />
//   | _ => <PageNotFound />
//   }
// }
