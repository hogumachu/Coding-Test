// 출처 : 백준 RGB거리
// https://www.acmicpc.net/problem/1149
// 풀이 : hogumachu
// 문제를 잘 읽고 규칙을 찾기
// 문제의 크기가 작은 것을 먼저 생각하고 점차 크기를 키워 나가기

import Foundation

func solution() {
    let n = Int(readLine()!)!
    let firstRGB = readLine()!.split(separator: " ").map{Int(String($0))!}
    var R = firstRGB[0]
    var G = firstRGB[1]
    var B = firstRGB[2]

    for i in 1..<n {
        let RGB = readLine()!.split(separator: " ").map{Int(String($0))!}
        let minR = min(G+RGB[0], B+RGB[0])
        let minG = min(R+RGB[1], B+RGB[1])
        let minB = min(R+RGB[2], G+RGB[2])
        R = minR
        G = minG
        B = minB
    }
    print(min(R,G,B))
}

solution()
