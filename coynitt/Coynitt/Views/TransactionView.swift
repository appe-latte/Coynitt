//
//  TransactionView.swift
//  Coynitt
//
//  Created by Stanford L. Khumalo on 2022-10-11.
//

import SwiftUI
import Charts

struct TransactionView: View {
    @State var rowHeight = 50.0 // sets row height for list
    
    @EnvironmentObject var transactionViewModel: TransactionViewModel
    
    // MARK: Environment Values
    @Environment(\.self) var env
    @Namespace var animation
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 15){
                HStack(spacing: 15){
                    
                    Text("Transactions")
                        .font(.subheadline)
                        .fontWeight(.bold)
                        .foregroundColor(cynWhite)
                        .textCase(.uppercase)
                        .kerning(5)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Button {
                        transactionViewModel.showFilterView = true
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .foregroundColor(cynBlack)
                            .frame(width: 40, height: 40)
                            .background(cynWhite,in: RoundedRectangle(cornerRadius: 10, style: .continuous))
                        
                    }
                }
                
                CustomSegmentedControl()
                    .padding(.top)
                
                // MARK: Currently Filtered Date With Amount
                VStack(spacing: 15){
                    Text(transactionViewModel .convertDateToString())
                        .opacity(0.7)
                    
                    Text(transactionViewModel.convertExpensesToCurrency(expenses: transactionViewModel.expenses, type: transactionViewModel.tabName))
                        .font(.title.bold())
                        .opacity(0.9)
                        .animation(.none, value: transactionViewModel.tabName)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background{
                    RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .fill(.white)
                }
                .padding(.vertical,20)
                
                ForEach(transactionViewModel.expenses.filter{
                    return $0.type == transactionViewModel.tabName
                }){expense in
                    TransactionCardView(expense: expense)
                        .environmentObject(transactionViewModel)
                }
            }
            .padding()
        }
        .navigationBarHidden(true)
        .overlay {
            FilterView()
        }
    }
    
    // MARK: Filter View
    @ViewBuilder
    func FilterView()->some View{
        ZStack{
            Color.black
                .opacity(transactionViewModel.showFilterView ? 0.25 : 0)
                .ignoresSafeArea()
            
            // MARK: Based On the Date Filter Expenses Array
            if transactionViewModel.showFilterView{
                VStack(alignment: .leading, spacing: 10) {
                    Text("Start Date")
                        .font(.caption)
                        .opacity(0.7)
                    
                    DatePicker("", selection: $transactionViewModel.startDate,in: Date.distantPast...Date(), displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                    
                    Text("End Date")
                        .font(.caption)
                        .opacity(0.7)
                        .padding(.top,10)
                    
                    DatePicker("", selection: $transactionViewModel.endDate,in: Date.distantPast...Date(), displayedComponents: [.date])
                        .labelsHidden()
                        .datePickerStyle(.compact)
                }
                .padding(20)
                .background{
                    RoundedRectangle(cornerRadius: 10, style: .continuous)
                        .fill(.white)
                }
                // MARK: Close Button
                .overlay(alignment: .topTrailing, content: {
                    Button {
                        transactionViewModel.showFilterView = false
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .font(.title3)
                            .foregroundColor(.black)
                            .padding(5)
                    }
                })
                .padding()
            }
        }
        .animation(.easeInOut, value: transactionViewModel.showFilterView)
    }
    
    // MARK: Custom Segmented Control
    @ViewBuilder
    func CustomSegmentedControl() -> some View {
        HStack(spacing: 0){
            ForEach([ExpenseType.income,ExpenseType.expense],id: \.rawValue){ tab in
                Text(tab.rawValue.capitalized)
                    .fontWeight(.semibold)
                    .foregroundColor(transactionViewModel.tabName == tab ? .white : .black)
                    .opacity(transactionViewModel.tabName == tab ? 1 : 0.7)
                    .padding(.vertical,12)
                    .frame(maxWidth: .infinity)
                    .background {
                        // MARK: With Matched Geometry Effect
                        if transactionViewModel.tabName == tab {
                            RoundedRectangle(cornerRadius: 10, style: .continuous)
                                .fill(
                                    LinearGradient(colors: [
                                        Color("Gradient1"),
                                        Color("Gradient2"),
                                        Color("Gradient3"),
                                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                                )
                                .matchedGeometryEffect(id: "TAB", in: animation)
                        }
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        withAnimation {
                            transactionViewModel.tabName = tab
                        }
                    }
            }
        }
        .padding(5)
        .background{
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .fill(.white)
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionView()
            .environmentObject(TransactionViewModel())
    }
}

struct TransactionCardView: View {
    var expense: Expense
    @EnvironmentObject var transactionViewModel: TransactionViewModel
    
    var body: some View {
        HStack(spacing: 12){
            // MARK: First Letter Avatar
            if let first = expense.remark.first {
                
                Text(String(first))
                    .font(.title)
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background{
                        Circle()
                            .fill(Color(expense.color))
                        //                            .fill(expense.color)
                        
                    }
                
            }
            
            Text(expense.remark)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity,alignment: .leading)
            
            VStack(alignment: .trailing, spacing: 7) {
                // MARK: Displaying Price
                let price = transactionViewModel.convertNumberToPrice(value: expense.type == .expense ? -expense.amount : expense.amount)
                Text(price)
                    .font(.callout)
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .kerning(1)
                    .opacity(0.7)
                    .foregroundColor(expense.type == .expense ? cynOrange : cynGreen2)
                
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .fontWeight(.medium)
                    .textCase(.uppercase)
                    .kerning(1)
                    .opacity(0.5)
            }
        }
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
        }
    }
}
