//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Zimeng Yang on 2/25/26.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Query var toDos: [ToDo]
    @State private var sheetIsPresented = false
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(toDos) { toDo in // no longer need id as SwiftData automatically creates a unique id
                    HStack {
                        Image(systemName: toDo.isCompleted ? "checkmark.rectangle" : "rectangle")
                            .onTapGesture {
                                toDo.isCompleted.toggle()
                                guard let _ = try? modelContext.save() else {
                                    print("😡 Error: Save after .toggle on ToDoListView did not work.")
                                    return
                                }
                            }
                        
                        NavigationLink {
                            DetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                    }
                    .font(.title2)
                }
                .onDelete { indexSet in
                    indexSet.forEach({ modelContext.delete(toDos[$0]) })
                    guard let _ = try? modelContext.save() else {
                        print("😡 Error: Save after .delete on ToDoListView did not work.")
                        return
                    }
                }
//                Section {
//                    NavigationLink {
//                        DetailView()
//                    } label: {
//                        Text("Winter")
//                    }
//                    Text("Summer")
//                } header: {
//                    Text("Breaks")
//                }
//                
//                Section {
//                    Text("Spring")
//                    Text("Fall")
//                } header: {
//                    Text("Semesters")
//                }
            }
            .navigationTitle("To Do List:  ") // MUST be inside the NavigationStack
            .listStyle(.plain)
            .sheet(isPresented: $sheetIsPresented) {
                NavigationStack {
                    DetailView(toDo: ToDo())
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        sheetIsPresented.toggle()
                    } label: {
                         Image(systemName: "plus")
                    }

                }
            }
        }
    }
}

#Preview {
    ToDoListView()
        .modelContainer(for: ToDo.self, inMemory: true)
}
