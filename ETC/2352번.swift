// 출처 : 백준 반도체 설계
// https://www.acmicpc.net/problem/2352
// 풀이 : hogumachu

let n = Int(readLine()!)!
var values = readLine()!.split(separator: " ").map{ Int(String($0))! }
var div: [Int] = [values.first!]
var result = 1

_ = values.dropFirst()

values.forEach({ value in
    if value > div.last! {
        div.append(value)
        result += 1
    } else {
        div[binary(div, value)] = value
    }
})

print(result)

func binary(_ arr: [Int], _ x: Int) -> Int {
    var a = 0
    var b = arr.count

    while a < b {
        let mid = ( a + b) / 2
        if x <= arr[mid] {
            b = mid
        } else {
            a = mid + 1
        }
    }

    return a
}
