//
//  ViewController.swift
//  Example
//
//  Created by Hồ Minh Tường on 10/01/2024.
//

import MiTuKit

class ViewController: UIViewController {
    
    
    //Variables:
    let helloButton = UIButton()
    let userNameTextField = TTextField()
    var collectionView: UICollectionView!
    var items: [String] = []
    
}

extension ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

extension ViewController {
    func setupView() {
        self.view.backgroundColor = .white
        self.hideKeyboardEvent()
        
        self.userNameTextField >>> view >>> {
            $0.snp.makeConstraints {
                $0.top.equalTo(topSafe).offset(32)
                $0.leading.equalToSuperview().offset(16)
                $0.trailing.equalToSuperview().offset(-16)
                $0.height.equalTo(50)
            }
            $0.placeholder = "Enter Username"
            $0.eventHandle(for: .editingDidBegin) {
                self.userNameTextField.text = ""
            }
            $0.editingChangedHandle {
                let text = self.userNameTextField.text ?? ""
                print(text)
            }
            $0.editingDidEndHandle {
                guard let username = self.userNameTextField.text else {return}
                print("username: \(username)")
            }
        }
        
        //Add button to view
        self.helloButton >>> view >>> {  //Add button to view then return this button in block
            $0.snp.makeConstraints {
                $0.top.equalTo(userNameTextField.snp.bottom).offset(16)
                $0.centerX.equalToSuperview()
                $0.height.equalTo(39)
                $0.width.equalTo(helloButton.snp.height).multipliedBy(8.8)
            }
            $0.font = .bold(20)
            $0.setTitle("Hello", for: .normal)
            $0.setTitleColor(.link, for: .normal)
            $0.setImage(UIImage(systemName: "bird.fill"), for: .normal)
            $0.handle {
                print("button tapped!")
                
                Queue.main {
                    guard let username = self.userNameTextField.text, username.notNil else {
                        self.showAlert(title: "Hello!", message: "Please enter text in Username textbox then retry.", actionTile: "OK")
                        return
                    }
                    
                    self.items.append(username)
                    
                    guard let collectionView = self.collectionView else {return}
                    let indexPath = IndexPath(item: 0, section: 0)
                    collectionView.insertItems(at: [indexPath])
                    self.userNameTextField.text = ""
                    self.animationView()
                }
            }
        }
        
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView >>> view >>> {
            $0.snp.makeConstraints {
                $0.top.equalTo(helloButton.snp.bottom).offset(16)
                $0.leading.trailing.equalToSuperview()
                $0.bottom.equalTo(botSafe)
            }
            $0.backgroundColor = .white
            $0.registerReusedCell(AnyCollectionViewCell.self)
            $0.delegate = self
            $0.dataSource = self
        }
    }
    
    func animationView() {
        Task {
            //Zoom in
            await UIView.animate(duration: 1) {
                self.helloButton.snp.updateConstraints {
                    $0.height.equalTo(100)
                }
                self.helloButton.font = .bold(50)
                self.view.layoutIfNeeded()
            }
            
            await Queue.delay(2)
            
            //Zoom in
            await UIView.animate(duration: 1) {
                self.helloButton.snp.updateConstraints {
                    $0.height.equalTo(39)
                }
                self.helloButton.font = .bold(20)
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    
}

//MARK: Delegates
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusable(cellClass: AnyCollectionViewCell.self, indexPath: indexPath)
        
        cell.configCell(items[indexPath.item])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalItems: CGFloat = 2
        let padding: CGFloat = 16
        
        let width = (collectionView.bounds.size.width - (padding * (totalItems + 1))) / totalItems
        
        return CGSize(width: floor(width), height: width * 1.5)
    }
    
}


//MARK: CollectionViewCell
class AnyCollectionViewCell: UICollectionViewCell {
    
    var containerView: UIView!
    let label = UILabel()
    
    func configCell(_ text: String) {
        if containerView == nil { setupView() }
        
        self.label.text = text
    }
    
    private func setupView() {
        containerView = UIView()
        containerView >>> contentView >>> {
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            $0.backgroundColor = .random.withAlphaComponent(0.35)
            $0.layer.cornerRadius = 16
        }
        
        label >>> containerView >>> {
            $0.snp.makeConstraints {
                $0.edges.equalToSuperview()
            }
            $0.textAlignment = .center
            $0.textColor = .white
            $0.font = UIFont.boldSystemFont(ofSize: 15)
        }
    }
}
