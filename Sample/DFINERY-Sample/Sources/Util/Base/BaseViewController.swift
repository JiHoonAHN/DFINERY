import UIKit

class BaseVC : UIViewController{
    let bound = UIScreen.main.bounds

    override func viewDidLoad() {
        setupBackgroundIfNotSet()
        addView()
        configureUI()
        keyBoardLayout()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setLayout()
    }
    
    deinit{
        print("\(type(of: self)): \(#function)")
    }
    
    //MARK: - Method
    private func setupBackgroundIfNotSet(){
        if self.view.backgroundColor == nil{
            self.view.backgroundColor = .white
        }
    }
    func addView(){}
    func setLayout(){}
    func configureUI(){}
    func keyBoardLayout(){}
}
