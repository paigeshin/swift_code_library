import RealmSwift
    
    class Kanji: Object {
        
        @objc dynamic var index: Int = -1
        @objc dynamic var kanji: String = ""
        @objc dynamic var meaning: String = ""
        @objc dynamic var meaning_kr: String = ""
        @objc dynamic var meaning_fr: String = ""
        
        let words: List<Word> = List<Word>()
        
        
    }

import RealmSwift

class Word: Object {

    @objc dynamic var word: String = ""
    @objc dynamic var reading: String = ""
    @objc dynamic var meaning: String = ""
    @objc dynamic var meaning_fr: String = ""
    @objc dynamic var meaning_kr: String = "''"
    var parentKanji = LinkingObjects(fromType: Kanji.self, property: "words")

}