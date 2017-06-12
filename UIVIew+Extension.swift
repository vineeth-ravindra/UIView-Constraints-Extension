//
//  UIVIew+Extension.swift
//  Worksite
//
//  Created by Vineeth Venugopal Ravindra on 5/31/17.
//

import Foundation

extension UIView {
    func createViewDict(views: [UIView]) -> [String: UIView] {
        var retDict = [String: UIView]()
        for (index, view) in views.enumerated() {
            view.translatesAutoresizingMaskIntoConstraints = false
            let key = "v\(index)"
            retDict[key] = view
        }
        return retDict
    }
    
    func addConstraint(withFormat format: String, forViews views: UIView...) {
        guard views.count > 0 else { return }
        let viewDict = createViewDict(views: views)
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                          options: NSLayoutFormatOptions(),
                                                          metrics: nil, views: viewDict))
    }
    
    func learnModuleConstraints(forView view: UIView, segmentedControll: UISegmentedControl) {
        addConstraint(withFormat: "H:|-16-[v0]-16-|", forViews: view)
        addConstraint(NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal,
                                              toItem: segmentedControll, attribute: .bottom, multiplier: 1 , constant: 20))
        addConstraint(NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal,
                                              toItem: self, attribute: .bottom, multiplier: 1 , constant: -10))
    }
}

