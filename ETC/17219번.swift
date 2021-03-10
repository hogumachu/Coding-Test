// 출처 : 백준 비밀번호 찾기
// https://www.acmicpc.net/problem/17219
// 풀이 : hogumachu
// 시간 제한이 5초라서 매우 쉽게 풀 수 있었음
// 반드시 저장된 사이트 주소를 살펴봐서 optional을 그냥 강제 언래핑함
// 해시를 사용한 집합과 맵인데 Dictionary로 풀기 간단해서 사용함

import Foundation

let input = readLine()!.split(separator: " ").map{Int(String($0))!}
let n = input[0]
let m = input[1]
var password: [String:String] = [:]
for _ in 0..<n {
    let read = readLine()!.split(separator: " ").map{String($0)}
    password.updateValue(read[1], forKey: read[0])
}

for _ in 0..<m {
    let read = readLine()!
    print(password[read]!)
}
