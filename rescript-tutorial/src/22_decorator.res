// 추가 기능표현을 위해서 데코레이팅을 지원

@inline
let mode = "dev"

// 전체파일에 주석을 추가
@@warning("-27")

// 유형 정의에 주석을 단다
@unboxed
type a = Name(string)

//
@val external message: string = "message"

// as("aria-label") 주석을 단다
type student = {
  age: int,
  @as("aria-label") ariaLabel: string,
}

// 의존하지 말라는 경고
@deprecated
let customDouble = foo => foo * 2

@deprecated("Use SomeOther.customTriple instead")
let customTriple = foo => foo * 3
