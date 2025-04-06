//
//  StudentViewController.swift
//  Soomething
//
//  Created by 김민정 on 4/2/25.
//

import UIKit

class StudentViewController: UIViewController {
    
    private var student: Student? = nil
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        
        guard let student else { return }
        
        title = student.formattedName
        
        let imageView = UIImageView(image: student.profileImage)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        
        view.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }
    
    func setup(student: Student) {
        self.student = student
    }
}
