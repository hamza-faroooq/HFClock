//
//  ViewController1.swift
//  NewClock
//
//  Created by Hamza on 02/04/2021.
//

import UIKit

class ViewController1: UIViewController {
    
    @IBOutlet weak var secondPart2StackView: UIStackView!
    @IBOutlet weak var secondPart2CenterView: UIView!
    
    @IBOutlet weak var secondPart1StackView: UIStackView!
    @IBOutlet weak var secondPart1CenterView: UIView!
    
    @IBOutlet weak var minutePart2StackView: UIStackView!
    @IBOutlet weak var minutePart2CenterView: UIView!
    
    @IBOutlet weak var minutePart1StackView: UIStackView!
    @IBOutlet weak var minutePart1CenterView: UIView!
    
    @IBOutlet weak var hourPart2StackView: UIStackView!
    @IBOutlet weak var hourPart2CenterView: UIView!
    
    @IBOutlet weak var hourPart1StackView: UIStackView!
    @IBOutlet weak var hourPart1CenterView: UIView!
    
    var areaToTranslate: CGFloat = 60.0 + 8
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        setupCenterViews(view: secondPart2CenterView)
        setupCenterViews(view: secondPart1CenterView)
        setupCenterViews(view: minutePart2CenterView)
        setupCenterViews(view: minutePart1CenterView)
        setupCenterViews(view: hourPart2CenterView)
        setupCenterViews(view: hourPart1CenterView)
        
        self.getDetailsFromCurrentDate()
        
    }
    
    func setupCenterViews(view: UIView) {
        
        view.backgroundColor = .clear
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 3
        view.layer.borderColor = UIColor.black.cgColor
        
    }
    
    func getDetailsFromCurrentDate() {
        
        let currentSecond = Calendar.current.component(.second, from: Date())
        let currentMinute = Calendar.current.component(.minute, from: Date())
        let currentHour = Calendar.current.component(.hour, from: Date())
        
        splitTime(isHour: false, isMinute: false, isSecond: true, timeToSplit: currentSecond)
        splitTime(isHour: false, isMinute: true, isSecond: false, timeToSplit: currentMinute)
        splitTime(isHour: true, isMinute: false, isSecond: false, timeToSplit: currentHour)
        
    }
    
    func splitTime(isHour: Bool, isMinute: Bool, isSecond: Bool, timeToSplit: Int) {
        
        let currentTimeInString = String(describing: timeToSplit)
        let currentTimeInSplitArrayInString = currentTimeInString.compactMap({ $0 })
        let currentTimeInSplitArrayInInt = currentTimeInSplitArrayInString.compactMap({
            Int(String(describing: $0))
        })
        
        print("currentTimeInSplitArrayInInt: \(currentTimeInSplitArrayInInt)")
        
        if currentTimeInSplitArrayInInt.count == 1 {
         
            self.animateTimeView(isHour: isHour, isMinute: isMinute, isSecond: isSecond, part1: 0, part2: CGFloat(currentTimeInSplitArrayInInt[0]))
            
        } else {
            
            self.animateTimeView(isHour: isHour, isMinute: isMinute, isSecond: isSecond, part1: CGFloat(currentTimeInSplitArrayInInt[0]), part2: CGFloat(currentTimeInSplitArrayInInt[1]))
            
        }
        
    }
    
    func animateTimeView(isHour: Bool, isMinute: Bool, isSecond: Bool, part1: CGFloat, part2: CGFloat) {
        
        UIView.animate(withDuration: 1.0) {
            
            if isSecond {
                
                self.secondPart2StackView.transform = CGAffineTransform(translationX: 0, y: -self.areaToTranslate * part2)
                
                self.secondPart1StackView.transform = CGAffineTransform(translationX: 0, y: -self.areaToTranslate * part1)
                
            } else if isMinute {
                
                self.minutePart2StackView.transform = CGAffineTransform(translationX: 0, y: -self.areaToTranslate * part2)
                
                self.minutePart1StackView.transform = CGAffineTransform(translationX: 0, y: -self.areaToTranslate * part1)
                
            } else {
                
                self.hourPart2StackView.transform = CGAffineTransform(translationX: 0, y: -self.areaToTranslate * part2)
                
                self.hourPart1StackView.transform = CGAffineTransform(translationX: 0, y: -self.areaToTranslate * part1)
                
            }
            
        } completion: { (result) in
            
            if isSecond {
             
                self.getDetailsFromCurrentDate()
                
            }
            
        }
        
    }
    
}
