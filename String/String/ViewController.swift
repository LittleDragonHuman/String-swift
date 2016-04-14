//
//  ViewController.swift
//  String
//
//  Created by fly on 16/4/12.
//  Copyright © 2016年 fly. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView: UIScrollView?
    var spaceLabel: UILabel?
    var encodeLabel: UILabel?
    var appendLabel: UILabel?
    var originTextField: UITextField?
    var btn: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.whiteColor()
        setUpViews()
    }

    func setUpViews() {
        
        let width: CGFloat = view.bounds.size.width - CGFloat(2 * 10)
        let height: CGFloat = 20.0
        
        scrollView = UIScrollView()
        scrollView?.frame = CGRectMake(10, 0, width, self.view.bounds.size.height)
        view.addSubview(scrollView!)
        
        originTextField = UITextField(frame: CGRectMake(0, 10, width, 2 * height))
        originTextField!.text = "m朝日      残莺伴    妾啼，m开帘只见草萋萋。    D庭前时有东风入，0杨柳千条尽向西。"
        originTextField!.font = UIFont.systemFontOfSize(14.0)
        originTextField!.backgroundColor = UIColor.yellowColor()
        scrollView?.addSubview(originTextField!)
        
        btn = UIButton(frame: CGRectMake(0, CGRectGetMaxY((originTextField?.frame)!) + 10, width, 2 * height))
        btn!.setTitle("转换", forState: UIControlState.Normal)
        btn!.titleLabel?.font = UIFont.systemFontOfSize(14.0)
        btn!.backgroundColor = UIColor.greenColor()
        btn!.addTarget(self, action: Selector("transform:"), forControlEvents: UIControlEvents.TouchUpInside)
        scrollView?.addSubview(btn!)

        spaceLabel = UILabel(frame: CGRectMake(0, 0, width, 0))
        spaceLabel!.text = "去除空格后：\n"
        spaceLabel!.numberOfLines = 0
        spaceLabel!.font = UIFont.systemFontOfSize(14.0)
        spaceLabel!.backgroundColor = UIColor.yellowColor()
        scrollView?.addSubview(spaceLabel!);
        
        encodeLabel = UILabel(frame: CGRectMake(0, 0, width, 0))
        encodeLabel!.text = "utf8后：\n"
        encodeLabel!.numberOfLines = 0
        encodeLabel!.font = UIFont.systemFontOfSize(14.0)
        encodeLabel!.backgroundColor = UIColor.yellowColor()
        scrollView?.addSubview(encodeLabel!);
        
        appendLabel = UILabel(frame: CGRectMake(0, 0, width, 0))
        appendLabel!.text = "拼接+转换后：\n"
        appendLabel!.numberOfLines = 0
        appendLabel!.font = UIFont.systemFontOfSize(14.0)
        appendLabel!.backgroundColor = UIColor.yellowColor()
        scrollView?.addSubview(appendLabel!);
    }
    
    func transform(sender: UIButton) {
        let origin: String! = originTextField?.text
        let spaceArray: [String] = origin.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let spaceResult: String = spaceArray.joinWithSeparator("")
        spaceLabel!.text = "去除空格后：\n\(spaceResult)"
        spaceLabel?.sizeToFit()
        var encodeResult = ""
        for codeUnit in origin.utf8 {
            encodeResult += "\(codeUnit) "
        }
        encodeLabel!.text = "utf8后：\n\(encodeResult)"
        encodeLabel?.sizeToFit()
        
        let tmpAppendResult: String = spaceResult + encodeResult
        var appendResult = ""
        for character in tmpAppendResult.characters {
            if character >= "a" && character <= "z" {
                appendResult += "\(String(character).uppercaseString)"
            }
            else if character >= "A" && character <= "Z" {
                appendResult += "\(String(character).lowercaseString)"
            }
            else {
                appendResult += "\(character)"
            }
        }
        appendLabel?.text = "拼接+转换后：\n\(appendResult)"
        appendLabel?.sizeToFit()
        
        adjustFrame()
    }
    
    func adjustFrame() {
        spaceLabel?.frame.origin.y = CGRectGetMaxY((btn?.frame)!) + 10
        encodeLabel?.frame.origin.y = CGRectGetMaxY((spaceLabel?.frame)!) + 10
        appendLabel?.frame.origin.y = CGRectGetMaxY((encodeLabel?.frame)!) + 10
        scrollView?.contentSize = CGSizeMake(view.bounds.size.width - CGFloat(2 * 10), CGRectGetMaxY((appendLabel?.frame)!) + 10)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

