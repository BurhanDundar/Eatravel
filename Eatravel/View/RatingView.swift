//
//  RatingView.swift
//  Eatravel
//
//  Created by Yapı Kredi Teknoloji A.Ş. on 30.08.2023.
//

import UIKit

class RatingView: UIView {
    
    private var selectedRate: Int = 0
    
    private let feedbackGenerator = UISelectionFeedbackGenerator()
    
    private let container: UIStackView = {
            let stackView = UIStackView()
            stackView.spacing = 20
            stackView.axis = .vertical
            stackView.alignment = .center
            return stackView
        }()
    
    private lazy var titleLabel = CustomLabel(text: "Your rate to restaurant 😇", fontSize: 18, isBold: true)
    
    private lazy var starsContainer: UIStackView = {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didSelectRate))
            stackView.addGestureRecognizer(tapGesture)
            return stackView
        }()
    
    required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
            createStars()
            setupUI()
        }
    
    override init(frame: CGRect) {
            super.init(frame: frame)
            createStars()
            setupUI()
        }
    
    private func setupUI() {
            self.backgroundColor = .init(hexString: "#ffd5c2")
            
            self.addSubview(container)
            container.translatesAutoresizingMaskIntoConstraints = false
            starsContainer.translatesAutoresizingMaskIntoConstraints = false
        
            container.leftAnchor.constraint(equalTo: self.leftAnchor, constant: Constants.containerHorizontalInsets).isActive = true
            container.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -Constants.containerHorizontalInsets).isActive = true
            
            starsContainer.heightAnchor.constraint(equalToConstant: Constants.starContainerHeight).isActive = true

            container.addArrangedSubview(titleLabel)
            container.addArrangedSubview(starsContainer)
        }
    
    @objc func didSelectRate(gesture: UITapGestureRecognizer) {
        print("tapped")
           let location = gesture.location(in: starsContainer)
           let starWidth = starsContainer.bounds.width / CGFloat(Constants.starsCount)
           let rate = Int(location.x / starWidth) + 1
           
           /// if current star doesn't match selectedRate then we change our rating
           if rate != self.selectedRate {
               feedbackGenerator.selectionChanged()
               self.selectedRate = rate
           }
           
           /// loop through starsContainer arrangedSubviews and
           /// look for all Subviews of type UIImageView and change
           /// their isHighlighted state (icons depend on it)
           starsContainer.arrangedSubviews.forEach { subview in
               guard let starImageView = subview as? UIImageView else {
                   return
               }
               starImageView.isHighlighted = starImageView.tag <= rate
           }
       }
    
     func createStars() {
            /// loop through the number of our stars and add them to the stackView (starsContainer)
            for index in 1...Constants.starsCount {
                let star = makeStarIcon()
                star.tag = index
                starsContainer.addArrangedSubview(star)
            }
        }
        
        private func makeStarIcon() -> UIImageView {
            /// declare default icon and highlightedImage
            let imageView = UIImageView(image: #imageLiteral(resourceName: "icon_unfilled_star"), highlightedImage: #imageLiteral(resourceName: "icon_filled_star"))
            imageView.contentMode = .scaleAspectFit
            imageView.isUserInteractionEnabled = true
            return imageView
        }
    
    private struct Constants {
            static let starsCount: Int = 5
            
            static let sendButtonHeight: CGFloat = 50
            static let containerHorizontalInsets: CGFloat = 30
            static let starContainerHeight: CGFloat = 40
        }
}
