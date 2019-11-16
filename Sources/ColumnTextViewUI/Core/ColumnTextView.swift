//
//  ColumnTextView.swift
//  ColumnTextViewUI
//
//  Created by Astemir Eleev on 16.11.2019.
//  Copyright © 2019 Astemir Eleev. All rights reserved.
//

import UIKit

@IBDesignable
final public class ColumnTextView: UIView {
    
    // MARK: - Private Properties
    
    private var columnWrapperTextView: WrapperTextView!
    private var scrollView: UIScrollView!
    
    // MARK: - Public Properties
    
    @IBInspectable public var attributedText: NSMutableAttributedString = .init() {
        didSet {
            columnWrapperTextView.attributedText = attributedText
            updateScrollViewContentSize()
        }
    }
    
    @IBInspectable public var font: UIFont? {
        didSet {
            columnWrapperTextView.font = font
            updateScrollViewContentSize()
        }
    }
    
    @IBInspectable public var fontSize: CGFloat = 0.0 {
        didSet {
            columnWrapperTextView.fontSize = fontSize
            updateScrollViewContentSize()
        }
    }
    
    @IBInspectable public var textAlignment: NSTextAlignment = .natural {
        didSet {
            columnWrapperTextView.textAlignment = textAlignment
            updateScrollViewContentSize()
        }
    }
    
    @IBInspectable public var textColor: UIColor? {
        didSet {
            columnWrapperTextView.textColor = textColor
            updateScrollViewContentSize()
        }
    }
    
    @IBInspectable public var interColumnMargin: CGFloat = 8 {
        didSet {
            columnWrapperTextView.interColumnMargin = interColumnMargin
        }
    }
    @IBInspectable public var leadingPadding: CGFloat = 16 {
        didSet {
            columnWrapperTextView.leadingPadding = leadingPadding
        }
    }
    @IBInspectable public var trailingPadding: CGFloat = 16 {
        didSet {
            columnWrapperTextView.trailingPadding = trailingPadding
        }
    }
    @IBInspectable public var topPadding: CGFloat = 32 {
        didSet {
            columnWrapperTextView.topPadding = topPadding
        }
    }
    @IBInspectable public var bottomPadding: CGFloat = 32 {
        didSet {
            columnWrapperTextView.bottomPadding = bottomPadding
        }
    }
    
    public var columns: WrapperTextView.ColumnUnit = .columns(2) {
        didSet {
            columnWrapperTextView.columns = columns
        }
    }
    
    public override var backgroundColor: UIColor? {
        didSet {
            columnWrapperTextView.backgroundColor = backgroundColor
        }
    }
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        columnWrapperTextView = .init(frame: frame, columns: .columns(4))
        
        scrollView = UIScrollView(frame: frame)
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        scrollView.addSubview(columnWrapperTextView)
        addSubview(scrollView)
        
        updateScrollViewContentSize()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Utility
    
    private func updateScrollViewContentSize() {
        scrollView.contentSize = columnWrapperTextView.bounds.size
    }
}
