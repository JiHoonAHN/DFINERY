import UIKit
import DFINERY_SDK

final class ViewController: BaseVC {
    
    private let igasdk = IGASDK.shared
    
    //MARK: - Properties
    private let nameTextField : UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Write your nickName."
        return textfield
    }()
    
    private lazy var joinButton : UIButton = {
        let button = UIButton()
        button.backgroundColor  = .systemBlue
        button.setTitle("Join", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.addTarget(self, action: #selector(joinButtonClick), for: .touchUpInside)
        return button
    }()
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        igasdk.`init`(appkey: "2848hoonxx@gmail.com")
        jiHoonAHNProfile()
        configureUI()
        addView()
        setLayout()
    }
    
    
    //MARK: - Method
    override func configureUI() {
        self.title = "Join"
    }
    
    override func addView() {
        view.addSubviews(
            nameTextField,
            joinButton
        )
    }
    
    override func setLayout() {
        nameTextField.addConstraintLayout([
            equal(view, \.safeAreaLayoutGuide.topAnchor,constant: 20),
            equal(view, \.leadingAnchor, constant: 20),
            equal(view, \.trailingAnchor, constant: -20)
        ])
        
        joinButton.addConstraintLayout([
            equal(view, \.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            equal(view, \.leadingAnchor, constant: 20),
            equal(view, \.trailingAnchor, constant: -20)
        ])
    }
    
    
    //MARK: - IGASDK
    private func jiHoonAHNProfile(){
        igasdk.setUserProperty([
            "name" : "JiHooonAHN",
            "job" : "iOS SDK Developer",
            "age" : "19"
        ])
    }
    
    @objc
    func joinButtonClick(){
        igasdk.addEvent("join", ["nickName" : nameTextField.text ?? ""])
    }
}
