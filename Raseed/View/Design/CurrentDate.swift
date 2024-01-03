//
//  CurrentDate.swift
//  Raseed
//
//  Created by Sara on 18/06/1445 AH.
//

import SwiftUI

struct CurrentDate: View {
    @State private var formattedDate = ""
    var body: some View {
         VStack {
             // Display the formatted date using a Text view
             
            Text(formattedDate)
                .font(.headline)
                // .padding()
         }
         .onAppear {
            //  Call the function to update the date when the view appears
             updateDate()
             
             // Set up a timer to update the date periodically (every 1 second in this example)
             Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
                updateDate()
             }
        }
         
    
    }
    private func updateDate() {
          let currentDate = Date()

          let dateFormatter = DateFormatter()
          dateFormatter.dateFormat = "dd MMMM yyyy "                                            // Format for day, month, and year

         formattedDate = dateFormatter.string(from: currentDate)
      }
}

#Preview {
    CurrentDate()
}
