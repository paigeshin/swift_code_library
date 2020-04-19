func requestInfo(flowerName: String) {
            
            let parameters : [String: String] = [
                "format" : "json",
                "action" : "query",
                "prop" : "extracts|pageimages",
                "exintro" : "",
                "explaintext" : "",
                "titles" : flowerName,
                "indexpageids" : "",
                "redirects" : "1",
                "pithumbsize" : "500"
            ]
            
            AF.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
                
                print(response.result)
                
                //json parsing using swifty json
                
                 let flowerJSON: JSON
                
                switch response.result {
                case .success(let value):
                    flowerJSON = JSON(value)
                    
                    print("flowerJSON: \(flowerJSON)")
                    
                    let pageId = flowerJSON["query"]["pageids"][0].stringValue
                    
                    print(flowerJSON["query"])
                    
                    let flowerDescription = flowerJSON["query"]["pages"][pageId]["extract"].stringValue
                    
                    let flowerImageURL = flowerJSON["query"]["pages"][pageId]["thumbnail"]["source"].stringValue
                    
                    self.imageView.sd_setImage(with: URL(string: flowerImageURL))
                    
                    self.label.text = flowerDescription
                    
                case .failure(let error):
                    print(error)
                }
            }