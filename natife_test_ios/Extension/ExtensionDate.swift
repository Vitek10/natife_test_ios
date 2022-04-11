import Foundation

extension Date {
    
    func timeAgoDisplay(timeAgo: Date) -> String {
    let secondsAgo = Int(Date().timeIntervalSince(timeAgo))
    let minute = 60
    let hour = 60 * minute
    let day = 24 * hour
    let week = 7 * day
    let month = 4 * week
    let quotient: Int
    let unit: String
        
    if secondsAgo < minute {
        quotient = secondsAgo
        unit = quotient == 1 ? "секунда" : "секунд"
    } else if secondsAgo < hour {
        quotient = secondsAgo / minute
        unit = quotient == 1 ? "минута" : "минут"
    }
    else if secondsAgo < day {
        quotient = secondsAgo / hour
        unit = quotient == 1 ? "час" : "часов"
    } else if secondsAgo < week {
        quotient = secondsAgo / day
        unit = quotient == 1 ? "день" : "дней"
    } else if secondsAgo < month {
        quotient = secondsAgo / week
        unit = quotient == 1 ? "неделю" : "недель"
    } else {
        quotient = secondsAgo / month
        unit = quotient == 1 ? "месяц" : "месяцев"
    }
    return "\(quotient) \(unit) назад"
    }
}
