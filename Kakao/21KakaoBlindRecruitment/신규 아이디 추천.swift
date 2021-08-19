// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 신규 아이디 추천
// https://programmers.co.kr/learn/courses/30/lessons/72410
// 풀이 : hogumachu

import Foundation

func solution(_ new_id: String) -> String {
    // String 을 lowercased 를 이용하여 소문자로 만들어줌
    let lower = new_id.lowercased()

    var arr: [String] = []
    var before = 0

    lower.forEach {
        // asciiValue 를 이용하여 숫자, 알파벳, 뺴기, 밑줄, 마침표에 해당한 값들만 배열에 추가하였음

        let asc = Int($0.asciiValue!)
        switch asc {
        case 45, 46, 48...57, 95, 97...122:
        // 추가할 때 이전 값이 마침표이고 현재 값이 마침표라면 마침표 2번 이상 연속된 부분이므로 추가하지 않음
            if before == 46 && asc == 46 {
                break
            } else {
                arr.append("\($0)")
            }
            before = asc
        default:
            break
        }
    }

    // 전부 다 추가한 후 배열의 첫번째가 마침표가 아닐 때 까지 제거
    while arr.first == "." {
        arr.removeFirst()
    }

    // 배열의 마지막이 마침표가 아닐 때 까지 제거
    while arr.last == "." {
        arr.removeLast()
    }

    // 만약 배열이 비어있다면 "a" 를 추가함
    if arr.isEmpty {
        arr.append("a")
    }

    // 배열의 크기가 15를 넘어가면 배열의 크기를 15로 줄여줌
    while arr.count > 15 {
        arr.removeLast()
    }

    // 배열의 마지막이 마침표가 아닐 때 까지 제거
    while arr.last == "." {
        arr.removeLast()
    }

    // 만약 배열의 크기가 3보다 작으면 배열의 마지막 값을 배열의 크기가 3이 될 때 까지 추가하였음 (강제 언래핑을 사용해도 되는데 그냥 "a" 를 추가함)
    while arr.count < 3 {
        arr.append(arr.last ?? "a")
    }

    // 마지막으로 배열을 String 으로 변경하여 값을 제출함. result 라 안하고 그냥 그대로 return 해도 상관 없음.
    
    let result = arr.reduce("", +)

    return result
}
