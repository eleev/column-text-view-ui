//
//  WrapperTextView.swift
//  ColumnTextViewUI
//
//  Created by Astemir Eleev on 16.11.2019.
//  Copyright © 2019 Astemir Eleev. All rights reserved.
//

import UIKit

@IBDesignable
final public class WrapperTextView: UIView {
    
    // MARK: - Private Properties
    
    private var storage: NSTextStorage!
    private var layout: NSLayoutManager!
    private var containers: [(storage: NSTextContainer, origin: CGPoint)] = []
    
    // MARK: - Public Types
    
    public enum ColumnUnit {
        
        // MARK: - Cases
        
        /// Coluns per screen width
        case columns(UInt16)
        /// Absolute column width value
        case absolute(UInt16)
        
        // MARK: - Properties
        
        func getValue(interColumnMargin: CGFloat, bounds: CGRect, padding: (leading: CGFloat, trailing: CGFloat)) -> CGFloat {
            switch self {
            case .columns(let value):
                let margin = interColumnMargin * (CGFloat(value) - 1)
                return CGFloat((bounds.width - padding.leading - padding.trailing) - margin) / CGFloat(value)
            case .absolute(let value):
                return CGFloat(value)
            }
        }
    }
    
    // MARK: - Public Properties
    
    @IBInspectable public var attributedText: NSMutableAttributedString = .init(string: "") {
        didSet {
            commonInit()
        }
    }
    
    @IBInspectable public var interColumnMargin: CGFloat = 8 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable public var leadingPadding: CGFloat = 16 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable public var trailingPadding: CGFloat = 16 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable public var topPadding: CGFloat = 32 {
        didSet {
            setNeedsDisplay()
        }
    }
    @IBInspectable public var bottomPadding: CGFloat = 32 {
        didSet {
            setNeedsDisplay()
        }
    }
    
    public var columns: ColumnUnit = .columns(2) {
        didSet {
            setNeedsDisplay()
            createColumns()
        }
    }
    
    @IBInspectable public var font: UIFont? {
        didSet {
            guard let font = font else { return }
            
            updateStorage(with: .font) { (key, value) -> Any? in
                font
            }
        }
    }
    
    @IBInspectable public var fontSize: CGFloat = 0.0 {
        didSet {
            guard fontSize >= 0.0 else { return }
            
            updateStorage(with: .font) { (key, value) -> Any? in
                guard let font = value as? UIFont else {
                    return nil
                }
                return font.withSize(fontSize)
            }
        }
    }
    
    @IBInspectable public var textAlignment: NSTextAlignment = .natural {
        didSet {
            updateStorage(with: .paragraphStyle) { (key, value) -> Any? in
                let paraStyle = NSMutableParagraphStyle()
                paraStyle.alignment = textAlignment
                return paraStyle
            }
        }
    }
    
    @IBInspectable public var textColor: UIColor? {
        didSet {
            updateStorage(with: .foregroundColor) { (key, value) -> Any? in
                textColor
            }
        }
    }
    
    private func updateStorage(with key: NSAttributedString.Key, closure: (_ key: NSAttributedString.Key, _ value: Any?) -> Any?) {
        let range: NSRange = .init(location: 0, length: attributedText.length)
        
        storage.enumerateAttribute(key, in: range, options: []) { (value, range, shouldStop) in
            if let attribute = closure(key, value) {
                storage.removeAttribute(key, range: range)
                storage.addAttribute(key, value: attribute, range: range)
            }
        }
        storage.edited(.editedAttributes, range: range, changeInLength: 0)
        storage.invalidateAttributes(in: range)

        setNeedsDisplay()
        createColumns()
    }
    
    // MARK: - Initializers
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    public init(frame: CGRect, columns: ColumnUnit) {
        super.init(frame: frame)
        self.columns = columns
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        commonInit()
    }
    
    // MARK: - Overrides
    
    public override func draw(_ rect: CGRect) {
        for (container, point) in containers {
            let range = layout.glyphRange(for: container)
            layout.drawGlyphs(forGlyphRange: range, at: point)
        }
        super.draw(rect)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        createColumns()
        setNeedsDisplay()
    }
    
    // MARK: - Private Methods
    
    private func commonInit() {
        layout = .init()
        storage = NSTextStorage(attributedString: attributedText)
        storage.addLayoutManager(layout)
        
        setNeedsDisplay()
        createColumns()
    }
    
    private func createColumns() {
        for _ in layout.textContainers {
            layout.removeTextContainer(at: 0)
        }
        containers.removeAll()
        
        let bounds = self.bounds
        let columnWidth = self.columns.getValue(interColumnMargin: interColumnMargin,
                                                bounds: superview?.bounds ?? bounds,
                                                padding: (leading: leadingPadding, trailing: trailingPadding))
        let rowHeight = bounds.size.height - (bottomPadding + topPadding)
        
        let columnSize = CGSize(width: columnWidth, height: rowHeight)
        var x = bounds.origin.x + leadingPadding
        let y: CGFloat = topPadding
        
        var boundsWidth: CGFloat = 0
        
        while needsMoreColumns() {
            let container = NSTextContainer(size: columnSize)
            layout.addTextContainer(container)
            
            containers.append((container, .init(x: x, y: y)))
            
            let columnWithMargin = columnWidth + interColumnMargin
            x += columnWithMargin
            boundsWidth += columnWithMargin
        }
        boundsWidth += leadingPadding + trailingPadding
        
        self.bounds.size = .init(width: boundsWidth, height: bounds.height)
        frame.origin = .init(x: 0, y: frame.origin.y)
    }
    
    private func needsMoreColumns() -> Bool {
        guard let lastContainr = layout.textContainers.last else {
            // Always create at least one column
            return true
        }
        let range = layout.glyphRange(for: lastContainr)
        let glyphs = layout.numberOfGlyphs
        return range.location + range.length < glyphs
    }
}
