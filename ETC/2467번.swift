// 출처 : 백준 용액
// https://www.acmicpc.net/problem/2467
// 풀이 : hogumachu

let n = Int(readLine()!)!
let values: [Int] = readLine()!.split(separator: " ").map{Int(String($0))!}
var wantZero = 1_000_000_000 * 2 + 1
var result: [Int] = [0,0]
for i in 0..<n  {
    binarySearch(i+1, n-1, values[i])
}
result.sort()
print(result[0], result[1])
func binarySearch(_ start: Int, _ end: Int, _ value: Int) {
    if start >= n || end >= n {
        return
    }
    if start >= end {
        if abs(value + values[end]) < wantZero && values[end] != value {
            wantZero = abs(value + values[end])
            result[0] = value
            result[1] = values[end]
        }
        if abs(value + values[start]) < wantZero && values[start] != value {
            wantZero = abs(value + values[start])
            result[0] = value
            result[1] = values[start]
        }
        return
    }
    let mid = (start + end) / 2
    if values[mid] != value {
        if value + values[mid] == 0 {
            wantZero = 0
            result[0] = value
            result[1] = values[mid]
            return
        } else if value + values[mid] < 0 {
            if abs(value + values[mid]) < wantZero {
                wantZero = abs(value + values[mid])
                result[0] = value
                result[1] = values[mid]
            }
            binarySearch(mid+1, end, value)

        } else if value + values[mid] > 0 {
            if abs(value + values[mid]) < wantZero {
                wantZero = abs(value + values[mid])
                result[0] = value
                result[1] = values[mid]
            }
            binarySearch(start, mid-1, value)
        }
    }

}
