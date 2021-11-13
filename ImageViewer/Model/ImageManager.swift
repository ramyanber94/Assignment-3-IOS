//
//  ImageManager.swift
//  ImageViewer
//
//  Created by user202286 on 11/7/21.
//

import Foundation

class ImageManager{
    var images = [Image]()
    
    func addImage(image : Image){

        images.append(image)
     
    }
    
    func getAllImages()->[Image]{
       return images
   }
    

}
