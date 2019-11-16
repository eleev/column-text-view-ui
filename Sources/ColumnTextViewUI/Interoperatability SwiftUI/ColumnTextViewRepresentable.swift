//
//  ColumnTextViewRepresentable.swift
//  ColumnTextViewUI
//
//  Created by Astemir Eleev on 16.11.2019.
//  Copyright © 2019 Astemir Eleev. All rights reserved.
//

#if canImport(SwiftUI)
import SwiftUI
#endif

@available(iOS 13, *)
public struct ColumnTextViewRepresentable: UIViewRepresentable {

    // MARK: - State Properties
    
    @State public private(set) var size: CGSize
    @State public private(set) var attributedString: NSMutableAttributedString
    @State public private(set) var backgroundColor: UIColor = .white
    @State public private(set) var font: UIFont? = nil
    @State public private(set) var fontSize: CGFloat = 0.0
    @State public private(set) var textColor: UIColor? = nil
    
    // MARK: - Conformance to UIViewRepresentable protocol

    public typealias UIViewType = ColumnTextView
    
    public func makeUIView(context: UIViewRepresentableContext<ColumnTextViewRepresentable>) -> UIViewType {
        .init(frame: .init(origin: .zero, size: size))
    }
    
    public func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<ColumnTextViewRepresentable>) {
        uiView.attributedText = attributedString
        uiView.backgroundColor = backgroundColor
        uiView.font = font
        uiView.fontSize = fontSize
        uiView.textColor = textColor
    }
}
