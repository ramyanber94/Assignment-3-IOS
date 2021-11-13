//
//  AddImageViewController.swift
//  ImageViewer
//
//  Created by user202286 on 11/7/21.
//

import UIKit


protocol AddingImageProtocol {
    func controllerDidFinishWithNewImage(im : Image)
    func controllerDidCancel()
}

class AddImageViewController: UIViewController {
    var delegate: AddingImageProtocol?
    var errorMsg = ""
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtURL: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnAdd(_ sender: Any) {
        if let name = txtTitle.text{
            if !name.isEmpty{
            if let url = txtURL.text{
                if !url.isEmpty{
                if verifyUrl(urlString: url){
                if !name.isEmpty && !url.isEmpty{
                    let newImage = Image(n: name, u: url)
                    delegate?.controllerDidFinishWithNewImage(im: newImage)
                    dismiss(animated: true, completion: nil)
                    
                }
                }else{
                    errorMsg = "invalid Url!!!"
                    popUpAlert(errorMsg: errorMsg)
                    self.txtURL.text = ""
                }
                }else{
                        errorMsg = "Please fill the url text area!!!"
                        popUpAlert(errorMsg: errorMsg)
                }
            }
            }else{
                errorMsg = "Please fill the title text area!!!"
                popUpAlert(errorMsg: errorMsg)
            }
        }
        
    }
    @IBAction func btnCancel(_ sender: Any) {
        delegate?.controllerDidCancel()
        dismiss(animated: true, completion: nil)
    }
    
    func verifyUrl(urlString: String?)-> Bool {
        if let url = URL(string: urlString ?? "") {
               return UIApplication.shared.canOpenURL(url)
            }else{
                return false
            }
        
    }
    func popUpAlert(errorMsg: String){
        let alertController = UIAlertController(title: "Alert", message: errorMsg, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action: UIAlertAction!) in
        }
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
        
}
