//
//  ViewController.swift
//  TestAppp
//
//  Created by Sergei Kovalev on 03.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    
    var sleepDigit: Int = 2
    
    var alert3 = UIAlertController()
    
    var pol: Datum? = nil

    @IBOutlet weak var Button: UIButton!
    
    @IBOutlet weak var hzName: UILabel!
    
    @IBOutlet weak var hzText: UILabel!
    

    @IBOutlet weak var urlIMG: UIImageView!
    
    @IBOutlet weak var selectedIdLable: UILabel!
    
    
    
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        DataController.shared.fetchViews { (result) in
            switch result {
            case .success(let success):
                self.getName(with: success)
            case .failure(let error):
                print(error)
            }
        }

    }
    
    func getName(with success: [String]) {
        number = success.count
        var nameSec: [String] = success
        
            //var nameSec = success[i]
            DataController.shared.fetchDatum { (result) in
                switch result {
                case .success(let success):
                    self.update(with: success, with: self.number, with: nameSec)
                case .failure(let error):
                    print(error)
                }
            }
            //print(check)
        
        
    }
    
    func update(with success: [Datum], with number: Int, with nameSec: [String]) {
        
        
        
        for var t: Int in 0..<number {
        innerloop: for var i: Int in 0..<success.count {
                
                
                var check = success[i]
                
                // selector
                if nameSec[t] == success[i].name {
                    if success[i].data.variants != nil && success[i].data.selectedId != nil {
                        for j in 0..<success[i].data.variants!.count {
                            var variant = success[i].data.variants![j]
                            
                            if success[i].data.selectedId == j {
                                
                                var variant1 = success[i].data.variants![j]
                                
                                alert3 = UIAlertController(title: "Происхождение", message: "\(variant1)", preferredStyle: .alert)
                                alert3.addAction(UIAlertAction(title: "Готово", style: UIAlertAction.Style.cancel, handler: nil))
                                sleepDigit = 7
                                
                            }
                            print("variant\(variant)")
                            
                            
                        }
                        var selID = success[i].data.selectedId!
                        print("check\(check)")
                        

                        
                        
                        DispatchQueue.main.async {
                            self.hzName.text = success[i].name
                            self.hzText.text = success[i].data.text
                            self.urlIMG.isHidden = true
                            self.selectedIdLable.isHidden = false
                            self.selectedIdLable.text = String(success[i].data.selectedId!)
                            self.Button.isHidden = false
                        }
                        
                        
                        sleep(UInt32(sleepDigit))
                        break innerloop
                        
                    }// picture
                    else if success[i].data.url != nil {
                        
                        var urll = success[i].data.url!
                        print("check\(check)")

                        let url = success[i].data.url
                        let imageURL = URL(string: url!)
                        guard let imageData = try? Data(contentsOf: imageURL!) else { return }
                        
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.hzText.text = success[i].data.text
                            self.hzName.text = success[i].name
                            self.urlIMG.isHidden = false
                            self.urlIMG.image = image
                            self.selectedIdLable.isHidden = true
                            self.Button.isHidden = true
                        }
                        
                        
                        
                        
                        sleep(UInt32(sleepDigit))
                        break innerloop
                    } // hz
                    else {
                        print("check\(check)")

                        DispatchQueue.main.async {
                            self.hzName.text = success[i].name
                            self.hzText.text = success[i].data.text
                            self.urlIMG.isHidden = true
                            self.selectedIdLable.isHidden = true
                            self.Button.isHidden = true
                        }
                        sleep(UInt32(sleepDigit))
                        
                        break innerloop
                    }
                }
            
                
                
            }
            
        }
    }

    
    
    
    
    @IBAction func buttontapped(_ sender: Any) {
        
        self.present(alert3, animated: true, completion: nil)
        
    }
    
    
    
    
    

}

