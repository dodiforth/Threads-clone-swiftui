//
//  String.swift
//  ThreadsClone
//
//  Created by Dowon Kim on 01/07/2024.
//

import UIKit

extension String {
    
    func heightWithContrainedWidth(_ width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        
        let boundingBox = self.boundingRect(with: constraintRect, 
                                            options: NSStringDrawingOptions.usesLineFragmentOrigin,
                                            attributes: [NSAttributedString.Key.font: font],
                                            context: nil)
        
        return ceil(boundingBox.height)
    }
    
}
