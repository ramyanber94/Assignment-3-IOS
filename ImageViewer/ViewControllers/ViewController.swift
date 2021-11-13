//
//  ViewController.swift
//  ImageViewer
//
//  Created by user202286 on 11/7/21.
//

import UIKit

class ViewController: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource, AddingImageProtocol{

    var images : ImageManager = ImageManager()
    var url = ""
    @IBOutlet weak var pickerTitle: UIPickerView!
    @IBOutlet weak var imageArea: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }
    
    
    func controllerDidFinishWithNewImage(im: Image) {
        images.addImage(image: im)
        for i in images.getAllImages() {
            print(i.name)
        }
        pickerTitle.reloadAllComponents()
    }
    
    func controllerDidCancel() {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let IVC = segue.destination as! AddImageViewController
        IVC.delegate = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return images.getAllImages().count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        url = images.getAllImages()[row].url
        let imagePath = URL(string: url)
        let queue = DispatchQueue.init(label: "1")
        queue.async {
            let data = try? Data(contentsOf: imagePath!)
            DispatchQueue.main.async {
                self.imageArea.image = UIImage(data: data!)
            }
            
        }
       
        return images.getAllImages()[row].name
    }


}

