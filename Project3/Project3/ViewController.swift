//
//  ViewController.swift
//  Project3
//
//  Created by 김민정 on 4/1/25.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var imageView = UIImageView(image: UIImage(named: "image"))
    lazy var label = UILabel()
    lazy var stack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        label.text = "Die"
        
        stack.spacing = 30.0
        stack.axis = .vertical
        stack.alignment = .center
        
        stack.addArrangedSubview(imageView)
        stack.addArrangedSubview(label)
        view.addSubview(stack)
        
        stack.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 100.0),
            imageView.heightAnchor.constraint(equalToConstant: 100.0),
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
        
        navigationItem.title = "Die"
        navigationItem.rightBarButtonItem =
            UIBarButtonItem(
                image: UIImage(systemName: "square.and.arrow.up"),
                style: .plain,
                target: self,
                action: #selector(shareTapped)
            )
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.pngData() else {
            let vc = UIAlertController(title: "Error", message: "No image found", preferredStyle: .alert)
            present(vc, animated: true)
            return
        }
        
        let vc = UIActivityViewController(activityItems: [image, "Die"], applicationActivities: [])
        present(vc, animated: true)
    }


}

