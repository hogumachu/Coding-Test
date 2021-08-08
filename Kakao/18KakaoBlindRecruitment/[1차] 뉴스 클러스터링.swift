// 출처 : 프로그래머스 2018 KAKAO BLIND RECRUITMENT [1차] 뉴스 클러스터링
// https://programmers.co.kr/learn/courses/30/lessons/17677#
// 풀이 : hogumachu

func solution(_ str1:String, _ str2:String) -> Int {
    let lowStr1 = Array(str1.lowercased())
    let lowStr2 = Array(str2.lowercased())
    var alpha1: [[Int]] = Array(repeating: Array(repeating: 0, count: 27), count: 27)
    var alpha2: [[Int]] = Array(repeating: Array(repeating: 0, count: 27), count: 27)
    var minSum = 0
    var maxSum = 0
    var indices: [(Int, Int)] = []
    for i in 1..<lowStr1.count {
        if canConvertAscii(lowStr1[i - 1]) && canConvertAscii(lowStr1[i]) {
            alpha1[convertAsciiNum(lowStr1[i - 1])][convertAsciiNum(lowStr1[i])] += 1
        }
    }

    for i in 1..<lowStr2.count {
        if canConvertAscii(lowStr2[i - 1]) && canConvertAscii(lowStr2[i]) {
            alpha2[convertAsciiNum(lowStr2[i - 1])][convertAsciiNum(lowStr2[i])] += 1
        }
    }

    for i in 0..<27 {
        for j in 0..<27 {
            let mini = min(alpha1[i][j], alpha2[i][j])
            let maxi = max(alpha1[i][j], alpha2[i][j])
            minSum += mini
            maxSum += maxi

            if maxi != 0 {
                indices.append((i, j))
            }
        }
    }

    if indices.count == 0 {
        return 65536
    } else if indices.count == 1 {
        let x = indices[0].0, y = indices[0].1
        return 65536 * min(alpha1[x][y], alpha2[x][y]) / max(alpha1[x][y], alpha2[x][y])
    } else {
        return 65536 * minSum / maxSum
    }

}

func canConvertAscii(_ char: Character) -> Bool {
    if char.asciiValue! >= 97 && char.asciiValue! <= 122 {
        return true
    } else {
        return false
    }
}

func convertAsciiNum(_ char: Character) -> Int {
    return Int(char.asciiValue!) - 97
}
