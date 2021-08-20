// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 광고 삽입
// https://programmers.co.kr/learn/courses/30/lessons/72414
// 풀이 : hogumachu
// String 으로 표시된 time 을 Int 로 변경하여 품
// 0부터 play_time 을 Int 로 바꾼 pt 까지의 배열을 생성하여 해당 시간에 몇명이 보고 있는 지 값을 넣었음

import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    let pt = timeToSecond(play_time)
    let at = timeToSecond(adv_time)
    var arr = Array(repeating: 0, count: pt + 1)
    var order = arr

    // log 에서 시작 시간과 끝 시간을 얻어 order[start] 와 order[end] 에 각각 값을 설정해줌
    // order[start] 는 이 때부터 1명이 추가적으로 보기 시작하여 + 1
    // order[end] 는 이 때부터 1명이 보지 않아서 -1 하였음
    for log in logs {
        let splitLog = log.split(separator: "-")
        let start = timeToSecond(String(splitLog[0]))
        let end = timeToSecond(String(splitLog[1]))
        order[start] += 1
        order[end] -= 1
    }

    var counting = 0

    // 만약 order 값이 0 이 아닐 때는 현재 시청 중인 인원의 변화가 있다는 이야기
    // 따라서 현재 보는 인원 (counting) 에 order 만큼 값을 설정해줌
    // 그리고 현재 보는 인원은 계속하여 arr 에 값을 넣어줌
    for i in 0...pt {
        if order[i] != 0 {
            counting += order[i]
        }
        arr[i] = counting
    }

    // 광고 시간 (at) 동안 보고 있는 인원에 대한 sum
    var sum = arr[0..<at].reduce(0, +)

    // 최대 광고를 몇명 보는 지에 대한 maxi
    var maxi = sum

    // 최대 광고를 몇명 볼 때의 광고 시작 시간
    var location = 0


    // 광고 시작 시간을 계속 1초씩 추가하여 이전 최대 시청자보다 현재 시청자가 많을 때 최대 값과 이에 따른 시작 시간 (location) 을 변경
    if pt - at > 1 {
        for i in 1...pt - at {
            sum -= arr[i - 1]
            sum += arr[i + at - 1]
            if maxi < sum {
                maxi = sum
                location = i
            }
        }
    }

    return secondToTime(location)
}

// String 을 Int 로 변경
func timeToSecond(_ str: String) -> Int {
    let arr = str.split(separator: ":")
    return Int(arr[0])! * 60 * 60 + Int(arr[1])! * 60 + Int(arr[2])!
}

// Int를 String 으로 변경
func secondToTime(_ num: Int) -> String {
    var arr = [0, 0, 0]
    var div = 60 * 60
    var newNum = num
    var index = 0
    var str = ""

    while newNum > 0 {
        arr[index] = newNum / div
        newNum = newNum % div
        div /= 60
        index += 1
    }

    for i in 0..<3 {
        switch arr[i] {
        case 0...9:
            str += "0\(arr[i])"
        default:
            str += "\(arr[i])"
        }
        if i != 2 {
            str += ":"
        }
    }
    return str
}
