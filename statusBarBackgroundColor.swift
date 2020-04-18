//ios 12까지

    //UIApplication 에서 statusBar를 "statusBar" 로 찾아온다
    guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBar") as? UIView else { return }
    statusBar.backgroundColor = .blue
    setNeedsStatusBarAppearanceUpdate()
    

//ios 13부터 

//- app delegate

    extension UIApplication {
        class var statusBarView: UIView? {
            var statusBarView: UIView?
            if #available(iOS 13.0, *) {
                let tag = 38482458385
                if let statusBar = UIApplication.shared.keyWindow?.viewWithTag(tag) {
                    statusBarView = statusBar
                } else {
                    let statusBar = UIView(frame: UIApplication.shared.statusBarFrame)
                    statusBar.tag = tag
                    UIApplication.shared.keyWindow?.addSubview(statusBar)
                    statusBarView = statusBar
                }
                
            } else {
                statusBarView = UIApplication.shared.value(forKey: "statusBar") as? UIView
                
            }
            return statusBarView
        };
        
        class var statusBarBackgroundColor: UIColor? {
            get {
                return statusBarView?.backgroundColor
            }
            set {
                statusBarView?.backgroundColor = newValue
            }
                        
        }
        
    }


//사용법
    guard let statusBarView = UIApplication.statusBarView else { return }
        
// StatusBarView의 Background Color를 변경하는 방법
    UIApplication.statusBarBackgroundColor = .blue
