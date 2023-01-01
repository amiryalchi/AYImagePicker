//
//  AYImagePickerDelegate.swift
//  
//
//  Created by Amir Yalchi on 2023-01-01.
//

import Foundation


import UIKit    
import SwiftUI

class AYImagePickerDelegate: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    var completion: (UIImage?) -> Void
    
    init(completion: @escaping (UIImage?) -> Void) {
        self.completion = completion
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[.editedImage] as? UIImage {
            completion(image)
        } else if let image = info[.originalImage] as? UIImage {
            completion(image)
        } else {
            completion(nil)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        completion(nil)
        picker.dismiss(animated: true, completion: nil)
    }
    
}

