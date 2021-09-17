// type정의를 포함하는 작은 파일들
// 모든 파일은 파일과 동일한 이름의 모듈로 자체 컴파일되며 대문자로 표시된다
module School = {
  type profession = Teacher | Director

  let person1 = Teacher
  let getProfession = person =>
    switch person {
    | Teacher => "A teacher"
    | Director => "A director"
    }
}

let anotherPerson: School.profession = School.Teacher
Js.log(School.getProfession(anotherPerson))

// nested
module MyModule = {
  module NestedModule = {
    let message = "hello"
  }
}

let message = MyModule.NestedModule.message

// open 을 사용하면 모듈명 생략가능
module User = {
  let user1 = "Anna"
  let user2 = "Franz"
}

let {user1, user2} = module(User)
let {user1: anna, user2: franz} = module(User)

// 모듈 확장
module BaseComponent = {
  let defaultGreeting = "Hello"
  let getAudience = (~excited) => excited ? "world!" : "world"
}

module ActualComponent = {
  /* the content is copied over */
  include BaseComponent
  /* overrides BaseComponent.defaultGreeting */
  let defaultGreeting = "Hey"
  let render = () => defaultGreeting ++ " " ++ getAudience(~excited=true)
}

// signature
// 대문자로 시작
/* Picking up previous section's example */
module type EstablishmentType = {
  type profession
  let getProfession: profession => string
}

// 확장
module type BaseComponent = {
  let defaultGreeting: string
  let getAudience: (~excited: bool) => string
}

module type ActualComponent = {
  /* the BaseComponent signature is copied over */
  include BaseComponent
  let render: unit => string
}
