//
//  viewRound.swift
//  Fitness App
//
//  Created by Hamza on 02/01/2020.
//  Copyright © 2020 Hamza. All rights reserved.
//

import UIKit

class viewRound: UIView {
    
    override func awakeFromNib() {
        
        self.layer.cornerRadius = self.frame.size.height / 2
        
        self.clipsToBounds = true
        
    }
    
}
