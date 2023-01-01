import SwiftUI

public struct AYImagePicker { 
    
    public static func openImagePicker(
        sourceType: UIImagePickerController.SourceType,
        allowsEditing: Bool = false,
        completion: @escaping (UIImage?) -> Void
    ) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = sourceType
        imagePicker.allowsEditing = allowsEditing
        imagePicker.delegate = AYImagePickerDelegate(completion: completion)
        UIApplication.shared.keyWindow?.rootViewController?.present(imagePicker, animated: true, completion: nil)
    }
    
    public static func openCamera(
        allowsEditing: Bool = false,
        completion: @escaping (UIImage?) -> Void
    ) {
        openImagePicker(sourceType: .camera, allowsEditing: allowsEditing, completion: completion)
    }
    
    public static func openPhotoLibrary(
        allowsEditing: Bool = false,
        completion: @escaping (UIImage?) -> Void
    ) {
        openImagePicker(sourceType: .photoLibrary, allowsEditing: allowsEditing, completion: completion)
    }
    
}
