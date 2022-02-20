//
//  ViewController.swift
//  ProjectOpenCV
//
//  Created by Александр on 17.02.2022.
//

import UIKit
import AVFoundation
import GPUImage
import Photos

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
  
    @IBOutlet weak var ImageGray: UIImageView!
    
 
    
 override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // let grayImage = openCVWrapper.toGray(ImageGray.image!)
       // ImageGray.image = grayImage
  
    }
    
    @IBAction func cameraShot(_ sender: Any) {
        let controller = CustomCameraController()
        self.present(controller, animated: true, completion: nil)
     
    }
    
    @IBAction func addGallery(_ sender: Any) {
        let picker = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        picker.allowsEditing = true
        present(picker, animated: true)
    }
    func  imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
     
        let image = info[.originalImage] as! UIImage
        self.ImageGray.image = image
 
       self.dismiss(animated: true, completion: nil)
        
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    

    @IBAction func AddGray(_ sender: Any) {
          
        let grayImage = openCVWrapper.toGray(ImageGray.image!)
        ImageGray.image = grayImage
        //ImageGray.transform = ImageGray.transform.rotated(by: CGFloat(Double.pi / 2)) //90
        
        
        
    }
    @IBAction func Pixellate(_ sender: Any) {
        
           let image = pixelateImage(ImageGray.image!, withIntensity: 50)
           self.ImageGray.image = image    }
    
  

    func pixelateImage(_ image: UIImage, withIntensity intensity: Int) -> UIImage {

        // initialize context and image
            let context = CIContext(options: nil)
            let logo = CIImage(data: image.pngData()!)!
            // set filter and properties
            let filter = CIFilter(name: "CIPixellate")
            filter?.setValue(logo, forKey: kCIInputImageKey)
            filter?.setValue(CIVector(x:150,y:150), forKey: kCIInputCenterKey)
            filter?.setValue(intensity, forKey: kCIInputScaleKey)
            let result = filter?.value(forKey: kCIOutputImageKey) as! CIImage
            let extent = result.extent
            let cgImage = context.createCGImage(result, from: extent)
            // result
            let processedImage = UIImage(cgImage: cgImage!)
            return processedImage

    }
}


