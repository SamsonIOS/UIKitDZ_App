//
//  Extension + ForUsViewController.swift
//  UIKitDZ_App
//
//  Created by coder on 12.10.2022.
//

import UIKit

/// Расширение для ForYouViewController подписываемся на делегаты
extension ForUsViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        iconImageView.image = image
        guard let imageData = image.pngData() else { return }
        saveUserDefaults(image: imageData)
        dismiss(animated: true)
    }
}

extension ForUsViewController: UINavigationControllerDelegate {
}
