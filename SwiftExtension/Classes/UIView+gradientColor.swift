
extension UIView {

    func gradientColor(colors:[CGColor]? = nil) -> UIColor? {
          let gradientLayer = getGradientLayer(colors: colors)
//          let bounds = self.bounds
          UIGraphicsBeginImageContext(gradientLayer.bounds.size)
          gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
          let image = UIGraphicsGetImageFromCurrentImageContext()
          UIGraphicsEndImageContext()
          return UIColor(patternImage: image!)
    }

     func getGradientLayer(colors:[CGColor]? = nil) -> CAGradientLayer{
        let bounds = self.bounds
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        // gradient colors in order which they will visually appear
        gradient.colors = colors ?? [UIColor.red.cgColor, UIColor.green.cgColor]

        // Gradient from left to right
        gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        return gradient
    }

}
