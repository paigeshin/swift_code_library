@IBAction func navigationButtonPressed(_ sender: UIButton) {
        let navigationDrawerVC: NavigationDrawerVC = UIStoryboard(name: K.Storyboard.Main, bundle: nil).instantiateViewController(identifier: "NavigationDrawerVC")
        let transition = CATransition()
        transition.duration = 0.5
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeInEaseOut)
        view.window!.layer.add(transition, forKey: kCATransition)
        navigationDrawerVC.modalPresentationStyle = .overCurrentContext
        present(navigationDrawerVC, animated: true, completion: nil)
        
    }