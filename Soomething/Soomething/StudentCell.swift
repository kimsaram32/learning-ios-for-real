import SwiftUI

class StudentCell: UICollectionViewCell {
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    lazy var nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [imageView, nameLabel])
        stack.spacing = 10.0
        stack.axis = .vertical
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalTo: stack.widthAnchor).isActive = true
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    func initialize() {
        contentView.addSubview(stack)
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stack.widthAnchor.constraint(lessThanOrEqualTo: contentView.widthAnchor),
            stack.heightAnchor.constraint(lessThanOrEqualTo: contentView.heightAnchor),
        ])
    }
    
    func setup(student: Student) {
        imageView.image = student.profileImage
        nameLabel.text = student.formattedName
    }
}
