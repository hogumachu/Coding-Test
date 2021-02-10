// 출처 : 백준 수 찾기
// https://www.acmicpc.net/problem/1920
// 풀이 : hogumachu

import Foundation

let _ = readLine()!
let value = readLine()!.split(separator: " ").map{Int(String($0))!}
var dic: [Int : Int] = [:]
let _ = readLine()!
let search = readLine()!.split(separator: " ").map{Int(String($0))!}

for i in value {
    dic[i] = 1
}



for i in search {
    if dic[i] != nil {
        print(dic[i]!)
    } else {
        print(0)
    }
}
