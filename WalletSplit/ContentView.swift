import SwiftUI

struct ContentView: View {
    @State private var amount = ""
    @State private var selectedNumberOfPeople = 0
    @State private var selectedTip = 0
    private let tipPercentages = [0, 5, 10, 15, 20, 25]
    
    private var perPersonAmount: Double {
        let _amount = Double(amount) ?? 0
        let numberOfPeople = Double(selectedNumberOfPeople + 2)
        let tip = (_amount * Double(tipPercentages[selectedTip])) / 100
        let totalAmount = _amount + tip
        let perPerson = totalAmount / numberOfPeople
        return perPerson
    }
    
    var body: some View {
        NavigationView {
            Form{
                Section {
                    TextField("Enter the amount", text: $amount)
                        .keyboardType(.decimalPad)
                }
                Section {
                    Picker(
                        selection: $selectedNumberOfPeople,
                        label: Text("Number of people"),
                        content: {
                            ForEach(2..<100) {
                                Text($0.description)
                            }
                        })
                }
                
                Section(header: (Text("Select tip percent"))) {
                    Picker(
                        selection: $selectedTip,
                        label: Text("Picker"),
                        content: {
                            ForEach(0..<tipPercentages.count) { tipPercent in
                                Text("\(tipPercentages[tipPercent]) %")
                            }
                        })
                        .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Text("$ \(perPersonAmount.description)")
                        .foregroundColor(tipPercentages[selectedTip] == 0 ? Color.red : Color.white)
                }
            }
            .navigationBarTitle(Text("Contry app"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



// navigation bar title
