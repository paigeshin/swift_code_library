struct Time {
        
    //설명:
    //CurrentTime을 기준으로 값을 잡아준다.
    //CurrentMidNight <= CurrentNextMidNight
    
    static var CurrentTime: Int {
        get {
            return Int(Date().timeIntervalSince1970 * 1000)
        }
    }
    
    static var CurrentMidNight: Int {
        get {
            let calendar: Calendar = Calendar(identifier: .gregorian)
            let startOfDay: Date = calendar.startOfDay(for: Date())
            let startOfDayTimestamp: TimeInterval = startOfDay.timeIntervalSince1970 * 1000
            return Int(startOfDayTimestamp)
        }
    }
    
    static var CurrentNextMidNight: Int {
        get {
            return CurrentMidNight + OneDay
        }
    }
    
    static let OneHour: Int = 3600000;
    static let OneMinute: Int = 60000;
    static let OneDay: Int = 86400000;
}