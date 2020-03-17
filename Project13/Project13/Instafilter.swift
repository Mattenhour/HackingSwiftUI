//
//  Instafilter.swift
//  Project13
//
//  Created by Matt Ridenhour on 3/8/20.
//  Copyright © 2020 Matt Ridenhour. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct Instafilter: View {
    @State private var filterIntensity = 0.5
    
    @State private var showingFilterSheet = false
    @State private var showingImagePicker = false
    @State private var showingAlert = false
    
    @State private var image: Image?
    @State private var inputImage: UIImage?
    @State private var processedImage: UIImage?
    
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    
    @State private var filterName = "Change Filter"
    
    let context = CIContext()
    
    
    var body: some View {
        let intensity = Binding<Double>(
            get: {
                self.filterIntensity
            },
            set: {
                self.filterIntensity = $0
                self.applyProcessing()
            }
        )
        
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)

                    // display the image
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    // select an image
                    self.showingImagePicker = true
                }

                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }.padding(.vertical)

                HStack {
                    Button("\(filterName)") {
                        self.showingFilterSheet = true
                    }

                    Spacer()

                    Button("Save") {
                        // save the picture
                        guard let processedImage = self.processedImage
                        else {
                            self.showingAlert = true
                            return
                        }

                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                        }
                        
                        imageSaver.errorHandler = {
                            print("oops: \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(title: Text("Select a filter"), buttons: [
                    .default(Text("Crystallize")) { self.setFilter(CIFilter.crystallize()); self.filterName = "Crystallize"},
                    .default(Text("Edges")) { self.setFilter(CIFilter.edges()); self.filterName = "Edges" },
                    .default(Text("Gaussian Blur")) { self.setFilter(CIFilter.gaussianBlur()); self.filterName = "Gaussian Blu" },
                    .default(Text("Pixellate")) { self.setFilter(CIFilter.pixellate()); self.filterName = "Pixellate" },
                    .default(Text("Sepia Tone")) { self.setFilter(CIFilter.sepiaTone()); self.filterName = "Sepia Tone" },
                    .default(Text("Unsharp Mask")) { self.setFilter(CIFilter.unsharpMask()); self.filterName = "Unsharp Mask" },
                    .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()); self.filterName = "Vignette" },
                    .cancel()
                ])
            }
            
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error: No image selected"), message: Text("Please select an image"), dismissButton: .default(Text("Okay")))
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        
        let beginImage = CIImage(image: inputImage)
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        let inputKeys = currentFilter.inputKeys
        
        // Guards to allow filters to work with slider
        if inputKeys.contains(kCIInputIntensityKey) {
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        }
        if inputKeys.contains(kCIInputRadiusKey) {
            currentFilter.setValue(filterIntensity * 200, forKey: kCIInputRadiusKey)
        }
        if inputKeys.contains(kCIInputScaleKey) {
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey)
        }
        
        /*
        Convert output from our filter to a SwiftUI Image that can display in our view
         */
        
        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else { return }
        
        // attempt to get a CGImage from our CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            
            // convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)
            
            // and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
            
            processedImage = uiImage
        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct Instafilter_Previews: PreviewProvider {
    static var previews: some View {
        Instafilter()
    }
}
