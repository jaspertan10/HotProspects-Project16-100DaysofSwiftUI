//
//  MeView.swift
//  HotProspects
//
//  Created by Jasper Tan on 3/3/25.
//

//Bring in core image filters
import CoreImage.CIFilterBuiltins

import SwiftUI

struct MeView: View {
    
    @AppStorage("name") private var name = "Anonymous"
    @AppStorage("emailAddress") private var emailAddress = "you@yoursite.com"
    
    //Store an active CoreImage context
    let context = CIContext()
    
    // instance of Core Image's QR code generator filter
    let filter = CIFilter.qrCodeGenerator()
    
    @State private var qrCode = UIImage()
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                    .textContentType(.name)
                    .font(.title)
                
                TextField("Email address", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .font(.title)
                
                Image(uiImage: qrCode)
                    .interpolation(.none)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .contextMenu {
                        ShareLink(item: Image(uiImage: qrCode), preview: SharePreview("My QR Code", image: Image(uiImage: qrCode)))
                    }
            }
            .navigationTitle("Your code")
            .onAppear(perform: updateCode)
            .onChange(of: name, updateCode)
            .onChange(of: emailAddress, updateCode)
        }
    }
    
    /*
     To make a QR code itself:
     1. Provide some input data, convert output to CIImage
     2. Convert CGImage in to UI Image
     3. Display QR Code
     
     There is a problem however:
     1. Our input for the filter is a string, but input for the filter is Data, so we need to convert
     2. If conversion fails for any reason, we wll send back "xmark.circle" system image
     3. If that can't be read, send back an empty UIImage
     */
    func generateQRCode(from string: String) -> UIImage {
        filter.message = Data(string.utf8)
        
        if let outputImage = filter.outputImage {
            if let cgImage = context.createCGImage(outputImage, from: outputImage.extent) {
                return UIImage(cgImage: cgImage)
            }
        }
        
        return UIImage(systemName: "xmark.circle") ?? UIImage()
    }
    
    func updateCode() {
        qrCode = generateQRCode(from: "\(name)\n\(emailAddress)")
    }
    
}

#Preview {
    MeView()
}
