// 출처 : 프로그래머스 2021 KAKAO BLIND RECRUITMENT 광고 삽입
// https://programmers.co.kr/learn/courses/30/lessons/72414
// 풀이 : hogumachu

import Foundation

func solution(_ play_time:String, _ adv_time:String, _ logs:[String]) -> String {
    // play_time 을 Int 형으로 변경
    let playtimeLength = stringToTime(play_time)

    // log 의 시작과 끝의 수를 count 한 것을 저장할 배열
    var countedLogs = Array(repeating: 0, count: playtimeLength + 1)

    // 현재 몇 명이 시청중인지에 대해 저장할 배열 (countedLogs 와 같은 사이즈라 그냥 같다고 할당)
    var watchingCount = countedLogs

    // logs 에 대한 반복문
    for log in logs {
        // 시작 시간과 끝 시간을 얻음
        let arrLog = log.split { $0 == "-"}.map { String($0) }
        let start = stringToTime(arrLog[0])
        let end = stringToTime(arrLog[1])

        // countedLogs 에 시작 시간일 때는 +1 을, 끝 시간일 때는 -1을 하여 이 시간에 새로운 인원이 추가되고 사라지는 지 알 수 있음
        countedLogs[start] += 1
        countedLogs[end] -= 1
    }

    // 광고 시간에 대한 Int 형
    let advLength = stringToTime(adv_time)

    // 현재 몇 명인지에 대해 count 하기 위한 값
    var counting = 0

    // wathingCount 에 대해 모든 값을 설정함
    for i in 0...playtimeLength {
        counting += countedLogs[i]
        watchingCount[i] = counting
    }

    // 00:00:00 부터 시작해서 광고 시간까지 동안 보고 있는 인원에 대한 값
    var now = watchingCount[0..<advLength].reduce(0, +)

    // 최대값과 최대값에 대한 위치
    var maxTime = now
    var maxLocation = 0

    // 현재 인원이 최대 인원보다 크면 변경함
    for i in 0...playtimeLength - advLength {
        now -= watchingCount[i]
        now += watchingCount[i + advLength]

        if now > maxTime {
            maxTime = now
            maxLocation = i + 1
        }
    }

    return timeToString(maxLocation)
}

// String 값을 Int 로 변경함
func stringToTime(_ str: String) -> Int {
    let arr = str.split { $0 == ":" }.map { Int(String($0))! }
    return arr[0] * 3600 + arr[1] * 60 + arr[2]
}

// Int형을 String으로 변경함
func timeToString(_ time: Int) -> String {
    var time = time
    var timeStr = ""

    if time % 60 < 10 {
        timeStr = ":0\(time % 60)"
    } else {
        timeStr = ":\(time % 60)"
    }

    time /= 60

    if time % 60 < 10 {
        timeStr = ":0\(time % 60)" + timeStr
    } else {
        timeStr = ":\(time % 60)" + timeStr
    }

    time /= 60

    if time < 10 {
        timeStr = "0\(time)" + timeStr
    } else {
        timeStr = "\(time)" + timeStr
    }

    return timeStr
}
