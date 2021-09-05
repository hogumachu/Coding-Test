// 출처 : 프로그래머스 2021 카카오 채용연계형 인턴십 숫자 문자열과 영단어
// https://programmers.co.kr/learn/courses/30/lessons/81301
// 풀이 : hogumachu

import Foundation

func solution(_ s: String) -> Int {
    // 값을 접근하기 쉽게 배열로 바꿈
    let arr = s.map { String($0) }

    // 결과 저장
    var result = ""

    // 배열 index
    var index = 0

    // 배열 크기만큼 반복
    while index < arr.count {
        switch arr[index] {
        // 현재 값이 "z" 이면 0
        case "z":
            // zero 이므로 index 를 + 4함
            result += "0"
            index += 4
        // 현재 값이 "o" 이면 1
        case "o":
            result += "1"
            index += 3
        // 현재 값이 "t" 이면 two 와 three 가 될 수 있으므로 다음 글자까지 확인해야 함
        case "t":
            if arr[index + 1] == "w" {
                result += "2"
                index += 3
            } else {
                result += "3"
                index += 5
            }
        // 현재 값이 "f" 이면 four, five
        case "f":
            if arr[index + 1] == "o" {
                result += "4"
                index += 4
            } else {
                result += "5"
                index += 4
            }
        // 현재 값이 "s" 이면 six, seven
        case "s":
            if arr[index + 1] == "i" {
                result += "6"
                index += 3
            } else {
                result += "7"
                index += 5
            }
        // 현재 값이 "e" 이면 eight
        case "e":
            result += "8"
            index += 5
        // 현재 값이 "n" 이면 nine
        case "n":
            result += "9"
            index += 4
        // 나머지는 숫자이므로 그대로 추가
        default:
            result += "\(arr[index])"
            index += 1
        }
    }

    return Int(result)!
}
