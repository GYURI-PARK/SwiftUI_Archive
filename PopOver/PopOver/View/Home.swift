//
//  Home.swift
//  PopOver
//
//  Created by GYURI PARK on 2023/05/09.
//

import SwiftUI

struct Home: View {
    @State private var showPopover: Bool = false
    
    var body: some View {
        Button("Show Popover") {
            showPopover.toggle()
        }
        .iOSPopover(isPresented: $showPopover, arrowDirection: .down) {
            VStack{
                Text("Hello, it's me, Popver")
            }
                .padding(15)
        } // 5:28
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View{
    @ViewBuilder
    func iOSPopover<Content: View>(isPresented: Binding<Bool>, arrowDirection:
                                   UIPopoverArrowDirection, @ViewBuilder content: @escaping () -> Content)->some View {
        self
            .background {
                PopOverController(isPresented: isPresented, arrowDirection: arrowDirection, content: content())
            }
    }
}

struct PopOverController<Content: View>: UIViewControllerRepresentable{
    
    @Binding var isPresented: Bool
    var arrowDirection: UIPopoverArrowDirection
    var content: Content
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        controller.view.backgroundColor = .clear
        return controller
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        if isPresented{
            // presenting popover
            let controller = CustomHostingView(rootView: content)
            controller.view.backgroundColor = .clear
            controller.modalPresentationStyle = .popover
            controller.popoverPresentationController?.permittedArrowDirections = arrowDirection
            
            // Connecting Delegate
            controller.presentationController?.delegate = context.coordinator
            // We need to attach the source view so that it will show arrow at correct position
            controller.popoverPresentationController?.sourceView = uiViewController.view
            // Simply Presenting Popover Controller
            uiViewController.present(controller, animated: true)
        }
    }
    
    // Forcing it to show Popover using PresentationDelegate
    class Coordinator: NSObject, UIPopoverPresentationControllerDelegate {
        var parent: PopOverController
        init(parent: PopOverController) {
            self.parent = parent
        }
        
        func adaptivePresentationStyle(for controller: UIPresentationController) ->
        UIModalPresentationStyle {
            return .none
        }
        
        // Observing the status of the popover
        // when it's dismissed updating the isPresented State
        func presentationControllerWillDismiss(_ presentationController: UIPresentationController) {
            parent.isPresented = false
        }
    }
}

// Custom hosting controller for wrapping to it's SwiftUI view Size
class CustomHostingView<Content: View>: UIHostingController<Content>{
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = view.intrinsicContentSize
    }
}
